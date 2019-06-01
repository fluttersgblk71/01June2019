import 'package:flutter/material.dart';

class AmigoCard extends StatelessWidget {
  ///Creates the Amigo Card...
  const AmigoCard({
    Key key,
    @required this.word,
    @required this.translatedWord,
  }) : super(key: key);

  final String word;

  final String translatedWord;

  @override
  Widget build(BuildContext context) {
    //begin...

    return Card(
      child: ListTile(
        title: Text(word),
        subtitle: Text(translatedWord),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
