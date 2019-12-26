import '../../contact_card.dart';
import '../../contact_card_deserializer.dart';
import 'only_email_address_contact_card.dart';

/// A [ContactCard] representing contact information related to email.
abstract class EmailAddressContactCard extends ContactCard {
  static final ContactCardDeserializer<EmailAddressContactCard>
      _deserializer =
      chainContactCardDeserializerList([
        OnlyEmailAddressContactCard.deserialize,
      ]);

  /// Returns an instance of [EmailAddressContactCard] if the given `String`
  /// represents contact information related to email; otherwise returns
  /// `null`.
  static EmailAddressContactCard deserialize(String serializedContactCard) =>
      _deserializer(serializedContactCard);

  /// A list containing the email addresses represented by this instance.
  List<String> get emailAddressList;
}
