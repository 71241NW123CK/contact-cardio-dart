import 'contact_card_deserializer.dart';
import 'formats/email_address/only_email_address_contact_card.dart';
import 'formats/me_card/me_card_contact_card.dart';
import 'formats/v_card/v_card_contact_card.dart';
import 'formats/phone_number/only_phone_number_contact_card.dart';

/// Parent class for a unit of `String`-representable contact information.
///
/// Use the static [deserialize] method to attempt to convert a `String` into
/// an instance of a concrete subclass of [ContactCard].  If the `String`
/// passed to [deserialize] cannot be understood as a unit of contact
/// information, the result of [deserialize] will be `null`.  Call [serialize]
/// on an instance of a concrete subclass of [ContactCard] to get the `String`
/// representation.
///
/// n.b.: Deserializing and then serializing may not result in an identical
/// `String` representation, but serializing and deserializing should result
/// in equal (by value) instances of the [ContactCard] subclass that was
/// serialized and deserialized.  Serialization should be deterministic so
/// that serializing any instance of a [ContactCard] subclass should be equal
/// to serializing the instance of a [ContactCard] subclass, deserializing
/// (which should result in a non-null value), and then serializing the
/// resulting instance of the same [ContactCard] subclass.
abstract class ContactCard {
  static final List<ContactCardDeserializer> _contactCardDeserializerList = [
    OnlyPhoneNumberContactCard.deserialize,
    OnlyEmailAddressContactCard.deserialize,
    MeCardContactCard.deserialize,
    VCardContactCard.deserialize,
  ];

  static final ContactCardDeserializer<ContactCard> _deserializer =
      chainContactCardDeserializerList(_contactCardDeserializerList);

  /// Converts the given `String` into an instance of a concrete subclass of
  /// [ContactCard].  If the given `String` does not represent any format for
  /// a unit of contact information understood by this library, the result is
  /// `null`.
  static ContactCard deserialize(String serializedContactCard) =>
      _deserializer(serializedContactCard);

  /// Returns the `String` representation of the contact information.
  /// Calling [ContactCard.deserialize] on the result of this method should
  /// return an equal (by value) object of the same type.  Further serializing
  /// the result of [ContactCard.deserialize] should result in a `String`
  /// equal to the original result of this method.
  String serialize();
}
