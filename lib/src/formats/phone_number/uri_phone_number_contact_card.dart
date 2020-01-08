import '../../utilities/phone_number_utilities.dart';
import 'only_phone_number_contact_card.dart';
import 'single_phone_number_contact_card.dart';

/// A [SinglePhoneNumberContactCard] containing a single URI conforming to the
/// `tel` URI scheme specified in
/// [RFC 5341](https://tools.ietf.org/html/rfc5341)
///
/// Currently, only `tel` URIs with no `par`s like `ext` and no `context` like
/// `phone-context` are supported.
///
/// n.b.: If this class is modified to conform to more of the standard for
/// `tel` URIs as laid out in
/// [RFC 5341](https://tools.ietf.org/html/rfc5341), be sure to update the
/// [serialize] method and include previously unsupported URIs in tests.
class UriPhoneNumberContactCard extends SinglePhoneNumberContactCard
    implements OnlyPhoneNumberContactCard {
  /// Returns an instance of [UriPhoneNumberContactCard] if the given
  /// `String` contains a single URI conforming to the `tel` URI scheme
  /// specified in
  /// [RFC 5341](https://tools.ietf.org/html/rfc5341); otherwise returns
  /// `null`.
  ///
  /// n.b.: Currently only works if the given `String` contains a `tel` URI
  /// with no `par`s like `ext` and no `context` like `phone-context`.
  ///
  /// TODO: Support all of [RFC 6068](https://tools.ietf.org/html/rfc6068)
  static UriPhoneNumberContactCard deserialize(String serializedContactCard) {
    if (PhoneNumberUtilities.isOneUrlPhoneNumber(serializedContactCard)) {
      final phoneNumber = serializedContactCard.substring(4);
      return UriPhoneNumberContactCard._(phoneNumber);
    } else {
      return null;
    }
  }

  final String _phoneNumber;

  String get phoneNumber => _phoneNumber;

  UriPhoneNumberContactCard._(this._phoneNumber);

  String serialize() => 'tel:$_phoneNumber';
}
