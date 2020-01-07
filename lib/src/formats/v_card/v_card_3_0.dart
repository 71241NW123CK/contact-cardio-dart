import '../../utilities/v_card_utilities.dart';
import '../../utilities/v_card_enum_utilities.dart';
import 'v_card.dart';
import 'v_card_enums.dart';

// TODO: refactor things and maybe use faux sealed classes instead of enums.

/// A vCard conforming to the version 3.0 specification set forth in
/// [RFC 2426](https://tools.ietf.org/html/rfc2426).
class VCard3_0 extends VCard {
  /// Deserializes the given `String` into a vCard v3.0, or returns `null` if
  /// the given `String` is not a valid vCard v3.0.  Note that the given
  /// `String` must contain exactly one vCard, whereas a vCard entity may
  /// contain one or more vCards within it.
  static VCard3_0 deserialize(String serializedVCard) {
    final unwrappedSerializedVCard =
        serializedVCard
            .replaceAll(VCardUtilities.lineWrapSpace, '')
            .replaceAll(VCardUtilities.lineWrapTab, '');
    var contentLines = unwrappedSerializedVCard.split(VCardUtilities.crlf);
    // vCard 3.0 must have at least 5 content lines, including BEGIN, VERSION,
    // and END, and must end with at least one CRLF.
    if (contentLines.length < 6) {
      return null;
    }
    // vCard 3.0 must begin with 'BEGIN:VCARD' followed by CRLF
    if (contentLines.first.toUpperCase() != VCardEnumUtilities.beginVCard) {
      return null;
    }
    // vCard 3.0 must end with at least one CRLF
    if (contentLines.last.isNotEmpty) {
      return null;
    }
    // vCard 3.0 must end with 'END:VCARD' followed by at least one CRLF
    while (contentLines.length > 0 && contentLines.last.isEmpty) {
      contentLines.removeLast();
    }
    if (contentLines.last.toUpperCase() != VCardEnumUtilities.endVCard) {
      return null;
    }
    contentLines = contentLines.sublist(1, contentLines.length - 1);
    // aside from the BEGIN and END lines, vCard 3.0 requires VERSION,
    // N, and FN.
    if (contentLines.length < 3) {
      return null;
    }
    // vCard 3.0 must have at least one VERSION line with value '3.0', and may
    // not contain any VERSION lines with a value other than '3.0'.
    bool hasVersion = false;
    final versionPropertyKey = VCardEnumUtilities.stringForVCardIanaPropertyKey(VCardIanaPropertyKey.version);
    final v3_0Key = VCardEnumUtilities.stringForVCardVersion(VCardVersion.v3_0);
    final versionLine = '${versionPropertyKey}:${v3_0Key}';
    for (var contentLine in contentLines) {
      if (contentLine == versionLine) {
        hasVersion = true;
      } else {
        final components = contentLine.split(':');
        if (components == 2 && components.first == versionPropertyKey && components[1] != v3_0Key) {
          return null;
        }
      }
    }
    if (!hasVersion) {
      return null;
    }
    List<IVCardLabeledValue<String>> labeledFormattedNameList = [];
    List<IVCardLabeledValue<IVCardName>> labeledNameList = [];
    List<IVCardLabeledValue<List<String>>> labeledNicknameList = [];
    List<IVCardLabeledValue<String>> labeledPhotoList = [];
    String birthday = null;
    List<IVCardLabeledValue<IVCardAddress>> labeledAddressList = [];
    List<IVCardLabeledValue<String>> labeledPhoneNumberList = [];
    List<IVCardLabeledValue<String>> labeledEmailAddressList = [];
    List<IVCardLabeledValue<String>> labeledTimeZoneList = [];
    List<IVCardLabeledValue<IVCardLatLng>> labeledGeographicLocationList = [];
    List<IVCardLabeledValue<String>> labeledTitleList = [];
    List<IVCardLabeledValue<String>> labeledRoleList = [];
    List<IVCardLabeledValue<String>> labeledLogoList = [];
    List<IVCardLabeledValue<IVCardOrganization>> labeledOrganizationList = [];
    List<IVCardLabeledValue<List<String>>> labeledCategoriesList = [];
    List<IVCardLabeledValue<String>> labeledNoteList = [];
    String prodId = null;
    IVCardLabeledValue<String> labeledRevisionTime = null;
    List<String> uriList = [];
    List<IVCardExtendedLabeledValue> extendedLabeledValueList = [];
    List<IVCardLabeledValue<String>> labeledLabelList = [];
    List<IVCardLabeledValue<String>> labeledSortStringList = [];

    String group = null;
    String propertyKeyAndParamsString = null;
    for (var contentLine in contentLines) {
      final colonIndex = contentLine.indexOf(':'); // todo: backslash-escaped colons
      if (colonIndex < 1) {
        continue;
      }
      final groupAndPropertyKey = contentLine.substring(0, colonIndex);
      final valueString = contentLine.substring(colonIndex + 1);
      if (valueString.isEmpty) {
        continue;
      }
      final periodIndex = groupAndPropertyKey.indexOf('.');
      if (periodIndex == -1) {
        group = null;
        propertyKeyAndParamsString = groupAndPropertyKey;
      } else {
        group = groupAndPropertyKey.substring(0, periodIndex);
        propertyKeyAndParamsString = groupAndPropertyKey.substring(periodIndex + 1);
      }
      if (propertyKeyAndParamsString.isEmpty) {
        continue;
      }
      final propertyKeyAndParams =
          propertyKeyAndParamsString.split(';'); // todo: backslash-escaped semicolons

      final propertyKeyString = propertyKeyAndParams.first;
      final propertyKey =
          VCardEnumUtilities.vCardIanaPropertyKeyForString(propertyKeyString);
      if (propertyKey == null) {
        if (propertyKeyString.length > 2 && propertyKeyString.substring(0, 2).toUpperCase() == 'X-') {
          final extendedLabeledValue = _buildExtendedLabeledValue(group, propertyKeyAndParams, valueString);
          if (extendedLabeledValue != null) {
            extendedLabeledValueList.add(extendedLabeledValue);
          }
        }
        continue;
      }
      switch (propertyKey) {
        case VCardIanaPropertyKey.adr:
          final labeledAddress = _buildAddress(group, propertyKeyAndParams, valueString);
          if (labeledAddress != null) {
            labeledAddressList.add(labeledAddress);
          }
          break;
        case VCardIanaPropertyKey.bday:
          birthday = valueString; // TODO: validation
          break;
        case VCardIanaPropertyKey.categories:
          final labeledCategories = _buildCategories(group, propertyKeyAndParams, valueString);
          if (labeledCategories != null) {
            labeledCategoriesList.add(labeledCategories);
          }
          break;
        case VCardIanaPropertyKey.email:
          final labeledEmailAddress = _buildEmailAddress(group, propertyKeyAndParams, valueString);
          if (labeledEmailAddress != null) {
            labeledEmailAddressList.add(labeledEmailAddress);
          }
          break;
        case VCardIanaPropertyKey.fn:
          final labeledFormattedName = _buildFormattedName(group, propertyKeyAndParams, valueString);
          if (labeledFormattedName != null) {
            labeledFormattedNameList.add(labeledFormattedName);
          }
          break;
        case VCardIanaPropertyKey.geo:
          final labeledGeographicLocation = _buildGeographicLocation(group, propertyKeyAndParams, valueString);
          if (labeledGeographicLocation != null) {
            labeledGeographicLocationList.add(labeledGeographicLocation);
          }
          break;
        case VCardIanaPropertyKey.impp:
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.key:
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.label:
          final labeledLabel = _buildLabel(group, propertyKeyAndParams, valueString);
          if (labeledLabel != null) {
            labeledLabelList.add(labeledLabel);
          }
          break;
        case VCardIanaPropertyKey.logo:
          final labeledLogo = _buildPhotoOrLogo(group, propertyKeyAndParams, valueString);
          if (labeledLogo != null) {
            labeledLogoList.add(labeledLogo);
          }
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.mailer:
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.n:
          final labeledName = _buildName(group, propertyKeyAndParams, valueString);
          if (labeledName != null) {
            labeledNameList.add(labeledName);
          }
          break;
        case VCardIanaPropertyKey.name:
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.nickname:
          final labeledNickname = _buildNickname(group, propertyKeyAndParams, valueString);
          if (labeledNickname != null) {
            labeledNicknameList.add(labeledNickname);
          }
          break;
        case VCardIanaPropertyKey.note:
          final labeledNote = _buildNote(group, propertyKeyAndParams, valueString);
          if (labeledNote != null) {
            labeledNoteList.add(labeledNote);
          }
          break;
        case VCardIanaPropertyKey.org:
          final labeledOrganization = _buildOrganization(group, propertyKeyAndParams, valueString);
          if (labeledOrganization != null) {
            labeledOrganizationList.add(labeledOrganization);
          }
          break;
        case VCardIanaPropertyKey.photo:
          final labeledPhoto = _buildPhotoOrLogo(group, propertyKeyAndParams, valueString);
          if (labeledPhoto != null) {
            labeledPhotoList.add(labeledPhoto);
          }
          break;
        case VCardIanaPropertyKey.prodid:
          prodId = valueString;
          break;
        case VCardIanaPropertyKey.profile:
          if (valueString != 'VCARD') {
            return null;
          }
          break;
        case VCardIanaPropertyKey.rev:
          final thisLabeledRevisionTime = _buildRevisionTime(group, propertyKeyAndParams, valueString);
          if (thisLabeledRevisionTime != null) {
            labeledRevisionTime = thisLabeledRevisionTime;
          }
          break;
        case VCardIanaPropertyKey.role:
          final labeledRole = _buildRole(group, propertyKeyAndParams, valueString);
          if (labeledRole != null) {
            labeledRoleList.add(labeledRole);
          }
          break;
        case VCardIanaPropertyKey.sortString:
          final labeledSortString = _buildSortString(group, propertyKeyAndParams, valueString);
          if (labeledSortString != null) {
            labeledSortStringList.add(labeledSortString);
          }
          break;
        case VCardIanaPropertyKey.sound:
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.source:
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.tel:
          final labeledPhoneNumber = _buildPhoneNumber(group, propertyKeyAndParams, valueString);
          if (labeledPhoneNumber != null) {
            labeledPhoneNumberList.add(labeledPhoneNumber);
          }
          break;
        case VCardIanaPropertyKey.title:
          final labeledTitle = _buildTitle(group, propertyKeyAndParams, valueString);
          if (labeledTitle != null) {
            labeledTitleList.add(labeledTitle);
          }
          break;
        case VCardIanaPropertyKey.tz:
          // TODO: Handle this case.
          final labeledTimeZone = _buildTimeZone(group, propertyKeyAndParams, valueString);
          if (labeledTimeZone != null) {
            labeledTimeZoneList.add(labeledTimeZone);
          }
          break;
        case VCardIanaPropertyKey.uid:
          // TODO: Handle this case.
          break;
        case VCardIanaPropertyKey.url:
          uriList.add(valueString);
          break;
        default:
          break;
      }
    }
    // vCard v3.0 requires the N and FN properties.
    if (labeledNameList.isEmpty || labeledFormattedNameList.isEmpty) {
      return null;
    }
    return VCard3_0._(
        labeledFormattedNameList,
        labeledNameList,
        labeledNicknameList,
        labeledPhotoList,
        birthday,
        labeledAddressList,
        labeledPhoneNumberList,
        labeledEmailAddressList,
        labeledTimeZoneList,
        labeledGeographicLocationList,
        labeledTitleList,
        labeledRoleList,
        labeledLogoList,
        labeledOrganizationList,
        labeledCategoriesList,
        labeledNoteList,
        prodId,
        labeledRevisionTime,
        uriList,
        extendedLabeledValueList,
        labeledLabelList,
        labeledSortStringList
    );
  }

  // precondition: `propertyKeyAndParams` is `['ADR', ...]`, and `valueString` is nonnull and nonempty.
  static IVCardLabeledValue<IVCardAddress> _buildAddress(
      String group,
      List<String> propertyKeyAndParams,
      String valueString
      ) {
    const Set<VCardIanaParamValue> allowedTypeValues = {
      VCardIanaParamValue.intl,
      VCardIanaParamValue.dom,
      VCardIanaParamValue.postal,
      VCardIanaParamValue.parcel,
      VCardIanaParamValue.home,
      VCardIanaParamValue.work,
      VCardIanaParamValue.pref,
    };
    List<VCardIanaParamValue> typeValues = [];
    final paramComponents = propertyKeyAndParams.sublist(1);
    for (var paramComponent in paramComponents) {
      final paramComponentParts = paramComponent.split('=');
      if (paramComponentParts.length != 2) {
        continue;
      }
      final paramNameString = paramComponentParts.first;
      final paramName =
          VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null || paramName != VCardIanaParamName.type) { // TODO: allow LANGUAGE parameters
        continue;
      }
      final paramValueStrings = paramComponentParts[1].split(',');
      for (var paramValueString in paramValueStrings) {
        final paramValue =
            VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
        if (paramValue != null && allowedTypeValues.contains(paramValue)) {
          typeValues.add(paramValue);
        }
      }
    }
    final addressComponents = valueString.split(';');
    final poBox = addressComponents.first;
    final extendedAddress =
        1 < addressComponents.length ? addressComponents[1] : null;
    final street =
        2 < addressComponents.length ? addressComponents[2] : null;
    final locality =
        3 < addressComponents.length ? addressComponents[3] : null;
    final region =
        4 < addressComponents.length ? addressComponents[4] : null;
    final postalCode =
        5 < addressComponents.length ? addressComponents[5] : null;
    final countryName =
        6 < addressComponents.length
            ? addressComponents.sublist(6).join(';')
            : null;
    final address = VCardAddress.vCardAddress(
      poBox.isEmpty ? null : poBox,
      extendedAddress != null && extendedAddress.isEmpty
          ? null
          : extendedAddress,
      street != null && street.isEmpty ? null : street,
      locality != null && locality.isEmpty ? null : locality,
      region != null && region.isEmpty ? null : region,
      postalCode != null && postalCode.isEmpty ? null : postalCode,
      countryName != null && countryName.isEmpty ? null : countryName
    );
    final List<VCardIanaParam> paramList = typeValues.isNotEmpty
        ? [
            VCardIanaParam.vCardIanaParam(
                VCardIanaParamName.type,
                typeValues
                    .map(
                        VCardIanaBoundedParamValue.vCardIanaBoundedParamValue
                    )
                    .toList()
            )
          ]
        : null;
    return VCardLabeledValue.vCardLabeledValue(group, paramList, address);
  }

  // precondition: `propertyKeyAndParams` is `['CATEGORIES', ...]` and `valueString` is nonnull and nonempty.
  static IVCardLabeledValue<List<String>> _buildCategories(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    final values = valueString.split(',');
    return VCardLabeledValue.vCardLabeledValue(group, paramList, values);
  }
  
  static IVCardLabeledValue<String> _buildEmailAddress(String group, List<String> propertyKeyAndParams, String valueString) {
    const Set<VCardIanaParamValue> allowedTypeValues = { // TODO: allow x- values
      VCardIanaParamValue.work,
      VCardIanaParamValue.internet,
      VCardIanaParamValue.pref,
      VCardIanaParamValue.x400,
    };
    List<VCardIanaParamValue> typeValues = [];
    final paramComponents = propertyKeyAndParams.sublist(1);
    for (var paramComponent in paramComponents) {
      final paramComponentParts = paramComponent.split('=');
      if (paramComponentParts.length != 2) {
        continue;
      }
      final paramNameString = paramComponentParts.first;
      final paramName =
      VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null || paramName != VCardIanaParamName.type) {
        continue;
      }
      final paramValueStrings = paramComponentParts[1].split(',');
      for (var paramValueString in paramValueStrings) {
        final paramValue =
        VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
        if (paramValue != null && allowedTypeValues.contains(paramValue)) {
          typeValues.add(paramValue);
        }
      }
    }
    final List<VCardIanaParam> paramList = typeValues.isNotEmpty
        ? [
            VCardIanaParam.vCardIanaParam(
                VCardIanaParamName.type,
                typeValues
                    .map(
                        VCardIanaBoundedParamValue.vCardIanaBoundedParamValue
                    )
                    .toList()
            )
          ]
        : null;
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<String> _buildFormattedName(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<VCardLatLng> _buildGeographicLocation(String group, List<String> propertyKeyAndParams, String valueString) {
    final latLngComponents = valueString.split(';');
    if (latLngComponents.length < 2) {
      return null;
    }
    final latLng = VCardLatLng.vCardLatLng(latLngComponents[0], latLngComponents[1]);
    if (latLng == null) {
      return null;
    }
    return VCardLabeledValue.vCardLabeledValue(group, [], latLng);
  }

  static IVCardLabeledValue<String> _buildLabel(String group, List<String> propertyKeyAndParams, String valueString) {
    const Set<VCardIanaParamValue> allowedTypeValues = {
      VCardIanaParamValue.intl,
      VCardIanaParamValue.dom,
      VCardIanaParamValue.postal,
      VCardIanaParamValue.parcel,
      VCardIanaParamValue.home,
      VCardIanaParamValue.work,
      VCardIanaParamValue.pref,
    };
    List<VCardIanaParamValue> typeValues = [];
    final paramComponents = propertyKeyAndParams.sublist(1);
    for (var paramComponent in paramComponents) {
      final paramComponentParts = paramComponent.split('=');
      if (paramComponentParts.length != 2) {
        continue;
      }
      final paramNameString = paramComponentParts.first;
      final paramName =
      VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null || paramName != VCardIanaParamName.type) { // TODO: allow LANGUAGE parameters
        continue;
      }
      final paramValueStrings = paramComponentParts[1].split(',');
      for (var paramValueString in paramValueStrings) {
        final paramValue =
        VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
        if (paramValue != null && allowedTypeValues.contains(paramValue)) {
          typeValues.add(paramValue);
        }
      }
    }
    final List<VCardIanaParam> paramList = typeValues.isNotEmpty
        ? [
      VCardIanaParam.vCardIanaParam(
          VCardIanaParamName.type,
          typeValues
              .map(
              VCardIanaBoundedParamValue.vCardIanaBoundedParamValue
          )
              .toList()
      )
    ]
        : null;
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<VCardName> _buildName(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    final nameComponents = valueString.split(';');
    final familyNames = nameComponents.first.split(',');
    final givenNames =
        1 < nameComponents.length ? nameComponents[1].split(',') : null;
    final middleNames =
        2 < nameComponents.length ? nameComponents[2].split(',') : null;
    final prefixes =
        3 < nameComponents.length ? nameComponents[3].split(',') : null;
    final suffixes =
        4 < nameComponents.length ? nameComponents[4].split(',') : null;
    final name = VCardName.vCardName(
        familyNames,
        givenNames,
        middleNames,
        prefixes,
        suffixes
    );
    return VCardLabeledValue.vCardLabeledValue(group, paramList, name);
  }

  static IVCardLabeledValue<List<String>> _buildNickname(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    final nicknameList = valueString.split(',');
    return VCardLabeledValue.vCardLabeledValue(group, paramList, nicknameList);
  }

  static IVCardLabeledValue<String> _buildNote(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<IVCardOrganization> _buildOrganization(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    final components = valueString.split(';');
    final organization = VCardOrganization.vCardOrganization(components.first, components.sublist(1));
    return VCardLabeledValue.vCardLabeledValue(group, paramList, organization);
  }

  static IVCardLabeledValue<String> _buildRevisionTime(String group, List<String> propertyKeyAndParams, String valueString) {
    const Set<VCardIanaParamValue> allowedValueValues = {
      VCardIanaParamValue.date,
      VCardIanaParamValue.dateTime,
    };
    VCardIanaParamValue valueValue = null; // sic
    final paramComponents = propertyKeyAndParams.sublist(1);
    for (var paramComponent in paramComponents) {
      final paramComponentParts = paramComponent.split('=');
      if (paramComponentParts.length != 2) {
        continue;
      }
      final paramNameString = paramComponentParts.first;
      final paramName =
          VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null || paramName != VCardIanaParamName.value) {
        continue;
      }
      final paramValueStrings = paramComponentParts[1].split(',');
      for (var paramValueString in paramValueStrings) {
        final paramValue =
        VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
        if (paramValue != null && allowedValueValues.contains(paramValue)) {
          valueValue = paramValue;
        }
      }
    }
    final List<VCardIanaParam> paramList = valueValue != null
        ? [
            VCardIanaParam.vCardIanaParam(
                VCardIanaParamName.value,
                [
                  VCardIanaBoundedParamValue
                      .vCardIanaBoundedParamValue(valueValue)
                ]
            )
          ]
        : null;
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<String> _buildRole(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<String> _buildSortString(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<String> _buildPhoneNumber(String group, List<String> propertyKeyAndParams, String valueString) {
    const Set<VCardIanaParamValue> allowedTypeValues = { // TODO: allow x- values
      VCardIanaParamValue.home,
      VCardIanaParamValue.work,
      VCardIanaParamValue.pref,
      VCardIanaParamValue.voice,
      VCardIanaParamValue.fax,
      VCardIanaParamValue.msg,
      VCardIanaParamValue.cell,
      VCardIanaParamValue.pager,
      VCardIanaParamValue.bbs,
      VCardIanaParamValue.modem,
      VCardIanaParamValue.car,
      VCardIanaParamValue.isdn,
      VCardIanaParamValue.video,
      VCardIanaParamValue.pcs,
      VCardIanaParamValue.text,
      VCardIanaParamValue.textphone,
      VCardIanaParamValue.mainNumber,
    };
    List<VCardIanaParamValue> typeValues = [];
    final paramComponents = propertyKeyAndParams.sublist(1);
    for (var paramComponent in paramComponents) {
      final paramComponentParts = paramComponent.split('=');
      if (paramComponentParts.length != 2) {
        continue;
      }
      final paramNameString = paramComponentParts.first;
      final paramName =
          VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null || paramName != VCardIanaParamName.type) {
        continue;
      }
      final paramValueStrings = paramComponentParts[1].split(',');
      for (var paramValueString in paramValueStrings) {
        final paramValue =
            VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
        if (paramValue != null && allowedTypeValues.contains(paramValue)) {
          typeValues.add(paramValue);
        }
      }
    }
    final List<VCardIanaParam> paramList = typeValues.isNotEmpty
        ? [
            VCardIanaParam.vCardIanaParam(
                VCardIanaParamName.type,
                typeValues
                    .map(
                        VCardIanaBoundedParamValue.vCardIanaBoundedParamValue
                    )
                    .toList()
            )
          ]
        : null;
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<String> _buildTitle(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<String> _buildTimeZone(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramComponents = propertyKeyAndParams.sublist(1);
    List<AbstractVCardParam> paramList = [];
    for (var paramComponent in paramComponents) {
      final paramComponentParts = paramComponent.split('=');
      if (paramComponentParts.length != 2) {
        continue;
      }
      final paramNameString = paramComponentParts.first;
      final paramName = VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null || paramName != VCardIanaParamName.value) {
        continue;
      }
      final paramValueString = paramComponentParts[1];
      final paramValue = VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
      if (paramValue == null || paramValue != VCardIanaParamValue.text) {
        continue;
      }
      paramList.add(
          VCardIanaParam
              .vCardIanaParam(
                  paramName,
                  [
                    VCardIanaBoundedParamValue
                        .vCardIanaBoundedParamValue(paramValue)
                  ]
              )
      );
    }
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardLabeledValue<String> _buildPhotoOrLogo(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramComponents = propertyKeyAndParams.sublist(1);
    List<AbstractVCardParam> paramList = [];
    for (var paramComponent in paramComponents) {
      final paramComponentParts = paramComponent.split('=');
      if (paramComponentParts.length != 2) {
        continue;
      }
      final paramNameString = paramComponentParts.first;
      final paramName =
      VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null) {
        continue;
      }
      final paramValueString = paramComponentParts[1];
      if (paramName == VCardIanaParamName.type) {
        final unboundedParamValue =
        VCardIanaUnboundedParamValue
            .vCardIanaUnboundedParamValue(paramValueString);
        paramList.add(
            VCardIanaParam.vCardIanaParam(paramName, [unboundedParamValue])
        );
      } else if (paramName == VCardIanaParamName.value) {
        final paramValue =
        VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
        if (paramValue == null
            || (
                paramValue != VCardIanaParamValue.binary
                    && paramValue != VCardIanaParamValue.uri
            )) {
          continue;
        }
        final boundedParamValue =
        VCardIanaBoundedParamValue.vCardIanaBoundedParamValue(paramValue);
        paramList.add(
            VCardIanaParam.vCardIanaParam(paramName, [boundedParamValue])
        );
      } else if (paramName == VCardIanaParamName.encoding) {
        final paramValue =
        VCardEnumUtilities.vCardIanaParamValueForString(paramValueString);
        if (paramValue == null || paramValue != VCardIanaParamValue.b) {
          continue;
        }
        final boundedParamValue =
        VCardIanaBoundedParamValue.vCardIanaBoundedParamValue(paramValue);
        paramList.add(
            VCardIanaParam.vCardIanaParam(paramName, [boundedParamValue])
        );
      }
    } // todo: check to make sure required img params are there?
    return VCardLabeledValue.vCardLabeledValue(group, paramList, valueString);
  }

  static IVCardExtendedLabeledValue _buildExtendedLabeledValue(String group, List<String> propertyKeyAndParams, String valueString) {
    final paramList = _buildParamList(propertyKeyAndParams.sublist(1));
    return VCardExtendedLabeledValue.vCardExtendedLabeledValue(
        group,
        propertyKeyAndParams.first,
        paramList,
        valueString
    );
  }

  static List<AbstractVCardParam> _buildParamList(
      List<String> paramStringList) {
    List<AbstractVCardParam> result = [];
    for (var paramString in paramStringList) { // todo: support x- params
      final paramNameAndValues = paramString.split('=');
      if (paramNameAndValues.length != 2) { // is `'='` escapable?
        continue;
      }
      final paramNameString = paramNameAndValues.first;
      final paramName =
          VCardEnumUtilities.vCardIanaParamNameForString(paramNameString);
      if (paramName == null) {
        continue;
      }
      final paramValueStringList = paramNameAndValues[1].split(',');
      if (paramName == VCardIanaParamName.language) {
        final languageParamValueList =
            paramValueStringList
                .map(
                    VCardIanaUnboundedParamValue.vCardIanaUnboundedParamValue
                )
                .toList();
        result.add(
            VCardIanaParam.vCardIanaParam(paramName, languageParamValueList)
        );
      } else if (paramName == VCardIanaParamName.value) {
        final boundedParamValue =
            VCardEnumUtilities
                .vCardIanaParamValueForString(paramValueStringList.first);
        result.add(
            VCardIanaParam
                .vCardIanaParam(
                    paramName,
                    [
                      boundedParamValue == null
                          ? VCardIanaUnboundedParamValue
                                .vCardIanaUnboundedParamValue(
                                    paramValueStringList.first
                                )
                          : VCardIanaBoundedParamValue
                                .vCardIanaBoundedParamValue(
                                    boundedParamValue
                                )
                    ]
                )
        );
      }
    }
    return result;
  }

  static String _serializeLabeledFormattedName(
      IVCardLabeledValue<String> labeledFormattedName) =>
      _serializeLabeledProperty(
          labeledFormattedName.group,
          VCardIanaPropertyKey.fn,
          labeledFormattedName.vCardParamList,
          labeledFormattedName.value
      );

  static String _serializeLabeledName(
      IVCardLabeledValue<IVCardName> labeledName) {
    final serializedName = _serializeName(labeledName.value);
    return _serializeLabeledProperty(
        labeledName.group,
        VCardIanaPropertyKey.n,
        labeledName.vCardParamList,
        serializedName
    );
  }

  static String _serializeLabeledNickname(
      IVCardLabeledValue<List<String>> labeledNickname) =>
      _serializeLabeledProperty(
          labeledNickname.group,
          VCardIanaPropertyKey.nickname,
          labeledNickname.vCardParamList,
          labeledNickname.value.join(',')
      );

  static String _serializeLabeledPhoto(
      IVCardLabeledValue<String> labeledPhoto) =>
      _serializeLabeledProperty(
          labeledPhoto.group,
          VCardIanaPropertyKey.photo,
          labeledPhoto.vCardParamList,
          labeledPhoto.value
      );

  static String _serializeLabeledAddress(
      IVCardLabeledValue<IVCardAddress> labeledAddress) {
    final serializedAddress = _serializeAddress(labeledAddress.value);
    return _serializeLabeledProperty(
        labeledAddress.group,
        VCardIanaPropertyKey.adr,
        labeledAddress.vCardParamList,
        serializedAddress
    );
  }

  static String _serializeLabeledPhoneNumber(
      IVCardLabeledValue<String> labeledPhoneNumber) =>
      _serializeLabeledProperty(
          labeledPhoneNumber.group,
          VCardIanaPropertyKey.tel,
          labeledPhoneNumber.vCardParamList,
          labeledPhoneNumber.value
      );

  static String _serializeLabeledEmailAddress(
      IVCardLabeledValue<String> labeledEmailAddress) =>
      _serializeLabeledProperty(
          labeledEmailAddress.group,
          VCardIanaPropertyKey.email,
          labeledEmailAddress.vCardParamList,
          labeledEmailAddress.value
      );

  static String _serializeLabeledTimeZone(
      IVCardLabeledValue<String> labeledTimeZone) =>
      _serializeLabeledProperty(
          labeledTimeZone.group,
          VCardIanaPropertyKey.tz,
          labeledTimeZone.vCardParamList,
          labeledTimeZone.value
      );

  static String _serializeLabeledGeographicLocation(
      IVCardLabeledValue<IVCardLatLng> labeledGeographicLocation) {
    final serializedGeographicLocation =
        _serializeLatLng(labeledGeographicLocation.value);
    return _serializeLabeledProperty(
        labeledGeographicLocation.group,
        VCardIanaPropertyKey.geo,
        [],
        serializedGeographicLocation
    );
  }

  static String _serializeLabeledLabel(
      IVCardLabeledValue<String> labeledLabel) =>
      _serializeLabeledProperty(
          labeledLabel.group,
          VCardIanaPropertyKey.label,
          labeledLabel.vCardParamList,
          labeledLabel.value
      );

  static String _serializeLabeledTitle(
      IVCardLabeledValue<String> labeledTitle) =>
      _serializeLabeledProperty(
          labeledTitle.group,
          VCardIanaPropertyKey.title,
          labeledTitle.vCardParamList,
          labeledTitle.value
      );

  static String _serializeLabeledRole(
      IVCardLabeledValue<String> labeledRole) =>
      _serializeLabeledProperty(
          labeledRole.group,
          VCardIanaPropertyKey.role,
          labeledRole.vCardParamList,
          labeledRole.value
      );

  static String _serializeLabeledLogo(
      IVCardLabeledValue<String> labeledLogo) =>
      _serializeLabeledProperty(
          labeledLogo.group,
          VCardIanaPropertyKey.logo,
          labeledLogo.vCardParamList,
          labeledLogo.value
      );

  static String _serializeLabeledOrganization(
      IVCardLabeledValue<IVCardOrganization> labeledOrganization) {
    final serializedOrganization =
        _serializeOrganization(labeledOrganization.value);
    return _serializeLabeledProperty(
        labeledOrganization.group,
        VCardIanaPropertyKey.org,
        labeledOrganization.vCardParamList,
        serializedOrganization
    );
  }
  
  static String _serializeLabeledCategories(
      IVCardLabeledValue<List<String>> labeledCategories) =>
      _serializeLabeledProperty(
          labeledCategories.group,
          VCardIanaPropertyKey.categories,
          labeledCategories.vCardParamList,
          labeledCategories.value.join(',')
      );

  static String _serializeLabeledNote(
      IVCardLabeledValue<String> labeledNote) =>
      _serializeLabeledProperty(
          labeledNote.group,
          VCardIanaPropertyKey.note,
          labeledNote.vCardParamList,
          labeledNote.value
      );
  
  static String _serializeLabeledRevisionTime(
      IVCardLabeledValue<String> labeledRevisionTime) =>
      _serializeLabeledProperty(
          labeledRevisionTime.group,
          VCardIanaPropertyKey.rev,
          labeledRevisionTime.vCardParamList,
          labeledRevisionTime.value
      );

  static String _serializeLabeledSortString(
      IVCardLabeledValue<String> labeledSortString) =>
      _serializeLabeledProperty(
          labeledSortString.group,
          VCardIanaPropertyKey.sortString,
          labeledSortString.vCardParamList,
          labeledSortString.value
      );

  static String _serializeName(IVCardName name) { // Little Bobby Tables breaks this
    List<String> components = [];
    final suffixes = name.suffixes;
    if (suffixes != null) {
      components.add(suffixes.join(','));
    }
    final prefixes = name.prefixes;
    if (prefixes != null) {
      components.insert(0, prefixes.join(','));
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final middleNames = name.middleNames;
    if (middleNames != null) {
      components.insert(0, middleNames.join(','));
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final givenNames = name.givenNames;
    if (givenNames != null) {
      components.insert(0, givenNames.join(','));
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final familyNames = name.familyNames;
    if (familyNames != null) {
      components.insert(0, familyNames.join(','));
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    return components.join(';');
  }

  static String _serializeAddress(IVCardAddress address) { // todo: convert commas to newlines per spec?
    List<String> components = [];
    final countryName = address.countryName;
    if (countryName != null) {
      components.add(countryName);
    }
    final postalCode = address.postalCode;
    if (postalCode != null) {
      components.insert(0, postalCode);
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final region = address.region;
    if (region != null) {
      components.insert(0, region);
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final locality = address.locality;
    if (locality != null) {
      components.insert(0, locality);
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final street = address.street;
    if (street != null) {
      components.insert(0, street);
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final extendedAddress = address.extendedAddress;
    if (extendedAddress != null) {
      components.insert(0, extendedAddress);
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    final poBox = address.poBox;
    if (poBox != null) {
      components.insert(0, poBox);
    } else if (components.isNotEmpty) {
      components.insert(0, '');
    }
    return components.join(';');
  }

  static String _serializeLatLng(IVCardLatLng latLng) =>
      '${latLng.latitude};${latLng.longitude}';

  static String _serializeOrganization(IVCardOrganization organization) {
    final components = [organization.name] + organization.organizationUnits;
    return components.join(';');
  }

  static String _serializeLabeledProperty(
      String group,
      VCardIanaPropertyKey propertyKey,
      List<AbstractVCardParam> paramList,
      String serializedPropertyValue
      ) {
    final serializedGroup = group == null ? '' : '$group.';
    final serializedProperty =
        VCardEnumUtilities.stringForVCardIanaPropertyKey(propertyKey);
    final serializedParamList = _serializeParamList(paramList);
    return
        '$serializedGroup$serializedProperty$serializedParamList:$serializedPropertyValue';
  }

  static String _serializeExtendedLabeledProperty(
      String group,
      String propertyKey,
      List<AbstractVCardParam> paramList,
      String stringValue
      ) {
    final serializedGroup = group == null ? '' : '$group.';
    final serializedParamList = _serializeParamList(paramList);
    return '$serializedGroup$propertyKey$serializedParamList:$stringValue';
  }

  static String _serializeParamList(List<AbstractVCardParam> paramList) {
    if (paramList == null) {
      return '';
    }
    List<String> serializedParamList = [];
    for (var param in paramList) {
      final serializedParam = _serializeParam(param);
      if (serializedParam != null) {
        serializedParamList.add(serializedParam);
      }
    }
    return serializedParamList.map((s) => ';$s').toList().join('');
  }

  static String _serializeParam(AbstractVCardParam param) {
    if (param is IVCardIanaParam) {
      final serializedParamName =
          VCardEnumUtilities.stringForVCardIanaParamName(param.paramName);
      final serializedParamValueList = param.paramValueList.map((v) {
        if (v is IVCardIanaBoundedParamValue) {
          return VCardEnumUtilities.stringForVCardIanaParamValue(v.value);
        } else if (v is IVCardIanaUnboundedParamValue) {
          return v.value;
        } else {
          return ''; // should be unreachable
        }
      }).toList();
      return '$serializedParamName=${serializedParamValueList.join(',')}';
    } else if (param is IVCardXParam) { // todo: support these
      return null;
    } else {
      return null; // should be unreachable
    }
  }

  VCard3_0._(
      this._labeledFormattedNameList,
      this._labeledNameList,
      this._labeledNicknameList,
      this._labeledPhotoList,
      this._birthday,
      this._labeledAddressList,
      this._labeledPhoneNumberList,
      this._labeledEmailAddressList,
      this._labeledTimeZoneList,
      this._labeledGeographicLocationList,
      this._labeledTitleList,
      this._labeledRoleList,
      this._labeledLogoList,
      this._labeledOrganizationList,
      this._labeledCategoriesList,
      this._labeledNoteList,
      this._prodId,
      this._labeledRevisionTime,
      this._uriList,
      this._extendedLabeledValueList,
      this._labeledLabelList,
      this._labeledSortStringList
  );

  List<IVCardLabeledValue<String>> _labeledFormattedNameList;
  List<IVCardLabeledValue<IVCardName>> _labeledNameList;
  List<IVCardLabeledValue<List<String>>> _labeledNicknameList;
  List<IVCardLabeledValue<String>> _labeledPhotoList;
  String _birthday;
  List<IVCardLabeledValue<IVCardAddress>> _labeledAddressList;
  List<IVCardLabeledValue<String>> _labeledPhoneNumberList;
  List<IVCardLabeledValue<String>> _labeledEmailAddressList;
  List<IVCardLabeledValue<String>> _labeledTimeZoneList;
  List<IVCardLabeledValue<IVCardLatLng>> _labeledGeographicLocationList;
  List<IVCardLabeledValue<String>> _labeledTitleList;
  List<IVCardLabeledValue<String>> _labeledRoleList;
  List<IVCardLabeledValue<String>> _labeledLogoList;
  List<IVCardLabeledValue<IVCardOrganization>> _labeledOrganizationList;
  List<IVCardLabeledValue<List<String>>> _labeledCategoriesList;
  List<IVCardLabeledValue<String>> _labeledNoteList;
  String _prodId;
  IVCardLabeledValue<String> _labeledRevisionTime;
  List<String> _uriList;
  List<IVCardExtendedLabeledValue> _extendedLabeledValueList;

  List<IVCardLabeledValue<String>> _labeledLabelList;
  List<IVCardLabeledValue<String>> _labeledSortStringList;

  VCardVersion get vCardVersion => VCardVersion.v3_0;
  List<IVCardLabeledValue<String>> get labeledFormattedNameList => _labeledFormattedNameList;
  List<IVCardLabeledValue<IVCardName>> get labeledNameList => _labeledNameList;
  List<IVCardLabeledValue<List<String>>> get labeledNicknameList => _labeledNicknameList;
  List<IVCardLabeledValue<String>> get labeledPhotoList => _labeledPhotoList;
  String get birthday => _birthday;
  List<IVCardLabeledValue<IVCardAddress>> get labeledAddressList => _labeledAddressList;
  List<IVCardLabeledValue<String>> get labeledPhoneNumberList => _labeledPhoneNumberList;
  List<IVCardLabeledValue<String>> get labeledEmailAddressList => _labeledEmailAddressList;
  List<IVCardLabeledValue<String>> get labeledTimeZoneList => _labeledTimeZoneList;
  List<IVCardLabeledValue<IVCardLatLng>> get labeledGeographicLocationList => _labeledGeographicLocationList;
  List<IVCardLabeledValue<String>> get labeledTitleList => _labeledTitleList;
  List<IVCardLabeledValue<String>> get labeledRoleList => _labeledRoleList;
  List<IVCardLabeledValue<String>> get labeledLogoList => _labeledLogoList;
  List<IVCardLabeledValue<IVCardOrganization>> get labeledOrganizationList => _labeledOrganizationList;
  List<IVCardLabeledValue<List<String>>> get labeledCategoriesList => _labeledCategoriesList;
  List<IVCardLabeledValue<String>> get labeledNoteList => _labeledNoteList;
  String get prodId => _prodId;
  IVCardLabeledValue<String> get labeledRevisionTime => _labeledRevisionTime;
  List<String> get uriList => _uriList;
  List<IVCardExtendedLabeledValue> get extendedLabeledValueList => _extendedLabeledValueList;

  /// A list of formatted shipping/ mailing labels and their groups and
  /// parameters.  These are represented in the vCard as `LABEL` properties.
  List<IVCardLabeledValue<String>> get labeledLabelList => _labeledLabelList;

  /// A list of `String`s used in (possibly language-specific) sorting by
  /// name, along with their groups and parameters.  These are represented in
  /// the vCard as `SORT-STRING` properties.
  List<IVCardLabeledValue<String>> get labeledSortStringList =>
      _labeledSortStringList;

  String serialize() {
    List<String> contentLines =
        [
          '${VCardEnumUtilities.stringForVCardIanaPropertyKey(VCardIanaPropertyKey.version)}:${VCardEnumUtilities.stringForVCardVersion(VCardVersion.v3_0)}',
          '${VCardEnumUtilities.stringForVCardIanaPropertyKey(VCardIanaPropertyKey.prodid)}:${VCard.defaultProdId}', // creating a vCard from internal structural representation, potentially reordering properties and/ or correcting non-conforming properties and enforcing consistent capitalization
        ];
    for (var labeledFormattedName in _labeledFormattedNameList) {
      contentLines.add(_serializeLabeledFormattedName(labeledFormattedName));
    }
    for (var labeledName in _labeledNameList) {
      contentLines.add(_serializeLabeledName(labeledName));
    }
    for (var labeledNickname in _labeledNicknameList) {
      contentLines.add(_serializeLabeledNickname(labeledNickname));
    }
    for (var labeledPhoto in _labeledPhotoList) {
      contentLines.add(_serializeLabeledPhoto(labeledPhoto));
    }
    if (_birthday != null) {
      contentLines.add(
          '${VCardEnumUtilities.stringForVCardIanaPropertyKey(VCardIanaPropertyKey.bday)}:$_birthday'
      );
    }
    for (var labeledAddress in _labeledAddressList) {
      contentLines.add(_serializeLabeledAddress(labeledAddress));
    }
    for (var labeledLabel in _labeledLabelList) {
      contentLines.add(_serializeLabeledLabel(labeledLabel));
    }
    for (var labeledPhoneNumber in _labeledPhoneNumberList) {
      contentLines.add(_serializeLabeledPhoneNumber(labeledPhoneNumber));
    }
    for (var labeledEmailAddress in _labeledEmailAddressList) {
      contentLines.add(_serializeLabeledEmailAddress(labeledEmailAddress));
    }
    for (var labeledTimeZone in _labeledTimeZoneList) {
      contentLines.add(_serializeLabeledTimeZone(labeledTimeZone));
    }
    for (var labeledGeographicLocation in _labeledGeographicLocationList) {
      contentLines.add(
          _serializeLabeledGeographicLocation(labeledGeographicLocation)
      );
    }
    for (var labeledTitle in _labeledTitleList) {
      contentLines.add(_serializeLabeledTitle(labeledTitle));
    }
    for (var labeledRole in _labeledRoleList) {
      contentLines.add(_serializeLabeledRole(labeledRole));
    }
    for (var labeledLogo in _labeledLogoList) {
      contentLines.add(_serializeLabeledLogo(labeledLogo));
    }
    for (var labeledOrganization in _labeledOrganizationList) {
      contentLines.add(_serializeLabeledOrganization(labeledOrganization));
    }
    for (var labeledCategories in _labeledCategoriesList) {
      contentLines.add(_serializeLabeledCategories(labeledCategories));
    }
    for (var labeledNote in _labeledNoteList) {
      contentLines.add(_serializeLabeledNote(labeledNote));
    }
    if (_labeledRevisionTime != null) {
      contentLines.add(_serializeLabeledRevisionTime(labeledRevisionTime));
    }
    for (var labeledSortString in _labeledSortStringList) {
      contentLines.add(_serializeLabeledSortString(labeledSortString));
    }
    for (var uri in _uriList) {
      contentLines.add(
          '${VCardEnumUtilities.stringForVCardIanaPropertyKey(VCardIanaPropertyKey.url)}:$uri'
      );
    }
    for (var extendedLabeledValue in _extendedLabeledValueList) {
      final serializedExtendedLabeledValue =
          _serializeExtendedLabeledProperty(
              extendedLabeledValue.group,
              extendedLabeledValue.propertyKey,
              extendedLabeledValue.vCardParamList,
              extendedLabeledValue.value
          );
      contentLines.add(serializedExtendedLabeledValue);
    }
    return '${VCardEnumUtilities.beginVCard}${VCardUtilities.crlf}${contentLines.map((l) => '$l${VCardUtilities.crlf}').toList().join('')}${VCardEnumUtilities.endVCard}${VCardUtilities.crlf}';
  }
}
