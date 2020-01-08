import '../formats/v_card/v_card_enums.dart';

class _VCardVersion {
  static const _vCardVersion2_1Key = '2.1';
  static const _vCardVersion3_0Key = '3.0';
  static const _vCardVersion4_0Key = '4.0';
  static const _vCardVersion5_0Key = '5.0';
}

class _VCardIanaPropertyKey {
  static const _adrKey = 'ADR';
  static const _agentKey = 'AGENT';
  static const _anniversaryKey = 'ANNIVERSARY';
  static const _bdayKey = 'BDAY';
  static const _beginKey = 'BEGIN';
  static const _birthplaceKey = 'BIRTHPLACE';
  static const _caladruriKey = 'CALADRURI';
  static const _caluriKey = 'CALURI';
  static const _categoriesKey = 'CATEGORIES';
  static const _classKey = 'CLASS';
  static const _clientpidmapKey = 'CLIENTPIDMAP';
  static const _deathdateKey = 'DEATHDATE';
  static const _deathplaceKey = 'DEATHPLACE';
  static const _emailKey = 'EMAIL';
  static const _endKey = 'END';
  static const _expertiseKey = 'EXPERTISE';
  static const _fburlKey = 'FBURL';
  static const _fnKey = 'FN';
  static const _genderKey = 'GENDER';
  static const _geoKey = 'GEO';
  static const _hobbyKey = 'HOBBY';
  static const _imppKey = 'IMPP';
  static const _interestKey = 'INTEREST';
  static const _keyKey = 'KEY';
  static const _kindKey = 'KIND';
  static const _labelKey = 'LABEL';
  static const _langKey = 'LANG';
  static const _logoKey = 'LOGO';
  static const _mailerKey = 'MAILER';
  static const _memberKey = 'MEMBER';
  static const _nKey = 'N';
  static const _nameKey = 'NAME';
  static const _nicknameKey = 'NICKNAME';
  static const _noteKey = 'NOTE';
  static const _orgKey = 'ORG';
  static const _orgDirectoryKey = 'ORG-DIRECTORY';
  static const _photoKey = 'PHOTO';
  static const _prodidKey = 'PRODID';
  static const _profileKey = 'PROFILE';
  static const _relatedKey = 'RELATED';
  static const _revKey = 'REV';
  static const _roleKey = 'ROLE';
  static const _sortStringKey = 'SORT-STRING';
  static const _soundKey = 'SOUND';
  static const _sourceKey = 'SOURCE';
  static const _telKey = 'TEL';
  static const _titleKey = 'TITLE';
  static const _tzKey = 'TZ';
  static const _uidKey = 'UID';
  static const _urlKey = 'URL';
  static const _versionKey = 'VERSION';
  static const _xmlKey = 'XML';

  static const _vcardValue = 'VCARD';

}

class _VCardIanaParamName {
  static const _languageKey = 'LANGUAGE';
  static const _valueKey = 'VALUE';
  static const _prefKey = 'PREF';
  static const _altidKey = 'ALTID';
  static const _pidKey = 'PID';
  static const _typeKey = 'TYPE';
  static const _mediatypeKey = 'MEDIATYPE';
  static const _calscaleKey = 'CALSCALE';
  static const _sortAsKey = 'SORT-AS';
  static const _geoKey = 'GEO';
  static const _tzKey = 'TZ';
  static const _indexKey = 'INDEX';
  static const _levelKey = 'LEVEL';
  static const _groupKey = 'GROUP';
  static const _ccKey = 'CC';
  static const _encodingKey = 'ENCODING';
}

class _VCardIanaParamValue {
  static const _workKey = 'work';
  static const _homeKey = 'home';
  static const _textKey = 'text';
  static const _voiceKey = 'voice';
  static const _faxKey = 'fax';
  static const _cellKey = 'cell';
  static const _videoKey = 'video';
  static const _pagerKey = 'pager';
  static const _textphoneKey = 'textphone';
  static const _mainNumberKey = 'main-number';
  static const _gregorianKey = 'gregorian';
  static const _contactKey = 'contact';
  static const _acquaintanceKey = 'acquaintance';
  static const _friendKey = 'friend';
  static const _metKey = 'met';
  static const _coWorkerKey = 'co-worker';
  static const _colleagueKey = 'colleague';
  static const _coResidentKey = 'co-resident';
  static const _neighborKey = 'neighbor';
  static const _childKey = 'child';
  static const _parentKey = 'parent';
  static const _siblingKey = 'sibling';
  static const _spouseKey = 'spouse';
  static const _kinKey = 'kin';
  static const _museKey = 'muse';
  static const _crushKey = 'crush';
  static const _dateKey = 'date';
  static const _sweetheartKey = 'sweetheart';
  static const _meKey = 'me';
  static const _agentKey = 'agent';
  static const _emergencyKey = 'emergency';
  static const _beginnerKey = 'beginner';
  static const _averageKey = 'average';
  static const _expertKey = 'expert';
  static const _highKey = 'high';
  static const _mediumKey = 'medium';
  static const _lowKey = 'low';

  static const _bKey = 'b';
  static const _bbsKey = 'bbs';
  static const _binaryKey = 'binary';
  static const _carKey = 'car';
  static const _dateTimeKey = 'date-time';
  static const _domKey = 'dom';
  static const _internetKey = 'internet';
  static const _intlKey = 'intl';
  static const _isdnKey = 'isdn';
  static const _modemKey = 'modem';
  static const _msgKey = 'msg';
  static const _parcelKey = 'parcel';
  static const _pcsKey = 'pcs';
  static const _postalKey = 'postal';
  static const _prefKey = 'pref';
  static const _uriKey = 'uri';
  static const _x400Key = 'x400';

  static const _base64Key = 'base64';
  static const _quotedPrintableKey = 'quoted-printable';
  static const _8bitKey = '8bit';
}


class VCardEnumUtilities {
  static const beginVCard = '${_VCardIanaPropertyKey._beginKey}:${_VCardIanaPropertyKey._vcardValue}';
  static const endVCard = '${_VCardIanaPropertyKey._endKey}:${_VCardIanaPropertyKey._vcardValue}';

  static String stringForVCardVersion(VCardVersion vCardVersion) {
    switch (vCardVersion) {
      case VCardVersion.v2_1: return _VCardVersion._vCardVersion2_1Key;
      case VCardVersion.v3_0: return _VCardVersion._vCardVersion3_0Key;
      case VCardVersion.v4_0: return _VCardVersion._vCardVersion4_0Key;
      case VCardVersion.v5_0: return _VCardVersion._vCardVersion5_0Key;
      default: return null;
    }
  }

  static VCardVersion vCardVersionForString(String s) {
    switch (s) {
      case _VCardVersion._vCardVersion2_1Key: return VCardVersion.v2_1;
      case _VCardVersion._vCardVersion3_0Key: return VCardVersion.v3_0;
      case _VCardVersion._vCardVersion4_0Key: return VCardVersion.v4_0;
      case _VCardVersion._vCardVersion5_0Key: return VCardVersion.v5_0;
      default: return null;
    }
  }

  static String stringForVCardIanaPropertyKey(VCardIanaPropertyKey vCardIanaPropertyKey) {
    switch (vCardIanaPropertyKey) {
      case VCardIanaPropertyKey.adr: return _VCardIanaPropertyKey._adrKey;
      case VCardIanaPropertyKey.agent: return _VCardIanaPropertyKey._agentKey;
      case VCardIanaPropertyKey.anniversary: return _VCardIanaPropertyKey._anniversaryKey;
      case VCardIanaPropertyKey.bday: return _VCardIanaPropertyKey._bdayKey;
      case VCardIanaPropertyKey.begin: return _VCardIanaPropertyKey._beginKey;
      case VCardIanaPropertyKey.birthplace: return _VCardIanaPropertyKey._birthplaceKey;
      case VCardIanaPropertyKey.caladruri: return _VCardIanaPropertyKey._caladruriKey;
      case VCardIanaPropertyKey.caluri: return _VCardIanaPropertyKey._caluriKey;
      case VCardIanaPropertyKey.categories: return _VCardIanaPropertyKey._categoriesKey;
      case VCardIanaPropertyKey.class_: return _VCardIanaPropertyKey._classKey;
      case VCardIanaPropertyKey.clientpidmap: return _VCardIanaPropertyKey._clientpidmapKey;
      case VCardIanaPropertyKey.deathdate: return _VCardIanaPropertyKey._deathdateKey;
      case VCardIanaPropertyKey.deathplace: return _VCardIanaPropertyKey._deathplaceKey;
      case VCardIanaPropertyKey.email: return _VCardIanaPropertyKey._emailKey;
      case VCardIanaPropertyKey.end: return _VCardIanaPropertyKey._endKey;
      case VCardIanaPropertyKey.expertise: return _VCardIanaPropertyKey._expertiseKey;
      case VCardIanaPropertyKey.fburl: return _VCardIanaPropertyKey._fburlKey;
      case VCardIanaPropertyKey.fn: return _VCardIanaPropertyKey._fnKey;
      case VCardIanaPropertyKey.gender: return _VCardIanaPropertyKey._genderKey;
      case VCardIanaPropertyKey.geo: return _VCardIanaPropertyKey._geoKey;
      case VCardIanaPropertyKey.hobby: return _VCardIanaPropertyKey._hobbyKey;
      case VCardIanaPropertyKey.impp: return _VCardIanaPropertyKey._imppKey;
      case VCardIanaPropertyKey.interest: return _VCardIanaPropertyKey._interestKey;
      case VCardIanaPropertyKey.key: return _VCardIanaPropertyKey._keyKey;
      case VCardIanaPropertyKey.kind: return _VCardIanaPropertyKey._kindKey;
      case VCardIanaPropertyKey.label: return _VCardIanaPropertyKey._labelKey;
      case VCardIanaPropertyKey.lang: return _VCardIanaPropertyKey._langKey;
      case VCardIanaPropertyKey.logo: return _VCardIanaPropertyKey._logoKey;
      case VCardIanaPropertyKey.mailer: return _VCardIanaPropertyKey._mailerKey;
      case VCardIanaPropertyKey.member: return _VCardIanaPropertyKey._memberKey;
      case VCardIanaPropertyKey.n: return _VCardIanaPropertyKey._nKey;
      case VCardIanaPropertyKey.name: return _VCardIanaPropertyKey._nameKey;
      case VCardIanaPropertyKey.nickname: return _VCardIanaPropertyKey._nicknameKey;
      case VCardIanaPropertyKey.note: return _VCardIanaPropertyKey._noteKey;
      case VCardIanaPropertyKey.org: return _VCardIanaPropertyKey._orgKey;
      case VCardIanaPropertyKey.orgDirectory: return _VCardIanaPropertyKey._orgDirectoryKey;
      case VCardIanaPropertyKey.photo: return _VCardIanaPropertyKey._photoKey;
      case VCardIanaPropertyKey.prodid: return _VCardIanaPropertyKey._prodidKey;
      case VCardIanaPropertyKey.profile: return _VCardIanaPropertyKey._profileKey;
      case VCardIanaPropertyKey.related: return _VCardIanaPropertyKey._relatedKey;
      case VCardIanaPropertyKey.rev: return _VCardIanaPropertyKey._revKey;
      case VCardIanaPropertyKey.role: return _VCardIanaPropertyKey._roleKey;
      case VCardIanaPropertyKey.sortString: return _VCardIanaPropertyKey._sortStringKey;
      case VCardIanaPropertyKey.sound: return _VCardIanaPropertyKey._soundKey;
      case VCardIanaPropertyKey.source: return _VCardIanaPropertyKey._sourceKey;
      case VCardIanaPropertyKey.tel: return _VCardIanaPropertyKey._telKey;
      case VCardIanaPropertyKey.title: return _VCardIanaPropertyKey._titleKey;
      case VCardIanaPropertyKey.tz: return _VCardIanaPropertyKey._tzKey;
      case VCardIanaPropertyKey.uid: return _VCardIanaPropertyKey._uidKey;
      case VCardIanaPropertyKey.url: return _VCardIanaPropertyKey._urlKey;
      case VCardIanaPropertyKey.version: return _VCardIanaPropertyKey._versionKey;
      case VCardIanaPropertyKey.xml: return _VCardIanaPropertyKey._xmlKey;
      default: return null;
    }
  }

  static VCardIanaPropertyKey vCardIanaPropertyKeyForString(String s) {
    final sUpper = s.toUpperCase();
    switch (sUpper) {
      case _VCardIanaPropertyKey._adrKey: return VCardIanaPropertyKey.adr;
      case _VCardIanaPropertyKey._agentKey: return VCardIanaPropertyKey.agent;
      case _VCardIanaPropertyKey._anniversaryKey: return VCardIanaPropertyKey.anniversary;
      case _VCardIanaPropertyKey._bdayKey: return VCardIanaPropertyKey.bday;
      case _VCardIanaPropertyKey._beginKey: return VCardIanaPropertyKey.begin;
      case _VCardIanaPropertyKey._birthplaceKey: return VCardIanaPropertyKey.birthplace;
      case _VCardIanaPropertyKey._caladruriKey: return VCardIanaPropertyKey.caladruri;
      case _VCardIanaPropertyKey._caluriKey: return VCardIanaPropertyKey.caluri;
      case _VCardIanaPropertyKey._categoriesKey: return VCardIanaPropertyKey.categories;
      case _VCardIanaPropertyKey._classKey: return VCardIanaPropertyKey.class_;
      case _VCardIanaPropertyKey._clientpidmapKey: return VCardIanaPropertyKey.clientpidmap;
      case _VCardIanaPropertyKey._deathdateKey: return VCardIanaPropertyKey.deathdate;
      case _VCardIanaPropertyKey._deathplaceKey: return VCardIanaPropertyKey.deathplace;
      case _VCardIanaPropertyKey._emailKey: return VCardIanaPropertyKey.email;
      case _VCardIanaPropertyKey._endKey: return VCardIanaPropertyKey.end;
      case _VCardIanaPropertyKey._expertiseKey: return VCardIanaPropertyKey.expertise;
      case _VCardIanaPropertyKey._fburlKey: return VCardIanaPropertyKey.fburl;
      case _VCardIanaPropertyKey._fnKey: return VCardIanaPropertyKey.fn;
      case _VCardIanaPropertyKey._genderKey: return VCardIanaPropertyKey.gender;
      case _VCardIanaPropertyKey._geoKey: return VCardIanaPropertyKey.geo;
      case _VCardIanaPropertyKey._hobbyKey: return VCardIanaPropertyKey.hobby;
      case _VCardIanaPropertyKey._imppKey: return VCardIanaPropertyKey.impp;
      case _VCardIanaPropertyKey._interestKey: return VCardIanaPropertyKey.interest;
      case _VCardIanaPropertyKey._keyKey: return VCardIanaPropertyKey.key;
      case _VCardIanaPropertyKey._kindKey: return VCardIanaPropertyKey.kind;
      case _VCardIanaPropertyKey._labelKey: return VCardIanaPropertyKey.label;
      case _VCardIanaPropertyKey._langKey: return VCardIanaPropertyKey.lang;
      case _VCardIanaPropertyKey._logoKey: return VCardIanaPropertyKey.logo;
      case _VCardIanaPropertyKey._mailerKey: return VCardIanaPropertyKey.mailer;
      case _VCardIanaPropertyKey._memberKey: return VCardIanaPropertyKey.member;
      case _VCardIanaPropertyKey._nKey: return VCardIanaPropertyKey.n;
      case _VCardIanaPropertyKey._nameKey: return VCardIanaPropertyKey.name;
      case _VCardIanaPropertyKey._nicknameKey: return VCardIanaPropertyKey.nickname;
      case _VCardIanaPropertyKey._noteKey: return VCardIanaPropertyKey.note;
      case _VCardIanaPropertyKey._orgKey: return VCardIanaPropertyKey.org;
      case _VCardIanaPropertyKey._orgDirectoryKey: return VCardIanaPropertyKey.orgDirectory;
      case _VCardIanaPropertyKey._photoKey: return VCardIanaPropertyKey.photo;
      case _VCardIanaPropertyKey._prodidKey: return VCardIanaPropertyKey.prodid;
      case _VCardIanaPropertyKey._profileKey: return VCardIanaPropertyKey.profile;
      case _VCardIanaPropertyKey._relatedKey: return VCardIanaPropertyKey.related;
      case _VCardIanaPropertyKey._revKey: return VCardIanaPropertyKey.rev;
      case _VCardIanaPropertyKey._roleKey: return VCardIanaPropertyKey.role;
      case _VCardIanaPropertyKey._sortStringKey: return VCardIanaPropertyKey.sortString;
      case _VCardIanaPropertyKey._soundKey: return VCardIanaPropertyKey.sound;
      case _VCardIanaPropertyKey._sourceKey: return VCardIanaPropertyKey.source;
      case _VCardIanaPropertyKey._telKey: return VCardIanaPropertyKey.tel;
      case _VCardIanaPropertyKey._titleKey: return VCardIanaPropertyKey.title;
      case _VCardIanaPropertyKey._tzKey: return VCardIanaPropertyKey.tz;
      case _VCardIanaPropertyKey._uidKey: return VCardIanaPropertyKey.uid;
      case _VCardIanaPropertyKey._urlKey: return VCardIanaPropertyKey.url;
      case _VCardIanaPropertyKey._versionKey: return VCardIanaPropertyKey.version;
      case _VCardIanaPropertyKey._xmlKey: return VCardIanaPropertyKey.xml;
      default: return null;
    }
  }

  static String stringForVCardIanaParamName(VCardIanaParamName vCardIanaParamName) {
    switch (vCardIanaParamName) {
      case VCardIanaParamName.language: return _VCardIanaParamName._languageKey;
      case VCardIanaParamName.value: return _VCardIanaParamName._valueKey;
      case VCardIanaParamName.pref: return _VCardIanaParamName._prefKey;
      case VCardIanaParamName.altid: return _VCardIanaParamName._altidKey;
      case VCardIanaParamName.pid: return _VCardIanaParamName._pidKey;
      case VCardIanaParamName.type: return _VCardIanaParamName._typeKey;
      case VCardIanaParamName.mediatype: return _VCardIanaParamName._mediatypeKey;
      case VCardIanaParamName.calscale: return _VCardIanaParamName._calscaleKey;
      case VCardIanaParamName.sortAs: return _VCardIanaParamName._sortAsKey;
      case VCardIanaParamName.geo: return _VCardIanaParamName._geoKey;
      case VCardIanaParamName.tz: return _VCardIanaParamName._tzKey;
      case VCardIanaParamName.index_: return _VCardIanaParamName._indexKey;
      case VCardIanaParamName.level: return _VCardIanaParamName._levelKey;
      case VCardIanaParamName.group: return _VCardIanaParamName._groupKey;
      case VCardIanaParamName.cc: return _VCardIanaParamName._ccKey;
      case VCardIanaParamName.encoding: return _VCardIanaParamName._encodingKey;
      default: return null;
    }
  }

  static VCardIanaParamName vCardIanaParamNameForString(String s) {
    final sUpper = s.toUpperCase();
    switch (sUpper) {
      case _VCardIanaParamName._languageKey: return VCardIanaParamName.language;
      case _VCardIanaParamName._valueKey: return VCardIanaParamName.value;
      case _VCardIanaParamName._prefKey: return VCardIanaParamName.pref;
      case _VCardIanaParamName._altidKey: return VCardIanaParamName.altid;
      case _VCardIanaParamName._pidKey: return VCardIanaParamName.pid;
      case _VCardIanaParamName._typeKey: return VCardIanaParamName.type;
      case _VCardIanaParamName._mediatypeKey: return VCardIanaParamName.mediatype;
      case _VCardIanaParamName._calscaleKey: return VCardIanaParamName.calscale;
      case _VCardIanaParamName._sortAsKey: return VCardIanaParamName.sortAs;
      case _VCardIanaParamName._geoKey: return VCardIanaParamName.geo;
      case _VCardIanaParamName._tzKey: return VCardIanaParamName.tz;
      case _VCardIanaParamName._indexKey: return VCardIanaParamName.index_;
      case _VCardIanaParamName._levelKey: return VCardIanaParamName.level;
      case _VCardIanaParamName._groupKey: return VCardIanaParamName.group;
      case _VCardIanaParamName._ccKey: return VCardIanaParamName.cc;
      case _VCardIanaParamName._encodingKey: return VCardIanaParamName.encoding;
      default: return null;
    }
  }

  static String stringForVCardIanaParamValue(VCardIanaParamValue vCardIanaParamValue) {
    switch (vCardIanaParamValue) {
      case VCardIanaParamValue.work: return _VCardIanaParamValue._workKey;
      case VCardIanaParamValue.home: return _VCardIanaParamValue._homeKey;
      case VCardIanaParamValue.text: return _VCardIanaParamValue._textKey;
      case VCardIanaParamValue.voice: return _VCardIanaParamValue._voiceKey;
      case VCardIanaParamValue.fax: return _VCardIanaParamValue._faxKey;
      case VCardIanaParamValue.cell: return _VCardIanaParamValue._cellKey;
      case VCardIanaParamValue.video: return _VCardIanaParamValue._videoKey;
      case VCardIanaParamValue.pager: return _VCardIanaParamValue._pagerKey;
      case VCardIanaParamValue.textphone: return _VCardIanaParamValue._textphoneKey;
      case VCardIanaParamValue.mainNumber: return _VCardIanaParamValue._mainNumberKey;
      case VCardIanaParamValue.gregorian: return _VCardIanaParamValue._gregorianKey;
      case VCardIanaParamValue.contact: return _VCardIanaParamValue._contactKey;
      case VCardIanaParamValue.acquaintance: return _VCardIanaParamValue._acquaintanceKey;
      case VCardIanaParamValue.friend: return _VCardIanaParamValue._friendKey;
      case VCardIanaParamValue.met: return _VCardIanaParamValue._metKey;
      case VCardIanaParamValue.coWorker: return _VCardIanaParamValue._coWorkerKey;
      case VCardIanaParamValue.colleague: return _VCardIanaParamValue._colleagueKey;
      case VCardIanaParamValue.coResident: return _VCardIanaParamValue._coResidentKey;
      case VCardIanaParamValue.neighbor: return _VCardIanaParamValue._neighborKey;
      case VCardIanaParamValue.child: return _VCardIanaParamValue._childKey;
      case VCardIanaParamValue.parent: return _VCardIanaParamValue._parentKey;
      case VCardIanaParamValue.sibling: return _VCardIanaParamValue._siblingKey;
      case VCardIanaParamValue.spouse: return _VCardIanaParamValue._spouseKey;
      case VCardIanaParamValue.kin: return _VCardIanaParamValue._kinKey;
      case VCardIanaParamValue.muse: return _VCardIanaParamValue._museKey;
      case VCardIanaParamValue.crush: return _VCardIanaParamValue._crushKey;
      case VCardIanaParamValue.date: return _VCardIanaParamValue._dateKey;
      case VCardIanaParamValue.sweetheart: return _VCardIanaParamValue._sweetheartKey;
      case VCardIanaParamValue.me: return _VCardIanaParamValue._meKey;
      case VCardIanaParamValue.agent: return _VCardIanaParamValue._agentKey;
      case VCardIanaParamValue.emergency: return _VCardIanaParamValue._emergencyKey;
      case VCardIanaParamValue.beginner: return _VCardIanaParamValue._beginnerKey;
      case VCardIanaParamValue.average: return _VCardIanaParamValue._averageKey;
      case VCardIanaParamValue.expert: return _VCardIanaParamValue._expertKey;
      case VCardIanaParamValue.high: return _VCardIanaParamValue._highKey;
      case VCardIanaParamValue.medium: return _VCardIanaParamValue._mediumKey;
      case VCardIanaParamValue.low: return _VCardIanaParamValue._lowKey;

      case VCardIanaParamValue.b: return _VCardIanaParamValue._bKey;
      case VCardIanaParamValue.bbs: return _VCardIanaParamValue._bbsKey;
      case VCardIanaParamValue.binary: return _VCardIanaParamValue._binaryKey;
      case VCardIanaParamValue.car: return _VCardIanaParamValue._carKey;
      case VCardIanaParamValue.dateTime: return _VCardIanaParamValue._dateTimeKey;
      case VCardIanaParamValue.dom: return _VCardIanaParamValue._domKey;
      case VCardIanaParamValue.internet: return _VCardIanaParamValue._internetKey;
      case VCardIanaParamValue.intl: return _VCardIanaParamValue._intlKey;
      case VCardIanaParamValue.isdn: return _VCardIanaParamValue._isdnKey;
      case VCardIanaParamValue.modem: return _VCardIanaParamValue._modemKey;
      case VCardIanaParamValue.msg: return _VCardIanaParamValue._msgKey;
      case VCardIanaParamValue.parcel: return _VCardIanaParamValue._parcelKey;
      case VCardIanaParamValue.pcs: return _VCardIanaParamValue._pcsKey;
      case VCardIanaParamValue.postal: return _VCardIanaParamValue._postalKey;
      case VCardIanaParamValue.pref: return _VCardIanaParamValue._prefKey;
      case VCardIanaParamValue.uri: return _VCardIanaParamValue._uriKey;
      case VCardIanaParamValue.x400: return _VCardIanaParamValue._x400Key;

      case VCardIanaParamValue.base64: return _VCardIanaParamValue._base64Key;
      case VCardIanaParamValue.quotedPrintable: return _VCardIanaParamValue._quotedPrintableKey;
      case VCardIanaParamValue.encoding8bit: return _VCardIanaParamValue._8bitKey;
      default: return null;
    }
  }

  static VCardIanaParamValue vCardIanaParamValueForString(String s) {
    final sLower = s.toLowerCase();
    switch (sLower) {
      case _VCardIanaParamValue._workKey: return VCardIanaParamValue.work;
      case _VCardIanaParamValue._homeKey: return VCardIanaParamValue.home;
      case _VCardIanaParamValue._textKey: return VCardIanaParamValue.text;
      case _VCardIanaParamValue._voiceKey: return VCardIanaParamValue.voice;
      case _VCardIanaParamValue._faxKey: return VCardIanaParamValue.fax;
      case _VCardIanaParamValue._cellKey: return VCardIanaParamValue.cell;
      case _VCardIanaParamValue._videoKey: return VCardIanaParamValue.video;
      case _VCardIanaParamValue._pagerKey: return VCardIanaParamValue.pager;
      case _VCardIanaParamValue._textphoneKey: return VCardIanaParamValue.textphone;
      case _VCardIanaParamValue._mainNumberKey: return VCardIanaParamValue.mainNumber;
      case _VCardIanaParamValue._gregorianKey: return VCardIanaParamValue.gregorian;
      case _VCardIanaParamValue._contactKey: return VCardIanaParamValue.contact;
      case _VCardIanaParamValue._acquaintanceKey: return VCardIanaParamValue.acquaintance;
      case _VCardIanaParamValue._friendKey: return VCardIanaParamValue.friend;
      case _VCardIanaParamValue._metKey: return VCardIanaParamValue.met;
      case _VCardIanaParamValue._coWorkerKey: return VCardIanaParamValue.coWorker;
      case _VCardIanaParamValue._colleagueKey: return VCardIanaParamValue.colleague;
      case _VCardIanaParamValue._coResidentKey: return VCardIanaParamValue.coResident;
      case _VCardIanaParamValue._neighborKey: return VCardIanaParamValue.neighbor;
      case _VCardIanaParamValue._childKey: return VCardIanaParamValue.child;
      case _VCardIanaParamValue._parentKey: return VCardIanaParamValue.parent;
      case _VCardIanaParamValue._siblingKey: return VCardIanaParamValue.sibling;
      case _VCardIanaParamValue._spouseKey: return VCardIanaParamValue.spouse;
      case _VCardIanaParamValue._kinKey: return VCardIanaParamValue.kin;
      case _VCardIanaParamValue._museKey: return VCardIanaParamValue.muse;
      case _VCardIanaParamValue._crushKey: return VCardIanaParamValue.crush;
      case _VCardIanaParamValue._dateKey: return VCardIanaParamValue.date;
      case _VCardIanaParamValue._sweetheartKey: return VCardIanaParamValue.sweetheart;
      case _VCardIanaParamValue._meKey: return VCardIanaParamValue.me;
      case _VCardIanaParamValue._agentKey: return VCardIanaParamValue.agent;
      case _VCardIanaParamValue._emergencyKey: return VCardIanaParamValue.emergency;
      case _VCardIanaParamValue._beginnerKey: return VCardIanaParamValue.beginner;
      case _VCardIanaParamValue._averageKey: return VCardIanaParamValue.average;
      case _VCardIanaParamValue._expertKey: return VCardIanaParamValue.expert;
      case _VCardIanaParamValue._highKey: return VCardIanaParamValue.high;
      case _VCardIanaParamValue._mediumKey: return VCardIanaParamValue.medium;
      case _VCardIanaParamValue._lowKey: return VCardIanaParamValue.low;

      case _VCardIanaParamValue._bKey: return VCardIanaParamValue.b;
      case _VCardIanaParamValue._bbsKey: return VCardIanaParamValue.bbs;
      case _VCardIanaParamValue._binaryKey: return VCardIanaParamValue.binary;
      case _VCardIanaParamValue._carKey: return VCardIanaParamValue.car;
      case _VCardIanaParamValue._dateTimeKey: return VCardIanaParamValue.dateTime;
      case _VCardIanaParamValue._domKey: return VCardIanaParamValue.dom;
      case _VCardIanaParamValue._internetKey: return VCardIanaParamValue.internet;
      case _VCardIanaParamValue._intlKey: return VCardIanaParamValue.intl;
      case _VCardIanaParamValue._isdnKey: return VCardIanaParamValue.isdn;
      case _VCardIanaParamValue._modemKey: return VCardIanaParamValue.modem;
      case _VCardIanaParamValue._msgKey: return VCardIanaParamValue.msg;
      case _VCardIanaParamValue._parcelKey: return VCardIanaParamValue.parcel;
      case _VCardIanaParamValue._pcsKey: return VCardIanaParamValue.pcs;
      case _VCardIanaParamValue._postalKey: return VCardIanaParamValue.postal;
      case _VCardIanaParamValue._prefKey: return VCardIanaParamValue.pref;
      case _VCardIanaParamValue._uriKey: return VCardIanaParamValue.uri;
      case _VCardIanaParamValue._x400Key: return VCardIanaParamValue.x400;

      case _VCardIanaParamValue._base64Key: return VCardIanaParamValue.base64;
      case _VCardIanaParamValue._quotedPrintableKey: return VCardIanaParamValue.quotedPrintable;
      case _VCardIanaParamValue._8bitKey: return VCardIanaParamValue.encoding8bit;
      default: return null;
    }
  }

  static bool isSupportedPropertyKey(
      VCardVersion vCardVersion,
      VCardIanaPropertyKey vCardIanaPropertyKey) {
    switch (vCardVersion) {
      case VCardVersion.v2_1:
        switch (vCardIanaPropertyKey) {
          case VCardIanaPropertyKey.anniversary:
          case VCardIanaPropertyKey.caladruri:
          case VCardIanaPropertyKey.caluri:
          case VCardIanaPropertyKey.class_:
          case VCardIanaPropertyKey.clientpidmap:
          case VCardIanaPropertyKey.fburl:
          case VCardIanaPropertyKey.gender:
          case VCardIanaPropertyKey.impp:
          case VCardIanaPropertyKey.kind:
          case VCardIanaPropertyKey.lang:
          case VCardIanaPropertyKey.member:
          case VCardIanaPropertyKey.name:
          case VCardIanaPropertyKey.nickname:
          case VCardIanaPropertyKey.prodid:
          case VCardIanaPropertyKey.related:
          case VCardIanaPropertyKey.sortString:
          case VCardIanaPropertyKey.xml:
            return false;
          default: return true;
        }
        break; // unreachable
      case VCardVersion.v3_0:
        switch (vCardIanaPropertyKey) {
          case VCardIanaPropertyKey.anniversary:
          case VCardIanaPropertyKey.caladruri:
          case VCardIanaPropertyKey.caluri:
          case VCardIanaPropertyKey.clientpidmap:
          case VCardIanaPropertyKey.fburl:
          case VCardIanaPropertyKey.gender:
          case VCardIanaPropertyKey.kind:
          case VCardIanaPropertyKey.lang:
          case VCardIanaPropertyKey.member:
          case VCardIanaPropertyKey.related:
          case VCardIanaPropertyKey.xml:
            return false;
          default: return true;
        }
        break; // unreachable
      case VCardVersion.v4_0:
        switch (vCardIanaPropertyKey) {
          case VCardIanaPropertyKey.agent:
          case VCardIanaPropertyKey.class_:
          case VCardIanaPropertyKey.label:
          case VCardIanaPropertyKey.mailer:
          case VCardIanaPropertyKey.name:
          case VCardIanaPropertyKey.profile:
          case VCardIanaPropertyKey.sortString:
            return false;
          default: return true;
        }
        break; // unreachable
      case VCardVersion.v5_0:
        return false; // TODO: Support v5.0
    }
  }
}
