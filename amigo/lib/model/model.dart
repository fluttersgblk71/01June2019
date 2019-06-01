import 'package:cloud_firestore/cloud_firestore.dart';

class DefaultWords {
  ///Converts map to the respective items.
  DefaultWords.fromMap(Map<String, dynamic> map, {this.reference})
      : word = map['name'],
        translatedWord = map['native_translation'];

  DefaultWords.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data,
          reference: snapshot.reference,
        );

  ///Set the document reference of firestore.
  final DocumentReference reference;

  ///Gets the default word..
  final String word;

  ///Gets the translated word..
  final String translatedWord;
}
