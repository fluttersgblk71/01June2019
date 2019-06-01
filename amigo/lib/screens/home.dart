import 'package:amigo/helpers/constants.dart';
import 'package:amigo/helpers/utilities.dart';
import 'package:amigo/model/model.dart';
import 'package:amigo/widgets/card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  ///Creates the Login Screen
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //begin...
    return Scaffold(
      appBar: AppBar(
        title: Text(beginChat),
      ),
      body: _constructBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _constructBody(BuildContext context) {
    final _height = height(context);
    // final _width = width(context);

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            'assets/amigoUser.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: _height * 0.02),
        Expanded(
          flex: 2,
          child: StreamBuilder<List<DefaultWords>>(
            stream: defaultCardsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctxt, index) {
                    //Begin...

                    return AmigoCard(
                      word: data[index].word,
                      translatedWord: data[index].translatedWord,
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(addToWordBank),
          content: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: wordHint,
            ),
          ),
          actions: [
            FlatButton(
              child: Text(closeText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(okText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
