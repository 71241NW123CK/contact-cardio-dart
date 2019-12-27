import '../../contact_card.dart';
import '../../contact_card_deserializer.dart';
import '../me_card/me_card_contact_card.dart';
import 'only_phone_number_contact_card.dart';

/// A [ContactCard] representing contact information relating to phone
/// numbers.
abstract class PhoneNumberContactCard extends ContactCard {
  static final ContactCardDeserializer<PhoneNumberContactCard> _deserializer =
      chainContactCardDeserializerList([
        OnlyPhoneNumberContactCard.deserialize,
        MeCardContactCard.deserialize,
      ]);

  /// Returns a [PhoneNumberContactCard] if the given `String` represents
  /// contact information related to phone numbers; otherwise returns `null`.
  static PhoneNumberContactCard deserialize(String serializedContactCard) =>
      _deserializer(serializedContactCard);

  /// A list containing the phone numbers represented by this instance.
  List<String> get phoneNumberList;
}
