/// Utilities for determining if a `String` is a phone number.
///
/// In the future, there should be more regexes for matching
/// [RFC 5341](https://tools.ietf.org/html/rfc5341) compliant URIs which
/// contain things like `ext`, etc. along with a corresponding [ContactCard]
/// subclass representing such URIs.
class PhoneNumberUtilities {
  /// I am bad at regular expressions feelsbadman
  static final _rawPhoneNumberPattern =
      r'\+?([0-9]{1,20}|\([0-9]{1,20}\))([\+\*\.\-# ]?([0-9]{1,20}|\([0-9]{1,20}\))){0,4}';
  static final _oneRawPhoneNumberPattern = '^$_rawPhoneNumberPattern\$';
  static final _uriPhoneNumberPattern = 'tel:$_rawPhoneNumberPattern';
  static final _oneUriPhoneNumberPattern = '^$_uriPhoneNumberPattern\$';
  static final _oneRawPhoneNumberRegExp = RegExp(_oneRawPhoneNumberPattern);
  static final _oneUriPhoneNumberRegExp = RegExp(_oneUriPhoneNumberPattern);

  static bool isOneRawPhoneNumber(String string) =>
      _oneRawPhoneNumberRegExp.hasMatch(string);

  static bool isOneUrlPhoneNumber(String string) =>
      _oneUriPhoneNumberRegExp.hasMatch(string);
}
