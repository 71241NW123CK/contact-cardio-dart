import '../../contact_card.dart';
import '../email_address/email_address_contact_card.dart';
import '../phone_number/phone_number_contact_card.dart';

/// A MeCard address as specified by NTT Docomo's
/// [page for i-mode phonebook registration](https://web.archive.org/web/20160304025131/https://www.nttdocomo.co.jp/english/service/developer/make/content/barcode/function/application/addressbook/index.html)
class MeCardAddress {
  static MeCardAddress _deserialize(String serializedMeCardAddress) {
    final components = serializedMeCardAddress.split(",");
    if (components.length < 7) {
      return null;
    }
    final poBox = components[0];
    final roomNumber = components[1];
    final houseNumber = components[2];
    final city = components[3];
    final prefecture = components[4];
    final zipCode = components[5];
    final country = components.sublist(6).join(','); // At least one country's official name in English contains at least one comma.
    return MeCardAddress._(
        poBox.isEmpty ? null : poBox,
        roomNumber.isEmpty ? null : roomNumber,
        houseNumber.isEmpty ? null : houseNumber,
        city.isEmpty ? null : city,
        prefecture.isEmpty ? null : prefecture,
        zipCode.isEmpty ? null : zipCode,
        country.isEmpty ? null : country
    );
  }

  String _poBox;
  String _roomNumber;
  String _houseNumber;
  String _city;
  String _prefecture;
  String _zipCode;
  String _country;

  MeCardAddress._(
      this._poBox,
      this._roomNumber,
      this._houseNumber,
      this._city,
      this._prefecture,
      this._zipCode,
      this._country
  );

  /// The P.O. box number or `null` if the address does not contain a P.O. box
  /// number.
  String get poBox => _poBox;
  /// The room number or `null` if the address does not contain a room number.
  String get roomNumber => _roomNumber;
  /// The house number and street name or `null` if the address does not
  /// contain a house number and street name.
  String get houseNumber => _houseNumber;
  /// The city or `null` if the address does not contain a city.
  String get city => _city;
  /// The prefecture (or province, state, etc.) or `null` if the address does
  /// not contain such a region identifier.
  String get prefecture => _prefecture;
  /// The ZIP code (or other postal code) or `null` if the address does not
  /// contain such a code.
  String get zipCode => _zipCode;
  /// The country or `null` if the address does not contain a country.
  String get country => _country;

  String _serialize() =>
      [
        poBox ?? '',
        roomNumber ?? '',
        houseNumber ?? '',
        city ?? '',
        prefecture ?? '',
        zipCode ?? '',
        country ?? ''
      ]
      .join(',');
}

/// A [ContactCard] consisting of a MeCard as specified by NTT Docomo's
/// [page for i-mode phonebook registration](https://web.archive.org/web/20160304025131/https://www.nttdocomo.co.jp/english/service/developer/make/content/barcode/function/application/addressbook/index.html).
/// A MeCard may contain up to one name value (with the first comma treated as
/// specified by NTT Docomo), up to one "reading" value (again, with the first
/// comma treated as specified by NTT Docomo), zero or more "TEL" values, zero
/// or more "TEL-AV" values, zero or more email values, up to one "memo"
/// value, up to one birthday value, zero or more address values (with commas
/// treated as specified by NTT Docomo), zero or more URL values, and up to
/// one nickname value.
///
/// For the sake of ease of development and leniency, all types of components
/// where up to one instance may exist may occur more than once without
/// deserialization failing.  In such cases, the last occurrences of such
/// components are used and all other occurrences are ignored.
/// 
/// For the sake of forward compatibility, any component with an unspecified
/// tag will be ignored.
///
/// Canonical serialization occurs in the order listed above, preserving the
/// ordering of values of the same category as they appeared in the original
/// serialized form.  No deduping is performed.
/// There is no escaping for semicolons.  They are not allowed except as
/// delimiters.  Perhaps in the future they may be escaped by preceding
/// backslashes, with backslashes also so escaped.  Colons do not need
/// escaping, and may be used in memo and URL components.
class MeCardContactCard extends ContactCard
    implements EmailAddressContactCard, PhoneNumberContactCard {
  static const _meCardTag = 'MECARD';
  static const _nameTag = 'N';
  static const _readingTag = 'SOUND';
  static const _telTag = 'TEL';
  static const _telAvTag = 'TEL-AV';
  static const _emailTag = 'EMAIL';
  static const _memoTag = 'NOTE';
  static const _birthdayTag = 'BDAY';
  static const _addressTag = 'ADR';
  static const _urlTag = 'URL';
  static const _nicknameTag = 'NICKNAME';
  static final _meCardRegex = RegExp('^$_meCardTag:(.|[\\n\\r])*;\$');
  static final _birthdayRegex = RegExp(r'^[0-9]{8}$');

  /// Returns an instance of [MeCardContactCard] if the given `String`
  /// contains a MeCard; otherwise returns `null`.
  static MeCardContactCard deserialize(String serializedContactCard) {
    if (!_meCardRegex.hasMatch(serializedContactCard)) {
      return null;
    }
    final innerComponents = serializedContactCard.substring(_meCardTag.length + 1, serializedContactCard.length - 1).split(';');
    String name = null;
    String reading = null;
    List<String> telList = [];
    List<String> telAvList = [];
    List<String> emailList = [];
    String memo = null;
    String birthday = null;
    List<MeCardAddress> addressList = [];
    List<String> urlList = [];
    String nickname = null;
    for (var component in innerComponents) {
      final parts = component.split(':');
      if (parts.length == 1) {
        continue;
      }
      final tag = parts.first;
      final content = parts.sublist(1).join(':');
      switch (tag) {
        case _nameTag:
          name = content;
          break;
        case _readingTag:
          reading = content;
          break;
        case _telTag:
          /// TODO: validate the telephone number
          telList.add(content);
          break;
        case _telAvTag:
          /// TODO: validate the telephone number
          telAvList.add(content);
          break;
        case _emailTag:
          /// TODO: validate the email address
          emailList.add(content);
          break;
        case _memoTag:
          memo = content;
          break;
        case _birthdayTag:
          if (_birthdayRegex.hasMatch(content)) {
            birthday = content;
          }
          break;
        case _addressTag:
          final address = MeCardAddress._deserialize(content);
          if (address != null) {
            addressList.add(address);
          }
          break;
        case _urlTag:
          /// TODO: validate the URL
          urlList.add(content);
          break;
        case _nicknameTag:
          nickname = content;
          break;
      }
    }
    return MeCardContactCard._(
        name,
        reading,
        telList,
        telAvList,
        emailList,
        memo,
        birthday,
        addressList,
        urlList,
        nickname
    );
  }

  String _name;
  String _reading;
  List<String> _telList;
  List<String> _telAvList;
  List<String> _emailList;
  String _memo;
  String _birthday;
  List<MeCardAddress> _addressList;
  List<String> _urlList;
  String _nickname;

  MeCardContactCard._(
      this._name, // nullable
      this._reading, // nullable
      this._telList,
      this._telAvList,
      this._emailList,
      this._memo, // nullable
      this._birthday, // nullable
      this._addressList,
      this._urlList,
      this._nickname // nullable
  );

  /// The family name part of the name, or `null` if no family name is
  /// specified.
  String get nameFamilyName {
    if (_name == null) {
      return null;
    }
    final nameComponents = _name.split(',');
    if (nameComponents.length == 1) {
      return null; // you have no family lol
    } else {
      return nameComponents.first;
    }
  }

  /// The given name part of the name, or `null` if no given name is
  /// specified.
  String get nameGivenName {
    if (_name == null) {
      return null;
    }
    final nameComponents = _name.split(',');
    if (nameComponents.length == 1) {
      return _name;
    } else {
      final tailComponents = nameComponents.sublist(1);
      return tailComponents.join(",");
    }
  }

  /// The family name part of the reading, or `null` if no family name
  /// reading is specified.
  String get readingFamilyName {
    if (_reading == null) {
      return null;
    }
    final readingComponents = _reading.split(',');
    if (readingComponents.length == 1) {
      return null; // you have no family lol
    } else {
      return readingComponents.first;
    }
  }

  /// The given name part of the reading, or `null` if no given name reading
  /// is specified.
  String get readingGivenName {
    if (_reading == null) {
      return null;
    }
    final readingComponents = _reading.split(',');
    if (readingComponents.length == 1) {
      return _reading;
    } else {
      final tailComponents = readingComponents.sublist(1);
      return tailComponents.join(',');
    }
  }

  List<String> get emailAddressList => List.unmodifiable(_emailList);
  List<String> get phoneNumberList => List.unmodifiable(_telList + _telAvList);

  /// A list of the non-AV phone numbers.
  List<String> get telList => List.unmodifiable(_telList);

  /// A list of the AV phone numbers.
  List<String> get telAvList => List.unmodifiable(_telAvList);

  /// A memo, or `null` if not specified.
  String get memo => _memo;

  /// An eight digit string representing the birthday with the first four
  /// digits representing the year, the next two representing the month, and
  /// the last two representing the day, or `null` if not specified.
  DateTime get birthday {
    if (_birthday == null) {
      return null;
    }
    if (_birthday.length != 8) {
      return null;
    }
    final yearString = _birthday.substring(0, 4);
    final year = int.tryParse(yearString);
    if (year == null) {
      return null;
    }
    final monthString = _birthday.substring(4, 6);
    final month = int.tryParse(monthString);
    if (month == null) {
      return null;
    }
    final dayString = _birthday.substring(6);
    final day = int.tryParse(dayString);
    if (day == null) {
      return null;
    }
    return DateTime.utc(year, month, day);
  }

  /// A list of addresses in the form of [MeCardAddress]es.
  List<MeCardAddress> get addressList => List.unmodifiable(_addressList);

  /// A list of URLs.
  List<String> get urlList => List.unmodifiable(_urlList);

  /// The nickname, or `null` if not specified.
  String get nickname => _nickname;

  /// The full name, or `null` if no name is specified.
  String name({bool familyNameFirst: true}) {
    if (_name == null) {
      return null;
    }
    final nameComponents = _name.split(',');
    if (nameComponents.length == 1) {
      return _name;
    } else {
      final tailComponents = nameComponents.sublist(1);
      final givenName = tailComponents.join(',');
      final familyName = nameComponents.first;
      if (givenName.isEmpty) {
        return familyName;
      } else if (familyName.isEmpty) {
        return givenName;
      } else {
        return familyNameFirst
            ? '${familyName} ${givenName}'
            : '${givenName} ${familyName}';
      }
    }
  }

  /// The full reading, or `null` if no reading is specified.
  String reading({bool familyNameFirst: true}) {
    if (_reading == null) {
      return null;
    }
    final readingComponents = _reading.split(',');
    if (readingComponents.length == 1) {
      return _reading;
    } else {
      final tailComponents = readingComponents.sublist(1);
      final givenName = tailComponents.join(',');
      final familyName = readingComponents.first;
      if (givenName.isEmpty) {
        return familyName;
      } else if (familyName.isEmpty) {
        return givenName;
      } else {
        return familyNameFirst
            ? '${familyName} ${givenName}'
            : '${givenName} ${familyName}';
      }
    }
  }

  String serialize() {
    String formTag(String tag, String content) => '$tag:$content;';
    List<String> components = [];
    if (_name != null) {
      components.add(formTag(_nameTag, _name));
    }
    if (_reading != null) {
      components.add(formTag(_readingTag, _reading));
    }
    components += _telList.map((t) => formTag(_telTag, t)).toList();
    components += _telAvList.map((t) => formTag(_telAvTag, t)).toList();
    components += _emailList.map((e) => formTag(_emailTag, e)).toList();
    if (_memo != null) {
      components.add(formTag(_memoTag, _memo));
    }
    if (_birthday != null) {
      components.add(formTag(_birthdayTag, _birthday));
    }
    components +=
        _addressList
            .map((a) => formTag(_addressTag, a._serialize())).toList();
    components += _urlList.map((u) => formTag(_urlTag, u)).toList();
    if (_nickname != null) {
      components.add(formTag(_nicknameTag, _nickname));
    }
    return formTag(_meCardTag, components.join());
  }
}
