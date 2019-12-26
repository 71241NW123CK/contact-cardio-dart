/// Parses `String`s into objects representing a variety of types of contact
/// info including phone numbers, email addresses, etc.
///
/// To parse a `String` `s` into a contact card format, use the static
/// method [ContactCard.deserialize] as such:
///
/// ```
/// import 'package:contact_cardio/contact_card.dart';
///
/// ...
/// String s = ...
/// val contactCard = ContactCard.deserialize(s);
/// ```
///
/// If `s` contains contact info in a format understood by `contact_cardio`,
/// then `contactCard` will be an instance of a concrete subclass of
/// [ContactCard].  Otherwise, `s` will be `null`.
library contact_cardio;

export 'src/contact_card.dart';
export 'src/formats/email_address/email_address_contact_card.dart';
export 'src/formats/email_address/raw_email_address_contact_card.dart';
export 'src/formats/email_address/single_email_address_contact_card.dart';
export 'src/formats/email_address/uri_email_address_contact_card.dart';
export 'src/formats/phone_number/phone_number_contact_card.dart';
export 'src/formats/phone_number/raw_phone_number_contact_card.dart';
export 'src/formats/phone_number/single_phone_number_contact_card.dart';
export 'src/formats/phone_number/uri_phone_number_contact_card.dart';
