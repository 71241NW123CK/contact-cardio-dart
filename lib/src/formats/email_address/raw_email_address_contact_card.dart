import '../../utilities/email_address_utilities.dart';
import 'only_email_address_contact_card.dart';
import 'single_email_address_contact_card.dart';

/// A [SingleEmailAddressContactCard] containing only an email address.
class RawEmailAddressContactCard extends SingleEmailAddressContactCard
    implements OnlyEmailAddressContactCard {
  /// Returns an instance of [RawEmailAddressContactCard] if the given
  /// `String` contains just a single email address; otherwise returns `null`.
  static RawEmailAddressContactCard deserialize(
      String serializedContactCard) {
    if (EmailAddressUtilities.isOneRawEmailAddress(serializedContactCard)) {
      return RawEmailAddressContactCard._(serializedContactCard);
    } else {
      return null;
    }
  }

  final String _value;

  @override
  String get emailAddress => _value;

  RawEmailAddressContactCard._(this._value);

  @override
  String serialize() => _value;
}
