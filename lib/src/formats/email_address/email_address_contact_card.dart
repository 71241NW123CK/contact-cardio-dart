import '../../contact_card.dart';
import '../../contact_card_deserializer.dart';
import '../../interfaces/email_address_list_provider.dart';
import '../me_card/me_card_contact_card.dart';
import '../v_card/v_card_contact_card.dart';
import 'only_email_address_contact_card.dart';

/// A [ContactCard] representing contact information related to email.
abstract class EmailAddressContactCard extends ContactCard
    implements EmailAddressListProvider {
  static final ContactCardDeserializer<EmailAddressContactCard>
      _deserializer =
      chainContactCardDeserializerList([
        OnlyEmailAddressContactCard.deserialize,
        MeCardContactCard.deserialize,
        VCardContactCard.deserialize,
      ]);

  /// Returns an instance of [EmailAddressContactCard] if the given `String`
  /// represents contact information related to email; otherwise returns
  /// `null`.
  static EmailAddressContactCard deserialize(String serializedContactCard) =>
      _deserializer(serializedContactCard);
}
