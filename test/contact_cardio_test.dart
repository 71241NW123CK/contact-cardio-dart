import 'package:contact_cardio/contact_cardio.dart';
import 'package:contact_cardio/src/contact_card_deserializer.dart';
import 'package:contact_cardio/src/formats/email_address/only_email_address_contact_card.dart';
import 'package:contact_cardio/src/formats/phone_number/only_phone_number_contact_card.dart';
import 'package:test/test.dart';

class TypeToken<T> {
  TypeToken();

  bool isTypeOf(dynamic o) => o is T;
}

class DeserializationTestCase {
  final String serializedContactCard;
  final TypeToken typeToken;

  DeserializationTestCase(this.serializedContactCard, this.typeToken);
}

void main() {
  var deserializationTestCaseList = <DeserializationTestCase>[];

  const validRawEmailAddressList = <String>[
    'backward6@gmail.com',
    'cola.pippu@gmail.com',
  ];
  deserializationTestCaseList +=
      validRawEmailAddressList
          .map((s) =>
              DeserializationTestCase(
                  s,
                  TypeToken<RawEmailAddressContactCard>()
              )
          )
          .toList();

  final validUriEmailAddressList =
      validRawEmailAddressList.map((s) => 'mailto:$s').toList();
  deserializationTestCaseList +=
      validUriEmailAddressList
          .map((s) =>
              DeserializationTestCase(
                  s,
                  TypeToken<UriEmailAddressContactCard>()
              )
          )
          .toList();

  const validMeCardList = <String>[
    'MECARD:;',
    'MECARD:N:塚本,ライアン広秋;SOUND:つかもと,ライアンひろあき;TEL:18084206969;TEL:13535552222;TEL-AV:19006666969;EMAIL:backward6@gmail.com;EMAIL:cola.pippu@gmail.com;NOTE:Howdy, my name is Rawhide Kobayashi. I\'m a 27 year old Japanese Japamerican (western culture fan for you foreigners). I brand and wrangle cattle on my ranch, and spend my days perfecting the craft and enjoying superior American passtimes. (Barbeque, Rodeo, Fireworks) I train with my branding iron every day, this superior weapon can permanently leave my ranch embled on a cattle\'s hide because it is white-hot, and is vastly superior to any other method of livestock marking. I earned my branding license two years ago, and I have been getting better every day. I speak English fluently, both Texas and Oklahoma dialect, and I write fluently as well. I know everything about American history and their cowboy code, which I follow 100% When I get my American visa, I am moving to Dallas to work in an oil field to learn more about their magnificent culture. I hope I can become a cattle wrangler for the Double Cross Ranch or an oil rig operator for Exxon-Mobil! I own several cowboy hats, which I wear around town. I want to get used to wearing them before I move to America, so I can fit in easier. I rebel against my elders and seniors and speak English as often as I can, but rarely does anyone manage to respond. Wish me luck in America!;BDAY:19690420;ADR:,Smoking Room,420 Pakalolo Circle,Honolulu,,,Kingdom of Hawaiʻi;ADR:,Punani Suite,69 Utubangbang Loop,Honolulu,,,Kingdom of Hawaiʻi;URL:https://www.google.com/;URL:https://treesquaredtechnologies.com/;URL:https://github.com/71241NW123CK/;NICKNAME:Rawhide Kobayashi;;',
  ];
  deserializationTestCaseList +=
      validMeCardList
          .map((s) =>
              DeserializationTestCase(
                  s,
                  TypeToken<MeCardContactCard>()
              )
          )
          .toList();

  const validRawPhoneNumberList = <String>[
    '+15555555555',
    '(808) 420-6969',
  ];
  deserializationTestCaseList +=
      validRawPhoneNumberList
          .map((s) =>
              DeserializationTestCase(
                  s,
                  TypeToken<RawPhoneNumberContactCard>()
              )
          )
          .toList();

  final validUriPhoneNumberList =
      validRawPhoneNumberList.map((s) => 'tel:$s').toList();
  deserializationTestCaseList +=
      validUriPhoneNumberList
          .map((s) =>
              DeserializationTestCase(
                  s,
                  TypeToken<UriPhoneNumberContactCard>()
              )
          )
          .toList();

  const validVCardList = <String> [
    'BEGIN:VCARD\r\n'
    'VERSION:3.0\r\n'
    'FN:Faye Valentine\r\n'
    'N:Valentine;Faye\r\n'
    'NOTE: The real folk blues...  \r\n'
    ' You\'re gonna carry that weight.\r\n'
    'END:VCARD\r\n',

    'BEGIN:VCARD\r\n'
    'VERSION:3.0\r\n'
    'FN:Spike Spiegel\r\n'
    'N:Spiegel;Spike\r\n'
    'END:VCARD\r\n',

    'BEGIN:VCARD\r\n'
    'VERSION:3.0\r\n'
    'FN:Jet Black\r\n'
    'N:Black;Jet\r\n'
    'END:VCARD\r\n',

    'BEGIN:VCARD\r\n'
    'VERSION:3.0\r\n'
    'FN:Spike Spiegel\r\n'
    'N:Spiegel;Spike\r\n'
    'END:VCARD\r\n'
    '\r\n'
    '\r\n'
    'BEGIN:VCARD\r\n'
    'VERSION:3.0\r\n'
    'FN:Jet Black\r\n'
    'N:Black;Jet\r\n'
    'END:VCARD\r\n',
  ];
  deserializationTestCaseList +=
      validVCardList
          .map((s) =>
              DeserializationTestCase(
                  s,
                  TypeToken<VCardContactCard>()
              )
          )
          .toList();

  const invalidContactList = <String>[
    'This is not a valid contact',
    'herp derp',
    'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:No End\r\nN:End;No\r\n',
  ];

  void testDeserializer<T extends ContactCard>(
      ContactCardDeserializer<T> deserializer) {
    deserializationTestCaseList.forEach((v) {
      if (v.typeToken is TypeToken<T>) {
        final c = deserializer(v.serializedContactCard);
        expect(c, isNotNull);
        expect(v.typeToken.isTypeOf(c), isTrue);
        final ss = c.serialize();
        final cc = deserializer(ss);
        expect(cc, isNotNull);
        expect(v.typeToken.isTypeOf(cc), isTrue);
        final sss = cc.serialize();
        expect(ss, equals(sss));
      } else {
        final c = deserializer(v.serializedContactCard);
        expect(c, isNull);
      }
    });
    invalidContactList.forEach((s) {
      final c = deserializer(s);
      expect(c, isNull);
    });
  }

  group('Generic tests', () {
    test('RawEmailAddressContactCard', () =>
        testDeserializer(RawEmailAddressContactCard.deserialize)
    );

    test('UriEmailAddressContactCard', () =>
        testDeserializer(UriEmailAddressContactCard.deserialize)
    );

    test('SingleEmailAddressContactCard', () =>
        testDeserializer(SingleEmailAddressContactCard.deserialize)
    );

    test('OnlyEmailAddressContactCard', () =>
        testDeserializer(OnlyEmailAddressContactCard.deserialize)
    );

    test('EmailAddressContactCard', () =>
        testDeserializer(EmailAddressContactCard.deserialize)
    );

    test('MeCardContactCard', () =>
        testDeserializer(MeCardContactCard.deserialize)
    );

    test('RawPhoneNumberContactCard', () =>
        testDeserializer(RawPhoneNumberContactCard.deserialize)
    );

    test('UriPhoneNumberContactCard', () =>
        testDeserializer(UriPhoneNumberContactCard.deserialize)
    );

    test('SinglePhoneNumberContactCard', () =>
        testDeserializer(SinglePhoneNumberContactCard.deserialize)
    );

    test('OnlyPhoneNumberContactCard', () =>
        testDeserializer(OnlyPhoneNumberContactCard.deserialize)
    );

    test('PhoneNumberContactCard', () =>
        testDeserializer(PhoneNumberContactCard.deserialize)
    );

    test('VCardContactCard', () =>
        testDeserializer(VCardContactCard.deserialize)
    );

    test('ContactCard', () =>
        testDeserializer(ContactCard.deserialize)
    );
  });
}
