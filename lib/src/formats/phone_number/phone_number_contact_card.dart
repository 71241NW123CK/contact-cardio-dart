import '../../contact_card.dart';
import '../../contact_card_deserializer.dart';
import '../../interfaces/phone_number_list_provider.dart';
import '../me_card/me_card_contact_card.dart';
import '../v_card/v_card_contact_card.dart';
import 'only_phone_number_contact_card.dart';

/// A [ContactCard] representing contact information relating to phone
/// numbers.
abstract class PhoneNumberContactCard extends ContactCard
    implements PhoneNumberListProvider {
  static final ContactCardDeserializer<PhoneNumberContactCard> _deserializer =
      chainContactCardDeserializerList([
        OnlyPhoneNumberContactCard.deserialize,
        MeCardContactCard.deserialize,
        VCardContactCard.deserialize,
      ]);

  /// Returns a [PhoneNumberContactCard] if the given `String` represents
  /// contact information related to phone numbers; otherwise returns `null`.
  static PhoneNumberContactCard deserialize(String serializedContactCard) =>
      _deserializer(serializedContactCard);
}
