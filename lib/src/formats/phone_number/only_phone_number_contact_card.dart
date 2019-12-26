import '../../contact_card_deserializer.dart';
import 'phone_number_contact_card.dart';
import 'raw_phone_number_contact_card.dart';
import 'uri_phone_number_contact_card.dart';

/// A [PhoneNumberContactCard] representing contact information wherein the
/// only means of contact is via phone numbers.
abstract class OnlyPhoneNumberContactCard extends PhoneNumberContactCard {
  static final ContactCardDeserializer<OnlyPhoneNumberContactCard>
      _deserializer =
      chainContactCardDeserializerList([
        RawPhoneNumberContactCard.deserialize,
        UriPhoneNumberContactCard.deserialize,
      ]);

  /// Returns an instance of [OnlyPhoneNumberContactCard] if the given
  /// `String` represents contact information in a format wherein the only
  /// means of contact via phone numbers; otherwise returns `null`.
  static OnlyPhoneNumberContactCard deserialize(
      String serializedContactCard) =>
      _deserializer(serializedContactCard);
}
