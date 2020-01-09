import '../../utilities/email_address_utilities.dart';
import 'email_address_contact_card.dart';
import 'only_email_address_contact_card.dart';

/// An [EmailAddressContactCard] containing a single URI conforming to the
/// `mailto` URI scheme specified in
/// [RFC 6068](https://tools.ietf.org/html/rfc6068)
///
/// Currently, only `mailto` URIs with a single email address and no `hfield`s
/// like `body`, or `subject`, or even `to`.
///
/// n.b.: If this class is modified to conform to more of the standard for
/// `mailto` URIs as laid out in
/// [RFC 6068](https://tools.ietf.org/html/rfc6068), be sure to update the
/// [serialize] method and include previously unsupported URIs in tests.
class UriEmailAddressContactCard extends EmailAddressContactCard
    implements OnlyEmailAddressContactCard {
  /// Returns an instance of [UriEmailAddressContactCard] if the given
  /// `String` contains a single URI conforming to the `mailto` URI scheme
  /// specified in
  /// [RFC 6068](https://tools.ietf.org/html/rfc6068); otherwise returns
  /// `null`.
  ///
  /// n.b.: Currently only works if the given `String` contains a `mailto` URI
  /// with exactly one email address and no `hfield`s like `body`, or
  /// `subject`, or even `to`.
  ///
  /// TODO: Support all of [RFC 6068](https://tools.ietf.org/html/rfc6068)
  static UriEmailAddressContactCard deserialize(
      String serializedContactCard) {
    if (EmailAddressUtilities.isOneUriEmailAddress(serializedContactCard)) {
      final emailAddress = serializedContactCard.substring(7);
      return UriEmailAddressContactCard._([emailAddress]);
    } else {
      return null;
    }
  }

  final List<String> _recipientList;

  @override
  List<String> get emailAddressList => _recipientList;

  UriEmailAddressContactCard._(this._recipientList);

  /// n.b.: If this class is modified to conform to more of the standard for
  /// `mailto` URIs as laid out in
  /// [RFC 6068](https://tools.ietf.org/html/rfc6068), be sure to change the
  /// implementation of this method to include currently unsupported
  /// `hfield`s, should they exist.
  @override
  String serialize() => 'mailto:${_recipientList.join(",")}';
}
