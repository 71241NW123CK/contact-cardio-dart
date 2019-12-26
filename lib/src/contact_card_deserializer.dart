import 'contact_card.dart';

typedef ContactCardDeserializer<T extends ContactCard> = T Function(String s);

// can be abstracted to `firstNonNullImage` or something like that
ContactCardDeserializer<T> chainContactCardDeserializerList<T extends ContactCard>(
    List<ContactCardDeserializer<T>> contactCardDeserializerList) {
  return (String s) {
    for (var contactCardDeserializer in contactCardDeserializerList) {
      final c = contactCardDeserializer(s);
      if (c != null) {
        return c;
      }
    }
    return null;
  };
}
