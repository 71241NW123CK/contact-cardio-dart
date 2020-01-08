import '../../utilities/phone_number_utilities.dart';
import 'only_phone_number_contact_card.dart';
import 'single_phone_number_contact_card.dart';

/// A [SinglePhoneNumberContactCard] containing just a single phone number.
///
/// In the future it would be nice to be aware of how phone numbers actually
/// work, much like how Google's
/// [libphonenumber](https://github.com/google/libphonenumber) works, but for
/// now just assume that the number contains some maximum number of digits
/// (note that some valid German phone numbers violate the
/// [E.164](https://www.itu.int/rec/T-REC-E.164/) standard maximum of 15
/// digits including country code) with spaces, periods, dashes, plus signs,
/// pound signs, asterisks, and matching parentheses allowed.
///
/// TODO: restrict to (potentially) valid phone numbers
class RawPhoneNumberContactCard extends SinglePhoneNumberContactCard
    implements OnlyPhoneNumberContactCard {
  /// Returns an instance of [RawPhoneNumberContactCard] if the given `String`
  /// contains just a phone number; otherwise returns `null`.
  static RawPhoneNumberContactCard deserialize(String serializedContactCard) {
    if (PhoneNumberUtilities.isOneRawPhoneNumber(serializedContactCard)) {
      return RawPhoneNumberContactCard._(serializedContactCard);
    } else {
      return null;
    }
  }

  final String _value;

  String get phoneNumber => _value;

  RawPhoneNumberContactCard._(this._value);

  String serialize() => _value;
}
