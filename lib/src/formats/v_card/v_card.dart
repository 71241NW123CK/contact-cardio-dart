import '../../interfaces/email_address_list_provider.dart';
import '../../interfaces/phone_number_list_provider.dart';
import 'v_card_enums.dart';

/// An abstract class representing a parameter in a vCard property
abstract class AbstractVCardParam {}

/// An abstract class representing a parameter value in a parameter whose name
/// has been specified by
/// [the IANA's document regarding vCards](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml)
/// (as opposed to an extension parameter).
abstract class AbstractVCardIanaParamValue {}

/// An abstract class representing a parameter value in a parameter whose name
/// and possible values have been explicitly specified by
/// [the IANA's document regarding vCards](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml)
/// (as opposed to values specified elsewhere such as language codes).
abstract class IVCardIanaBoundedParamValue
    extends AbstractVCardIanaParamValue {
  /// The value represented by this instance.
  VCardIanaParamValue get value;
}

/// An abstract class representing a parameter value in a parameter whose name
/// has been specified by
/// [the IANA's document regarding vCards](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml),
/// but whose possible values are specified elsewhere (such as language
/// codes).
abstract class IVCardIanaUnboundedParamValue
    extends AbstractVCardIanaParamValue {
  /// The value represented by this instance.
  String get value;
}

/// An abstract class representing a parameter in a vCard property whose name
/// has been explicitly specified by
/// [the IANA's document regarding vCards](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml)
/// and whose possible values are either explicitly enumerated in the same
/// document, or are described in the same document as being enumerated in
/// some other document.
abstract class IVCardIanaParam extends AbstractVCardParam {
  /// The name of the parameter represented by this instance.
  VCardIanaParamName get paramName;

  /// The values for the parameter represented by this instance.
  List<AbstractVCardIanaParamValue> get paramValueList;
}

/// An abstract class representing a parameter in a vCard property which is
/// not explicitly enumerated by
/// [the IANA's document regarding vCards](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml),
/// but which is allowed as an extension parameter in the vCard specification.
/// Though parameter values may be the same as those enumerated in the IANA's
/// document regarding vCards, they are represented as strings and may have
/// semantics unrelated to those set forth in the IANA document.
abstract class IVCardXParam extends AbstractVCardParam {
  /// The name of the parameter represented by this instance.
  String get paramName;

  /// The values for the parameter represented by this instance.
  List<String> get paramValueList;
}

/// An abstract generic class representing a vCard property the type of which
/// has been explicitly enumerated in
/// [the IANA's document regarding vCards](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml).
/// Different types of vCard properties represent different types of
/// information, but they all are allowed to have a "group" (which may be
/// `null`) and a list of parameters (some properties require the list of
/// parameters to be empty).
abstract class IVCardLabeledValue<T> {
  /// The group, if any, for the vCard property represented by this instance.
  String get group;

  /// A list containing the parameters of the vCard property represented by
  /// this instance.
  List<AbstractVCardParam> get vCardParamList;

  /// The value of the vCard property represented by this instance.
  T get value;
}

/// An abstract class representing an extension vCard property.  Consumers of
/// this library may do whatever they please with such properties, but this
/// library always treats extension properties' values as `String`s to remain
/// neutral as to their meaning.
abstract class IVCardExtendedLabeledValue {
  /// The group, if any, for the vCard extension property represented by this
  /// instance.
  String get group;

  /// The extension property name for the vCard extension property represented
  /// by this instance.
  String get propertyKey;

  /// A list containing the parameters of the vCard extension property
  /// represented by this instance.
  List<IVCardXParam> get vCardParamList;

  /// The value of the vCard extension property represented by this instance.
  String get value;
}

/// An abstract class representing an address within a vCard.
abstract class IVCardAddress {
  /// The P.O. box, or `null` if there is no P.O. box.
  String get poBox;

  /// The "extended address", or `null` if there is none.
  String get extendedAddress;

  /// The street number and street, or `null` if there is none.
  String get street;

  /// The locality (ie. city), or `null` if there is none.
  String get locality;

  /// The region (ie. state, prefecture, province, oblast, etc.), or `null` if
  /// there is none.
  String get region;

  /// The postal code (ie. ZIP code), or `null` if there is none.
  String get postalCode;

  /// The country name, or `null` if there is none.
  String get countryName;
}

/// An abstract class representing a location on a planet given by latitude
/// and longitude within a vCard.
/// n.b.: `String`s are used to preserve decimal precision.
abstract class IVCardLatLng {
  /// A `String` containing the latitude.
  String get latitude;

  /// A `String` containing the longitude.
  String get longitude;
}

/// An abstract class representing a name within a vCard.
abstract class IVCardName {
  /// A list of family names.
  List<String> get familyNames;

  /// A (possibly empty) list of given names, or `null` if no list of given
  /// names is given.
  List<String> get givenNames;

  /// A (possibly empty) list of middle names, or `null` if no list of middle
  /// names is given.
  List<String> get middleNames;

  /// A (possibly empty) list of prefixes, or `null` if no list of prefixes is
  /// given.
  List<String> get prefixes;

  /// A (possibly empty) list of suffixes, or `null` if no list of suffixes is
  /// given.
  List<String> get suffixes;
}

/// An abstract class representing an organization within a vCard.
abstract class IVCardOrganization {
  /// The name of the organization represented by this instance.
  String get name;

  /// A (possibly empty) list of hierarchical organizational units represented
  /// by this instance, ordered by inclusion.
  List<String> get organizationUnits;
}

/// A vCard within a vCard entity (which may contain more than one vCard).
/// Concrete subclasses should return a constant value for [vCardVersion].
/// The fields here, aside from version, are specified in the order listed in
/// the ABNF portion of the vCard 3.0 specification set forth in
/// [RFC 2426](https://tools.ietf.org/html/rfc2426).  Properties which are not
/// allowed in all of the versions of the vCard format are not included, and
/// should be included in concrete subclasses of this class corresponding to
/// vCard versions which support such properties.
/// Some properties have been excluded for ease of implementation.
abstract class VCard
    implements EmailAddressListProvider, PhoneNumberListProvider {
  /// This value is used for the `PRODID` property whenever a vCard is
  /// serialized, as this library is responsible for serialization.
  /// Future versions of this library may allow concrete subclasses to store
  /// the original text of a deserialized vCard, and this class may specify a
  /// method which returns the original text from which the [VCard] instance
  /// was created (or `null` if the instance was created from some sort of
  /// builder).  In such a case, the `PRODID`, if any, of the original text is
  /// used since this library was not responsible for serializing the vCard --
  /// only storing and regurgitating it unchanged.
  static const defaultProdId = '-//Tree Squared Technologies LLC//Contact Cardio Dart v0.0.0//EN';

  @override
  List<String> get emailAddressList =>
      List.unmodifiable(labeledEmailAddressList.map((e) => e.value).toList());


  @override
  List<String> get phoneNumberList =>
      List.unmodifiable(labeledPhoneNumberList.map((p) => p.value).toList());

  /// The vCard version for this instance.  This is represented in the vCard
  /// by the `VERSION` property.
  VCardVersion get vCardVersion;

  /// A list of formatted names and their groups and parameters.  These are
  /// represented in the vCard as `FN` properties.
  List<IVCardLabeledValue<String>> get labeledFormattedNameList;

  /// A list of names and their groups and parameters.  These are represented
  /// in the vCard as `N` properties.
  List<IVCardLabeledValue<IVCardName>> get labeledNameList;

  /// A list of the nicknames and their groups and parameters.  These are
  /// represented in the vCard as `NICKNAME` properties.
  List<IVCardLabeledValue<List<String>>> get labeledNicknameList;

  /// A list of photographs and their groups and parameters.  These are
  /// represented in the vCard as `PHOTO` properties.
  List<IVCardLabeledValue<String>> get labeledPhotoList;

  /// The birthday specified by this instance, or `null` if no birthday is
  /// specified.  This is represented in the vCard by the `BDAY` property.
  String get birthday;

  /// A list of addresses and their groups and parameters.  These are
  /// represented in the vCard as `ADR` properties.
  List<IVCardLabeledValue<IVCardAddress>> get labeledAddressList;

  /// A list of phone numbers and their groups and parameters.  These are
  /// represented in the vCard as `TEL` properties.
  List<IVCardLabeledValue<String>> get labeledPhoneNumberList;

  /// A list of email addresses and their groups and parameters.  These are
  /// represented in the vCard as `EMAIL` properties.
  List<IVCardLabeledValue<String>> get labeledEmailAddressList;

  /// A list of time zones and their groups and parameters.  These are
  /// represented in the vCard as `TZ` properties.
  List<IVCardLabeledValue<String>> get labeledTimeZoneList;

  /// A list of geographic locations and their groups and parameters.  These
  /// are represented in the vCard as `GEO` properties.
  List<IVCardLabeledValue<IVCardLatLng>> get labeledGeographicLocationList;

  /// A list of titles and their groups and parameters.  These are represented
  /// in the vCard as `TITLE` properties.
  List<IVCardLabeledValue<String>> get labeledTitleList;

  /// A list of roles and their groups and parameters.  These are represented
  /// in the vCard as `ROLE` properties.
  List<IVCardLabeledValue<String>> get labeledRoleList;

  /// A list of logos and their groups and parameters.  These are represented
  /// in the vCard as `LOGO` properties.
  List<IVCardLabeledValue<String>> get labeledLogoList;

  // TODO: agent

  /// A list of organizations and organizational units and their groups and
  /// parameters.  These are represented in the vCard as `ORG` properties.
  List<IVCardLabeledValue<IVCardOrganization>> get labeledOrganizationList;

  /// A list of category lists and their groups and parameters.  These are
  /// represented in the vCard as `CATEGORIES` properties.
  List<IVCardLabeledValue<List<String>>> get labeledCategoriesList;

  /// A list of notes and their groups and parameters.  These are represented
  /// in the vCard as `NOTE` properties.
  List<IVCardLabeledValue<String>> get labeledNoteList;

  /// An identifier for the creator of this vCard (ie. this library), or
  /// `null` if no such identifier is provided.
  String get prodId;

  /// The revision time for the vCard along with parameters, or `null` if no
  /// such revision time is provided.
  IVCardLabeledValue<String> get labeledRevisionTime;

  // TODO: sound

  // TODO: UID

  /// A list of URIs included in the vCard.
  List<String> get uriList;

  // TODO: class

  // TODO: key

  /// A list of vCard extension properties along with their groups and
  /// parameters.
  List<IVCardExtendedLabeledValue> get extendedLabeledValueList;

  /// Returns a `String` containing the text representation of this vCard.
  /// Subclasses implementing this method should do so in a way which
  /// preserves ordering of properties when the result of this method is
  /// deserialized and then serialized again.
  String serialize();
}
