import 'email_address_contact_card.dart';
import 'raw_email_address_contact_card.dart';

/// An [EmailAddressContactCard] representing contact information in a format
/// which always contains exactly one email address.
abstract class SingleEmailAddressContactCard extends EmailAddressContactCard {
  /// Returns an instance of [SingleEmailAddressContactCard] if the given
  /// `String` represents contact information in a format which always
  /// contains exactly one email address; otherwise returns `null`.
  ///
  /// n.b.: If the given `String` represents contact information in a format
  /// which may contain a variable number of email addresses, then the method
  /// will return `null` even if the particular `String` happens to contain
  /// exactly one email address.
  static SingleEmailAddressContactCard deserialize(
      String serializedContactCard) =>
      RawEmailAddressContactCard.deserialize(serializedContactCard);

  @override
  List<String> get emailAddressList => [emailAddress];

  /// The email address represented by this instance.
  String get emailAddress;
}
