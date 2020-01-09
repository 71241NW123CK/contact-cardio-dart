/// Utilities for determining if a `String` is an email address.
///
/// For now, email addresses are things that match whatever regex I stole
/// from the internet.
///
/// In the future, there should be more regexes for matching
/// [RFC 6068](https://tools.ietf.org/html/rfc6068) compliant URIs with
/// multiple recipients, no recipients, a pre-filled subject and/ or body,
/// etc. along with a corresponding [ContactCard] subclass representing
/// such URIs.
class EmailAddressUtilities {
  /// I stole this regex from [here](http://emailregex.com/)
  /// n.b.: I am a terrible person
  static final _rawEmailAddressPattern =
      r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
  static final _oneRawEmailAddressPattern = '^$_rawEmailAddressPattern\$';
  static final _uriEmailAddressPattern = 'mailto:$_rawEmailAddressPattern';
  static final _oneUriEmailAddressPattern = '^$_uriEmailAddressPattern\$';
  static final _oneRawEmailAddressRegExp = RegExp(_oneRawEmailAddressPattern);
  static final _oneUriEmailAddressRegExp = RegExp(_oneUriEmailAddressPattern);

  static bool isOneUriEmailAddress(String string) =>
    _oneUriEmailAddressRegExp.hasMatch(string);

  static bool isOneRawEmailAddress(String string) =>
    _oneRawEmailAddressRegExp.hasMatch(string);
}
