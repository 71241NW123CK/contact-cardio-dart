import '../../contact_card.dart';
import '../../utilities/v_card_utilities.dart';
import '../../utilities/v_card_enum_utilities.dart';
import '../email_address/email_address_contact_card.dart';
import '../phone_number/phone_number_contact_card.dart';
import 'v_card.dart';
import 'v_card_3_0.dart';

/// A [ContactCard] representing a vCard entity.
///
/// n.b.: a vCard is intended to represent contact information for one person
/// or, in some versions, one application, group, location, or organization
/// (or some other thing supported by an extension).  vCard entities contain
/// one or more such vCards.
///
/// n.b.: currently only
/// [vCard version 3.0](https://tools.ietf.org/html/rfc2426) is supported.
/// Support for other versions is forthcoming.
class VCardContactCard extends ContactCard
    implements EmailAddressContactCard, PhoneNumberContactCard {
  /// Returns an instance of [VCardContactCard] if the given `String` contains
  /// a vCard entity; otherwise returns `null`.
  static VCardContactCard deserialize(String serializedContactCard) {
    final lines = serializedContactCard.split(VCardUtilities.crlf);
    var beginLineIndices = <int>[];
    for (var i = 0; i < lines.length; i++) {
      if (lines[i].toUpperCase() == VCardEnumUtilities.beginVCard) {
        beginLineIndices.add(i);
      }
    }
    if (beginLineIndices.isEmpty || beginLineIndices.first != 0) { // vCard entities must begin with a vCard, which must begin with a `BEGIN:VCARD` followed by a CRLF.
      return null;
    }
    var endIndices = beginLineIndices.sublist(1) + [lines.length];
    var vCardList = <VCard>[];
    for (var i = 0; i < beginLineIndices.length; i++) {
      final beginIndex = beginLineIndices[i];
      final endIndex = endIndices[i];
      final serializedVCard =
          lines
              .sublist(beginIndex, endIndex)
              .map((l) => '$l${VCardUtilities.crlf}')
              .toList()
              .join('');
      // todo: implement and use the other VCard versions, do a check for a version line
      final vCard = VCard3_0.deserialize(serializedVCard);
      if (vCard != null) {
        vCardList.add(vCard);
      } else {
        return null;
      }
    }
    return VCardContactCard._(vCardList);
  }

  final List<VCard> _vCardList;

  VCardContactCard._(this._vCardList);

  @override
  List<String> get emailAddressList =>
      _vCardList.expand((vc) => vc.emailAddressList).toList();

  @override
  List<String> get phoneNumberList =>
      _vCardList.expand((vc) => vc.phoneNumberList).toList();

  /// A list of [VCard]s contained in the vCard entity.
  List<VCard> get vCardList => List.unmodifiable(_vCardList);

  @override
  String serialize() {
    return _vCardList.map((vc) => vc.serialize()).join('');
  }
}
