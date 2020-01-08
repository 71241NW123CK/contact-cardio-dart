import '../../contact_card_deserializer.dart';
import 'email_address_contact_card.dart';
import 'raw_email_address_contact_card.dart';
import 'uri_email_address_contact_card.dart';

/// An [EmailAddressContactCard] representing contact information wherein the
/// only means of contact is via email addresses.
abstract class OnlyEmailAddressContactCard extends EmailAddressContactCard {
  static final ContactCardDeserializer<OnlyEmailAddressContactCard>
      _deserializer =
      chainContactCardDeserializerList([
        UriEmailAddressContactCard.deserialize,
        RawEmailAddressContactCard.deserialize,
      ]);

  /// Returns an instance of [OnlyEmailAddressContactCard] if the given
  /// `String` represents contact information in a format wherein the only
  /// means of contact is via email addresses; otherwise returns `null`.
  static OnlyEmailAddressContactCard deserialize(
      String serializedContactCard) =>
      _deserializer(serializedContactCard);
}
