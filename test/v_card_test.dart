import 'package:contact_cardio/contact_cardio.dart';
import 'package:test/test.dart';

void main() {
  final formattedName = 'Radical Edward Wong Hau Pepelu Tivrusky IV';
  final englishFamilyNames = ['Tivrusky'];
  final englishGivenNames = ['Edward'];
  final englishMiddleNames = ['Wong', 'Hau', 'Pepelu'];
  final englishPrefixes = ['Radical'];
  final englishSuffixes = ['IV'];
  final englishNameString =
      [
        englishFamilyNames,
        englishGivenNames,
        englishMiddleNames,
        englishPrefixes,
        englishSuffixes
      ]
          .map((l) => l.join(','))
          .toList()
          .join(';');
  final japaneseFamilyNames = ['チブルスキー'];
  final japaneseGivenNames = ['エドワード'];
  final japaneseMiddleNames = ['ウォン', 'ハウ', 'ペペル'];
  final japanesePrefixes = ['ラディカル'];
  final japaneseSuffixes = ['４世'];
  final japaneseNameString =
      [
        japaneseFamilyNames,
        japaneseGivenNames,
        japaneseMiddleNames,
        japanesePrefixes,
        japaneseSuffixes
      ]
          .map((l) => l.join(','))
          .toList()
          .join(';');
  final englishNicknameList =
      [
        'Ed',
        'Françoise Appledelhi',
        'Edward Wang Hwe Pepel Cybulski 4th',
        'Radical Edward'
      ];
  final englishNicknameString = englishNicknameList.join(',');
  final japaneseNicknameList = ['エド', 'ラディカル・エドワード'];
  final japaneseNicknameString = japaneseNicknameList.join(',');
  final birthday = '20580101';
  final englishSortString = 'Tivruski';
  final japaneseSortString = 'チブルスキー';
  final photoUri =
      'https://cdnb.artstation.com/p/assets/images/images/008/240/367/large/ruben-de-vela-radical-edward-14.jpg';
  final logoUri =
      'https://vignette.wikia.nocookie.net/cowboybebop/images/d/d3/FAicon.png';
  final workPhoneNumber = '19002326742';
  final homePhoneNumber = '18004204242';
  final workEmailAddress = 'bebop.radical.edward@protonmail.com';
  final prefEmailAddress =
      'edward.wong.hau.pepelu.tivrusky.iv@protonmail.com';
  final orphanageAddressStreet =
      'Praça Nossa Sra. do Brasil, 01 - Jardim America';
  final orphanageAddressLocality = 'São Paulo';
  final orphanageAddressRegion = 'SP';
  final orphanageAddressPostalCode = '01438-060';
  final orphanageAddressCountryName = 'Brazil';
  final redDragonAddressExtendedAddress = '88444';
  final redDragonAddressStreet = '88 Red Dragon Road';
  final redDragonAddressLocality = 'Tharsis';
  final redDragonAddressCountryName = 'Mars';
  final orphanageLocationLat = '-23.5694769';
  final orphanageLocationLng = '-46.6727276';
  final orphanageTimeZone = '-03:00;BRT;Brasília Time';
  final noteText =
      'Ed will introduce Ed.  Full name Edward Wong Hau Pepelu Tivruski IV...  Ed made up that name for Ed.  Isn\'t it coooooool?';
  final redDragonLabel =
      'Code Name Radical Ed\\nMail Drop: Bebop\\n88 Red Dragon Road\\nTharsis\\, Mars.';
  final redDragonOrgName = 'Red Dragon Society';
  final redDragonOrgOrgUnits = ['Cyber Division', 'Secret Cyber Agents'];
  final redDragonOrgComponents = [redDragonOrgName] + redDragonOrgOrgUnits;
  final redDragonOrgString = redDragonOrgComponents.join(';');
  final bebopOrgString = 'Bebop';
  final redDragonRole = 'Cyber Assassin';
  final bebopRole = 'Ed';
  final redDragonTitle = 'Secret Vice President of Cyberwarfare';
  final bebopTitle = 'Ed';
  final categoriesList =
      [
        'Mushroom Hunting',
        'Bounty Hunting',
        'Terrorism',
        'Counterterrorism',
        'Extortion',
        'Dogsitting',
        'Cyberwarfare',
        'Chess',
        'Shōgi',
        'Travel'
      ];
  final categoriesString = categoriesList.join(',');
  final revisionString = '2080-01-01T04:20:00Z';
  final exampleVCard3_0 =
      'BEGIN:VCARD\r\n'
      'VERSION:3.0\r\n'
      'FN:$formattedName\r\n'
      'en.N;LANGUAGE=en,pt-BR:$englishNameString\r\n'
      'en.NICKNAME;LANGUAGE=en,pt-BR:$englishNicknameString\r\n'
      'jp.N;LANGUAGE=jp:$japaneseNameString\r\n'
      'jp.NICKNAME;LANGUAGE=jp:$japaneseNicknameString\r\n'
      'BDAY:$birthday\r\n'
      'SORT-STRING;LANGUAGE=en,pt-BR:$englishSortString\r\n'
      'SORT-STRING;LANGUAGE=jp:$japaneseSortString\r\n'
      'PHOTO;VALUE=uri:$photoUri\r\n'
      'LOGO;VALUE=uri:$logoUri\r\n'
      'TEL;TYPE=work:$workPhoneNumber\r\n'
      'EMAIL;TYPE=work,internet:$workEmailAddress\r\n'
      'TEL;TYPE=home:$homePhoneNumber\r\n'
      'EMAIL;TYPE=pref,internet:$prefEmailAddress\r\n'
      'orphanage.ADR;TYPE=pref,home:;;$orphanageAddressStreet;$orphanageAddressLocality;$orphanageAddressRegion;$orphanageAddressPostalCode;$orphanageAddressCountryName\r\n'
      'red-dragon.ADR;TYPE=work:;$redDragonAddressExtendedAddress;$redDragonAddressStreet;$redDragonAddressLocality;;;$redDragonAddressCountryName\r\n'
      'orphanage.GEO:$orphanageLocationLat;$orphanageLocationLng\r\n'
      'orphanage.TZ;VALUE=text:$orphanageTimeZone\r\n'
      'NOTE:$noteText\r\n'
      'red-dragon.LABEL;TYPE=work:$redDragonLabel\r\n'
      'red-dragon.ORG:$redDragonOrgString\r\n'
      'bebop.ORG:$bebopOrgString\r\n'
      'red-dragon.ROLE:$redDragonRole\r\n'
      'bebop.ROLE:$bebopRole\r\n'
      'red-dragon.TITLE:$redDragonTitle\r\n'
      'bebop.TITLE:$bebopTitle\r\n'
      'CATEGORIES:$categoriesString\r\n'
      'REV;VALUE=date-time:$revisionString\r\n'
      'END:VCARD\r\n';

  void testRadicalEdwardVCard3_0(VCard3_0 vc) {
    expect(vc, isNotNull);
    expect(vc.vCardVersion, equals(VCardVersion.v3_0));
    expect(vc.labeledFormattedNameList.length, equals(1));
    expect(vc.labeledFormattedNameList.first.value, equals(formattedName));
    expect(vc.labeledNameList.length, equals(2));
    final englishLabeledName = vc.labeledNameList[0];
    expect(englishLabeledName.group, equals('en'));
    expect(englishLabeledName.vCardParamList.length, equals(1));
    expect(englishLabeledName.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam englishLabeledNameParam =
        englishLabeledName.vCardParamList[0];
    expect(
        englishLabeledNameParam.paramName,
        equals(VCardIanaParamName.language)
    );
    expect(englishLabeledNameParam.paramValueList.length, equals(2));
    expect(
        englishLabeledNameParam.paramValueList[0],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    englishLabeledNameParamFirstParamValue =
        englishLabeledNameParam.paramValueList[0];
    expect(englishLabeledNameParamFirstParamValue.value, equals('en'));
    expect(
        englishLabeledNameParam.paramValueList[1],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    englishLabeledNameParamSecondParamValue =
        englishLabeledNameParam.paramValueList[1];
    expect(englishLabeledNameParamSecondParamValue.value, equals('pt-BR'));
    expect(englishLabeledName.value.familyNames, equals(englishFamilyNames));
    expect(englishLabeledName.value.givenNames, equals(englishGivenNames));
    expect(englishLabeledName.value.middleNames, equals(englishMiddleNames));
    expect(englishLabeledName.value.prefixes, equals(englishPrefixes));
    expect(englishLabeledName.value.suffixes, equals(englishSuffixes));
    final japaneseLabeledName = vc.labeledNameList[1];
    expect(japaneseLabeledName.group, equals('jp'));
    expect(japaneseLabeledName.vCardParamList.length, equals(1));
    expect(japaneseLabeledName.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam japaneseLabeledNameParam =
        japaneseLabeledName.vCardParamList[0];
    expect(
        japaneseLabeledNameParam.paramName,
        equals(VCardIanaParamName.language)
    );
    expect(japaneseLabeledNameParam.paramValueList.length, equals(1));
    expect(
        japaneseLabeledNameParam.paramValueList[0],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    japaneseLabeledNameParamFirstParamValue =
        japaneseLabeledNameParam.paramValueList[0];
    expect(japaneseLabeledNameParamFirstParamValue.value, equals('jp'));
    expect(vc.labeledNicknameList.length, equals(2));
    final englishLabeledNickname = vc.labeledNicknameList[0];
    expect(englishLabeledNickname.group, equals('en'));
    expect(englishLabeledNickname.vCardParamList.length, equals(1));
    expect(englishLabeledNickname.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam englishLabeledNicknameParam =
        englishLabeledName.vCardParamList[0];
    expect(
        englishLabeledNicknameParam.paramName,
        equals(VCardIanaParamName.language)
    );
    expect(englishLabeledNicknameParam.paramValueList.length, equals(2));
    expect(
        englishLabeledNicknameParam.paramValueList[0],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    englishLabeledNicknameParamFirstParamValue =
        englishLabeledNameParam.paramValueList[0];
    expect(englishLabeledNicknameParamFirstParamValue.value, equals('en'));
    expect(
        englishLabeledNicknameParam.paramValueList[1],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    englishLabeledNicknameParamSecondParamValue =
        englishLabeledNameParam.paramValueList[1];
    expect(
        englishLabeledNicknameParamSecondParamValue.value,
        equals('pt-BR')
    );
    expect(englishLabeledNickname.value, equals(englishNicknameList));
    final japaneseLabeledNickname = vc.labeledNicknameList[1];
    expect(japaneseLabeledNickname.group, equals('jp'));
    expect(japaneseLabeledNickname.vCardParamList.length, equals(1));
    expect(japaneseLabeledNickname.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam japaneseLabeledNicknameParam =
        japaneseLabeledName.vCardParamList[0];
    expect(
        japaneseLabeledNicknameParam.paramName,
        equals(VCardIanaParamName.language)
    );
    expect(japaneseLabeledNicknameParam.paramValueList.length, equals(1));
    expect(
        japaneseLabeledNicknameParam.paramValueList[0],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    japaneseLabeledNicknameParamFirstParamValue =
        japaneseLabeledNameParam.paramValueList[0];
    expect(japaneseLabeledNicknameParamFirstParamValue.value, equals('jp'));
    expect(japaneseLabeledNickname.value, equals(japaneseNicknameList));
    expect(vc.birthday, equals(birthday));
    expect(vc.labeledSortStringList.length, equals(2));
    final englishLabeledSortString = vc.labeledSortStringList[0];
    expect(englishLabeledSortString.group, isNull);
    expect(englishLabeledSortString.vCardParamList.length, equals(1));
    expect(
        englishLabeledSortString.vCardParamList[0],
        isA<IVCardIanaParam>()
    );
    final IVCardIanaParam englishLabeledSortStringParam =
        englishLabeledSortString.vCardParamList[0];
    expect(
        englishLabeledSortStringParam.paramName,
        equals(VCardIanaParamName.language)
    );
    expect(englishLabeledSortStringParam.paramValueList.length, equals(2));
    expect(
        englishLabeledSortStringParam.paramValueList[0],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    englishLabeledSortStringParamFirstParamValue =
        englishLabeledSortStringParam.paramValueList[0];
    expect(englishLabeledSortStringParamFirstParamValue.value, equals('en'));
    expect(
        englishLabeledSortStringParam.paramValueList[1],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    englishLabeledSortStringParamSecondParamValue =
        englishLabeledSortStringParam.paramValueList[1];
    expect(
        englishLabeledSortStringParamSecondParamValue.value,
        equals('pt-BR')
    );
    expect(englishLabeledSortString.value, equals(englishSortString));
    final japaneseLabeledSortString = vc.labeledSortStringList[1];
    expect(japaneseLabeledSortString.group, isNull);
    expect(japaneseLabeledSortString.vCardParamList.length, equals(1));
    expect(
        japaneseLabeledSortString.vCardParamList[0],
        isA<IVCardIanaParam>()
    );
    final IVCardIanaParam japaneseLabeledSortStringParam =
        japaneseLabeledSortString.vCardParamList[0];
    expect(
        japaneseLabeledSortStringParam.paramName,
        equals(VCardIanaParamName.language)
    );
    expect(japaneseLabeledSortStringParam.paramValueList.length, equals(1));
    expect(
        japaneseLabeledSortStringParam.paramValueList[0],
        isA<IVCardIanaUnboundedParamValue>()
    );
    final IVCardIanaUnboundedParamValue
    japaneseLabeledSortStringParamFirstParamValue =
        japaneseLabeledSortStringParam.paramValueList[0];
    expect(japaneseLabeledSortStringParamFirstParamValue.value, equals('jp'));
    expect(japaneseLabeledSortString.value, equals(japaneseSortString));
    expect(vc.labeledPhotoList.length, equals(1));
    final labeledPhoto = vc.labeledPhotoList[0];
    expect(labeledPhoto.group, isNull);
    expect(labeledPhoto.vCardParamList.length, equals(1));
    expect(labeledPhoto.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledPhotoParam = labeledPhoto.vCardParamList[0];
    expect(labeledPhotoParam.paramName, equals(VCardIanaParamName.value));
    expect(labeledPhotoParam.paramValueList.length, equals(1));
    expect(
        labeledPhotoParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue labeledPhotoParamFirstParamValue =
        labeledPhotoParam.paramValueList[0];
    expect(
        labeledPhotoParamFirstParamValue.value,
        equals(VCardIanaParamValue.uri)
    );
    expect(labeledPhoto.value, equals(photoUri));
    expect(vc.labeledLogoList.length, equals(1));
    final labeledLogo = vc.labeledLogoList[0];
    expect(labeledLogo.group, isNull);
    expect(labeledLogo.vCardParamList.length, equals(1));
    expect(labeledLogo.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledLogoParam = labeledLogo.vCardParamList[0];
    expect(labeledLogoParam.paramName, equals(VCardIanaParamName.value));
    expect(labeledLogoParam.paramValueList.length, equals(1));
    expect(
        labeledLogoParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue labeledLogoParamFirstParamValue =
        labeledLogoParam.paramValueList[0];
    expect(
        labeledLogoParamFirstParamValue.value,
        equals(VCardIanaParamValue.uri)
    );
    expect(labeledLogo.value, equals(logoUri));
    expect(vc.labeledPhoneNumberList.length, equals(2));
    final labeledWorkPhoneNumber = vc.labeledPhoneNumberList[0];
    expect(labeledWorkPhoneNumber.group, isNull);
    expect(labeledWorkPhoneNumber.vCardParamList.length, equals(1));
    expect(labeledWorkPhoneNumber.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledWorkPhoneNumberParam =
        labeledWorkPhoneNumber.vCardParamList[0];
    expect(
        labeledWorkPhoneNumberParam.paramName,
        equals(VCardIanaParamName.type)
    );
    expect(labeledWorkPhoneNumberParam.paramValueList.length, equals(1));
    expect(
        labeledWorkPhoneNumberParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledWorkPhoneNumberParamFirstParamValue =
        labeledWorkPhoneNumberParam.paramValueList[0];
    expect(
        labeledWorkPhoneNumberParamFirstParamValue.value,
        equals(VCardIanaParamValue.work)
    );
    expect(labeledWorkPhoneNumber.value, equals(workPhoneNumber));
    final labeledHomePhoneNumber = vc.labeledPhoneNumberList[1];
    expect(labeledHomePhoneNumber.group, isNull);
    expect(labeledHomePhoneNumber.vCardParamList.length, equals(1));
    expect(labeledHomePhoneNumber.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledHomePhoneNumberParam =
        labeledHomePhoneNumber.vCardParamList[0];
    expect(
        labeledHomePhoneNumberParam.paramName,
        equals(VCardIanaParamName.type)
    );
    expect(labeledHomePhoneNumberParam.paramValueList.length, equals(1));
    expect(
        labeledHomePhoneNumberParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledHomePhoneNumberParamFirstParamValue =
        labeledHomePhoneNumberParam.paramValueList[0];
    expect(
        labeledHomePhoneNumberParamFirstParamValue.value,
        equals(VCardIanaParamValue.home)
    );
    expect(labeledHomePhoneNumber.value, equals(homePhoneNumber));
    expect(vc.labeledEmailAddressList.length, equals(2));
    final labeledWorkEmailAddress = vc.labeledEmailAddressList[0];
    expect(labeledWorkEmailAddress.group, isNull);
    expect(labeledWorkEmailAddress.vCardParamList.length, equals(1));
    expect(labeledWorkEmailAddress.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledWorkEmailAddressParam =
        labeledWorkEmailAddress.vCardParamList[0];
    expect(
        labeledWorkEmailAddressParam.paramName,
        equals(VCardIanaParamName.type)
    );
    expect(labeledWorkEmailAddressParam.paramValueList.length, equals(2));
    expect(
        labeledWorkEmailAddressParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledWorkEmailAddressParamFirstParamValue =
        labeledWorkEmailAddressParam.paramValueList[0];
    expect(
        labeledWorkEmailAddressParamFirstParamValue.value,
        equals(VCardIanaParamValue.work)
    );
    expect(
        labeledWorkEmailAddressParam.paramValueList[1],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledWorkEmailAddressParamSecondParamValue =
        labeledWorkEmailAddressParam.paramValueList[1];
    expect(
        labeledWorkEmailAddressParamSecondParamValue.value,
        equals(VCardIanaParamValue.internet)
    );
    expect(labeledWorkEmailAddress.value, equals(workEmailAddress));
    final labeledPrefEmailAddress = vc.labeledEmailAddressList[1];
    expect(labeledPrefEmailAddress.group, isNull);
    expect(labeledPrefEmailAddress.vCardParamList.length, equals(1));
    expect(labeledPrefEmailAddress.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledPrefEmailAddressParam =
        labeledPrefEmailAddress.vCardParamList[0];
    expect(
        labeledPrefEmailAddressParam.paramName,
        equals(VCardIanaParamName.type)
    );
    expect(labeledPrefEmailAddressParam.paramValueList.length, equals(2));
    expect(
        labeledPrefEmailAddressParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledPrefEmailAddressParamFirstParamValue =
        labeledPrefEmailAddressParam.paramValueList[0];
    expect(
        labeledPrefEmailAddressParamFirstParamValue.value,
        equals(VCardIanaParamValue.pref)
    );
    expect(
        labeledPrefEmailAddressParam.paramValueList[1],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledPrefEmailAddressParamSecondParamValue =
        labeledPrefEmailAddressParam.paramValueList[1];
    expect(
        labeledPrefEmailAddressParamSecondParamValue.value,
        equals(VCardIanaParamValue.internet)
    );
    expect(labeledPrefEmailAddress.value, equals(prefEmailAddress));
    expect(vc.labeledAddressList.length, equals(2));
    final labeledOrphanageAddress = vc.labeledAddressList[0];
    expect(labeledOrphanageAddress.group, equals('orphanage'));
    expect(labeledOrphanageAddress.vCardParamList.length, equals(1));
    expect(labeledOrphanageAddress.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledOrphanageAddressParam =
        labeledOrphanageAddress.vCardParamList[0];
    expect(
        labeledOrphanageAddressParam.paramName,
        equals(VCardIanaParamName.type)
    );
    expect(labeledOrphanageAddressParam.paramValueList.length, equals(2));
    expect(
        labeledOrphanageAddressParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledOrphanageAddressParamFirstParamValue =
        labeledOrphanageAddressParam.paramValueList[0];
    expect(
        labeledOrphanageAddressParamFirstParamValue.value,
        equals(VCardIanaParamValue.pref)
    );
    expect(
        labeledOrphanageAddressParam.paramValueList[1],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledOrphanageAddressParamSecondParamValue =
        labeledOrphanageAddressParam.paramValueList[1];
    expect(
        labeledOrphanageAddressParamSecondParamValue.value,
        equals(VCardIanaParamValue.home)
    );
    expect(labeledOrphanageAddress.value.poBox, isNull);
    expect(labeledOrphanageAddress.value.extendedAddress, isNull);
    expect(
        labeledOrphanageAddress.value.street,
        equals(orphanageAddressStreet)
    );
    expect(
        labeledOrphanageAddress.value.locality,
        equals(orphanageAddressLocality)
    );
    expect(
        labeledOrphanageAddress.value.region,
        equals(orphanageAddressRegion)
    );
    expect(
        labeledOrphanageAddress.value.postalCode,
        equals(orphanageAddressPostalCode)
    );
    expect(
        labeledOrphanageAddress.value.countryName,
        equals(orphanageAddressCountryName)
    );
    final labeledRedDragonAddress = vc.labeledAddressList[1];
    expect(labeledRedDragonAddress.group, equals('red-dragon'));
    expect(labeledRedDragonAddress.vCardParamList.length, equals(1));
    expect(labeledRedDragonAddress.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledRedDragonAddressParam =
        labeledRedDragonAddress.vCardParamList[0];
    expect(
        labeledRedDragonAddressParam.paramName,
        equals(VCardIanaParamName.type)
    );
    expect(labeledRedDragonAddressParam.paramValueList.length, equals(1));
    expect(
        labeledRedDragonAddressParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledRedDragonAddressParamFirstParamValue =
        labeledRedDragonAddressParam.paramValueList[0];
    expect(
        labeledRedDragonAddressParamFirstParamValue.value,
        equals(VCardIanaParamValue.work)
    );
    expect(labeledRedDragonAddress.value.poBox, isNull);
    expect(
        labeledRedDragonAddress.value.extendedAddress,
        equals(redDragonAddressExtendedAddress)
    );
    expect(
        labeledRedDragonAddress.value.street,
        equals(redDragonAddressStreet)
    );
    expect(
        labeledRedDragonAddress.value.locality,
        equals(redDragonAddressLocality)
    );
    expect(labeledRedDragonAddress.value.region, isNull);
    expect(labeledRedDragonAddress.value.postalCode, isNull);
    expect(
        labeledRedDragonAddress.value.countryName,
        equals(redDragonAddressCountryName)
    );
    expect(vc.labeledGeographicLocationList.length, equals(1));
    final labeledGeographicLocation = vc.labeledGeographicLocationList[0];
    expect(labeledGeographicLocation.group, equals('orphanage'));
    expect(labeledGeographicLocation.vCardParamList.length, equals(0));
    expect(
        labeledGeographicLocation.value.latitude,
        equals(orphanageLocationLat)
    );
    expect(
        labeledGeographicLocation.value.longitude,
        equals(orphanageLocationLng)
    );
    expect(vc.labeledTimeZoneList.length, equals(1));
    final labeledTimeZone = vc.labeledTimeZoneList[0];
    expect(labeledTimeZone.group, equals('orphanage'));
    expect(labeledTimeZone.vCardParamList.length, equals(1));
    expect(labeledTimeZone.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledTimeZoneParam =
        labeledTimeZone.vCardParamList[0];
    expect(labeledTimeZoneParam.paramName, equals(VCardIanaParamName.value));
    expect(labeledTimeZoneParam.paramValueList.length, equals(1));
    expect(
        labeledTimeZoneParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue labeledTimeZoneParamFirstValue =
        labeledTimeZoneParam.paramValueList[0];
    expect(
        labeledTimeZoneParamFirstValue.value,
        equals(VCardIanaParamValue.text)
    );
    expect(labeledTimeZone.value, equals(orphanageTimeZone));
    expect(vc.labeledNoteList.length, equals(1));
    final labeledNote = vc.labeledNoteList[0];
    expect(labeledNote.group, isNull);
    expect(labeledNote.vCardParamList.length, equals(0));
    expect(labeledNote.value, equals(noteText));
    expect(vc.labeledLabelList.length, equals(1));
    final labeledLabel = vc.labeledLabelList[0];
    expect(labeledLabel.group, equals('red-dragon'));
    expect(labeledLabel.vCardParamList.length, equals(1));
    expect(labeledLabel.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledLabelParam = labeledLabel.vCardParamList[0];
    expect(labeledLabelParam.paramName, equals(VCardIanaParamName.type));
    expect(labeledLabelParam.paramValueList.length, equals(1));
    expect(
        labeledLabelParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue labeledLabelParamFirstParamValue =
        labeledLabelParam.paramValueList[0];
    expect(
        labeledLabelParamFirstParamValue.value,
        equals(VCardIanaParamValue.work)
    );
    expect(labeledLabel.value, equals(redDragonLabel));
    expect(vc.labeledOrganizationList.length, equals(2));
    final labeledRedDragonOrganization = vc.labeledOrganizationList[0];
    expect(labeledRedDragonOrganization.group, equals('red-dragon'));
    expect(labeledRedDragonOrganization.vCardParamList.length, equals(0));
    expect(labeledRedDragonOrganization.value.name, equals(redDragonOrgName));
    expect(
        labeledRedDragonOrganization.value.organizationUnits,
        equals(redDragonOrgOrgUnits)
    );
    final labeledBebopOrganization = vc.labeledOrganizationList[1];
    expect(labeledBebopOrganization.group, equals('bebop'));
    expect(labeledBebopOrganization.vCardParamList.length, equals(0));
    expect(labeledBebopOrganization.value.name, equals(bebopOrgString));
    expect(labeledBebopOrganization.value.organizationUnits, equals([]));
    expect(vc.labeledRoleList.length, equals(2));
    final labeledRedDragonRole = vc.labeledRoleList[0];
    expect(labeledRedDragonRole.group, equals('red-dragon'));
    expect(labeledRedDragonRole.vCardParamList.length, equals(0));
    expect(labeledRedDragonRole.value, equals(redDragonRole));
    final labeledBebopRole = vc.labeledRoleList[1];
    expect(labeledBebopRole.group, equals('bebop'));
    expect(labeledBebopRole.vCardParamList.length, equals(0));
    expect(labeledBebopRole.value, equals(bebopRole));
    expect(vc.labeledTitleList.length, equals(2));
    final labeledRedDragonTitle = vc.labeledTitleList[0];
    expect(labeledRedDragonTitle.group, equals('red-dragon'));
    expect(labeledRedDragonTitle.vCardParamList.length, equals(0));
    expect(labeledRedDragonTitle.value, equals(redDragonTitle));
    final labeledBebopTitle = vc.labeledTitleList[1];
    expect(labeledBebopTitle.group, equals('bebop'));
    expect(labeledBebopTitle.vCardParamList.length, equals(0));
    expect(labeledBebopTitle.value, equals(bebopTitle));
    expect(vc.labeledCategoriesList.length, equals(1));
    final labeledCategories = vc.labeledCategoriesList[0];
    expect(labeledCategories.group, isNull);
    expect(labeledCategories.vCardParamList.length, equals(0));
    expect(labeledCategories.value, equals(categoriesList));
    expect(vc.labeledRevisionTime, isNotNull);
    expect(vc.labeledRevisionTime.group, isNull);
    expect(vc.labeledRevisionTime.vCardParamList.length, equals(1));
    expect(vc.labeledRevisionTime.vCardParamList[0], isA<IVCardIanaParam>());
    final IVCardIanaParam labeledRevisionTimeParam =
        vc.labeledRevisionTime.vCardParamList[0];
    expect(
        labeledRevisionTimeParam.paramName,
        equals(VCardIanaParamName.value)
    );
    expect(labeledRevisionTimeParam.paramValueList.length, equals(1));
    expect(
        labeledRevisionTimeParam.paramValueList[0],
        isA<IVCardIanaBoundedParamValue>()
    );
    final IVCardIanaBoundedParamValue
    labeledRevisionTimeParamFirstParamValue =
        labeledRevisionTimeParam.paramValueList[0];
    expect(
        labeledRevisionTimeParamFirstParamValue.value,
        equals(VCardIanaParamValue.dateTime)
    );
    expect(vc.labeledRevisionTime.value, equals(revisionString));
  }

  group('vCard tests', () {
    test('vCard test', () {
      final vCard3_0 = VCard3_0.deserialize(exampleVCard3_0);
      expect(vCard3_0.prodId, isNull);
      testRadicalEdwardVCard3_0(vCard3_0);
      final serializedVCard3_0 = vCard3_0.serialize();
      final vv = VCard3_0.deserialize(serializedVCard3_0);
      expect(vv.prodId, equals(VCard.defaultProdId));
      testRadicalEdwardVCard3_0(vv);
      final ss = vv.serialize();
      expect(serializedVCard3_0, equals(ss));
    });
  });
}
