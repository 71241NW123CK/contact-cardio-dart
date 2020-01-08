import '../formats/v_card/v_card.dart';
import '../formats/v_card/v_card_enums.dart';

class VCardUtilities {
  static const crlf = '\r\n';

  static const lineWrapSpace = '\r\n ';
  static const lineWrapTab = '\r\n\t';
}

class VCardIanaBoundedParamValue extends IVCardIanaBoundedParamValue {
  static VCardIanaBoundedParamValue vCardIanaBoundedParamValue(
      VCardIanaParamValue value) {
    return value == null ? null : VCardIanaBoundedParamValue._(value);
  }

  final VCardIanaParamValue _value;

  VCardIanaBoundedParamValue._(this._value);

  VCardIanaParamValue get value => _value;
}

class VCardIanaUnboundedParamValue extends IVCardIanaUnboundedParamValue {
  static VCardIanaUnboundedParamValue vCardIanaUnboundedParamValue(
      String value) {
    return value == null ? null : VCardIanaUnboundedParamValue._(value);
  }

  final String _value;

  VCardIanaUnboundedParamValue._(this._value);

  String get value => _value;
}

class VCardIanaParam extends IVCardIanaParam {
  static VCardIanaParam vCardIanaParam(
      VCardIanaParamName paramName,
      List<AbstractVCardIanaParamValue> paramValueList
      ) {
    if (paramName == null
        || paramValueList == null
        || paramValueList.isEmpty) {
      return null;
    }
    return VCardIanaParam._(paramName, paramValueList);
  }

  final VCardIanaParamName _paramName;
  final List<AbstractVCardIanaParamValue> _paramValueList;

  VCardIanaParam._(this._paramName, this._paramValueList);

  VCardIanaParamName get paramName => _paramName;
  List<AbstractVCardIanaParamValue> get paramValueList =>
      List.unmodifiable(_paramValueList);
}

class VCardXParam extends IVCardXParam {
  static VCardXParam vCardXParam(
      String paramName,
      List<String> paramValueList
      ) {
    if (paramName == null
        || paramValueList == null
        || paramValueList.isEmpty) {
      return null;
    }
    return VCardXParam._(paramName, paramValueList);
  }

  final String _paramName;
  final List<String> _paramValueList;

  VCardXParam._(this._paramName, this._paramValueList);

  String get paramName => _paramName;
  List<String> get paramValueList => List.unmodifiable(_paramValueList);
}

class VCardLabeledValue<T> extends IVCardLabeledValue<T> {
  static VCardLabeledValue<U> vCardLabeledValue<U>(
      String group,
      List<AbstractVCardParam> vCardParamList,
      U value
      ) {
    if (value == null) {
      return null;
    }
    return VCardLabeledValue._(group, vCardParamList ?? [], value);
  }

  final String _group;
  final List<AbstractVCardParam> _vCardParamList;
  final T _value;

  VCardLabeledValue._(
      this._group,
      this._vCardParamList,
      this._value
      );

  String get group => _group;
  List<AbstractVCardParam> get vCardParamList =>
      List.unmodifiable(_vCardParamList);
  T get value => _value;
}

class VCardExtendedLabeledValue extends IVCardExtendedLabeledValue {
  static VCardExtendedLabeledValue vCardExtendedLabeledValue(
      String group,
      String propertyKey,
      List<IVCardXParam> vCardParamList,
      String value
      ) {
    if (propertyKey == null || propertyKey.isEmpty || value == null) {
      return null;
    }
    return VCardExtendedLabeledValue._(
        group,
        propertyKey,
        vCardParamList ?? [],
        value
    );
  }

  final String _group;
  final String _propertyKey;
  final List<IVCardXParam> _vCardParamList;
  final String _value;

  VCardExtendedLabeledValue._(
      this._group,
      this._propertyKey,
      this._vCardParamList,
      this._value
      );

  String get group => _group;
  String get propertyKey => _propertyKey;
  List<IVCardXParam> get vCardParamList =>
      List.unmodifiable(_vCardParamList);
  String get value => _value;
}

// vCard 4.0 and up must reimplement to include label and geo.
class VCardAddress extends IVCardAddress {
  static VCardAddress vCardAddress(
      String poBox,
      [
        String extendedAddress,
        String street,
        String locality,
        String region,
        String postalCode,
        String countryName,
      ]
      ) {
    return VCardAddress._(
        poBox,
        extendedAddress,
        street,
        locality,
        region,
        postalCode,
        countryName
    );
  }

  final String _poBox;
  final String _extendedAddress;
  final String _street;
  final String _locality;
  final String _region;
  final String _postalCode;
  final String _countryName;

  VCardAddress._(
      this._poBox,
      this._extendedAddress,
      this._street,
      this._locality,
      this._region,
      this._postalCode,
      this._countryName
      );

  String get poBox => _poBox;
  String get extendedAddress => _extendedAddress;
  String get street => _street;
  String get locality => _locality;
  String get region => _region;
  String get postalCode => _postalCode;
  String get countryName => _countryName;
}

class VCardLatLng extends IVCardLatLng {
  static VCardLatLng vCardLatLng(String latitude, String longitude) {
    if (latitude == null || longitude == null) {
      return null;
    }
    if (double.tryParse(latitude) == null) {
      return null;
    }
    if (double.tryParse(longitude) == null) {
      return null;
    }
    return VCardLatLng._(latitude.trim(), longitude.trim());
  }

  final String _latitude;
  final String _longitude;

  VCardLatLng._(this._latitude, this._longitude);

  String get latitude => _latitude;
  String get longitude => _longitude;
}

class VCardName extends IVCardName {
  static VCardName vCardName(
      List<String> familyNames,
      [
        List<String> givenNames,
        List<String> middleNames,
        List<String> prefixes,
        List<String> suffixes,
      ]
      ) {
    if (familyNames == null || familyNames.isEmpty) {
      return null;
    }
    return VCardName._(
        familyNames,
        givenNames,
        middleNames,
        prefixes,
        suffixes
    );
  }

  final List<String> _familyNames;
  final List<String> _givenNames;
  final List<String> _middleNames;
  final List<String> _prefixes;
  final List<String> _suffixes;

  VCardName._(
      this._familyNames, // non null, at least one long
      this._givenNames,
      this._middleNames,
      this._prefixes,
      this._suffixes
      );

  List<String> get familyNames =>
      _familyNames != null ? List.unmodifiable(_familyNames) : null;
  List<String> get givenNames =>
      _givenNames != null ? List.unmodifiable(_givenNames) : null;
  List<String> get middleNames =>
      _middleNames != null ? List.unmodifiable(_middleNames) : null;
  List<String> get prefixes =>
      _prefixes != null ? List.unmodifiable(_prefixes) : null;
  List<String> get suffixes =>
      _suffixes != null ? List.unmodifiable(_suffixes) : null;
}

class VCardOrganization extends IVCardOrganization {
  static VCardOrganization vCardOrganization(
      String name,
      List<String> organizationalUnits
      ) {
    if (name == null) {
      return null;
    }
    return VCardOrganization._(name, organizationalUnits ?? []);
  }

  final String _name;
  final List<String> _organizationUnits;

  VCardOrganization._(this._name, this._organizationUnits);

  String get name => _name;
  List<String> get organizationUnits => List.unmodifiable(_organizationUnits);
}
