/// An enumeration of the vCard versions in use.
enum VCardVersion {
  v2_1,
  v3_0,
  v4_0,
  v5_0
}

/// An enumeration of the vCard properties explicitly enumerated by the IANA.
/// The IANA document regarding vCards can be found
/// [here](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml).
/// Note that each version of vCard only supports a subset of these values.
enum VCardIanaPropertyKey {
  adr,
  agent,
  anniversary,
  bday,
  begin,
  birthplace,
  caladruri,
  caluri,
  categories,
  class_,
  clientpidmap,
  deathdate,
  deathplace,
  email,
  end,
  expertise,
  fburl,
  fn,
  gender,
  geo,
  hobby,
  impp,
  interest,
  key,
  kind,
  label,
  lang,
  logo,
  mailer,
  member,
  n,
  name,
  nickname,
  note,
  org,
  orgDirectory,
  photo,
  prodid,
  profile,
  related,
  rev,
  role,
  sortString,
  sound,
  source,
  tel,
  title,
  tz,
  uid,
  url,
  version,
  xml,
}

/// An enumeration of the vCard property parameter names explicitly enumerated
/// by the IANA.
/// The IANA document regarding vCards can be found
/// [here](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml).
/// Note that each version of vCard specifies which parameter names can be
/// used in each of the properties supported by that version.
enum VCardIanaParamName { // todo: add label for v4.0 addresses
  language,
  value,
  pref,
  altid,
  pid,
  type,
  mediatype,
  calscale,
  sortAs,
  geo,
  tz,
  index_,
  level,
  group,
  cc,
  encoding,
  // charset?  Unicode exists, so get fucked.
}

/// An enumeration of the vCard property parameter values explicitly
/// enumerated by the IANA or by the specification for one of the vCard
/// versions.
/// The IANA document regarding vCards can be found
/// [here](https://www.iana.org/assignments/vcard-elements/vcard-elements.xhtml).
/// Note that some parameters specified by the IANA or by the specification
/// for one of the vCard versions may have values which are enumerated
/// elsewhere (such as language codes).
enum VCardIanaParamValue {
  work,
  home,
  text,
  voice,
  fax,
  cell,
  video,
  pager,
  textphone,
  mainNumber,
  gregorian,
  contact,
  acquaintance,
  friend,
  met,
  coWorker,
  colleague,
  coResident,
  neighbor,
  child,
  parent,
  sibling,
  spouse,
  kin,
  muse,
  crush,
  date,
  sweetheart,
  me,
  agent,
  emergency,
  beginner,
  average,
  expert,
  high,
  medium,
  low,
  b,
  bbs,
  binary,
  car,
  dateTime,
  dom,
  internet,
  intl,
  isdn,
  modem,
  msg,
  parcel,
  pcs,
  postal,
  pref,
  uri,
  x400,
  base64,
  quotedPrintable,
  encoding8bit,
}
