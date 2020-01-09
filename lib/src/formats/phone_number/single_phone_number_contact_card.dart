import '../../contact_card_deserializer.dart';
import 'phone_number_contact_card.dart';
import 'raw_phone_number_contact_card.dart';
import 'uri_phone_number_contact_card.dart';

/// A [PhoneNumberContactCard] representing contact information in a format
/// which always contains exactly one phone number.
abstract class SinglePhoneNumberContactCard extends PhoneNumberContactCard {
  /// Returns an instance of [SinglePhoneNumberContactCard] if the given
  /// `String` represents contact information in a format which always
  /// contains exactly one phone number.
  static SinglePhoneNumberContactCard deserialize(
      String serializedContactCard) =>
      chainContactCardDeserializerList([
        RawPhoneNumberContactCard.deserialize,
        UriPhoneNumberContactCard.deserialize,
      ])(serializedContactCard);

  @override
  List<String> get phoneNumberList => [phoneNumber];

  /// The phone number represented by this instance.
  String get phoneNumber;
}
