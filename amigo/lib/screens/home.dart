import 'package:amigo/helpers/constants.dart';
import 'package:amigo/helpers/utilities.dart';
import 'package:amigo/model/model.dart';
import 'package:amigo/widgets/card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

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
    );
  }

  Widget _constructBody(BuildContext context) {
    final _height = height(context);
    final _width = width(context);

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

                // return Text(snapshot.data.toString());
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
