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

  const invalidContactList = <String>[
    'This is not a valid contact',
    'herp derp',
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

    test('ContactCard', () =>
        testDeserializer(ContactCard.deserialize)
    );
  });
}
