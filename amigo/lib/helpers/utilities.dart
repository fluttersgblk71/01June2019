import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:amigo/helpers/constants.dart';
import 'package:amigo/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

///initialize the firestore instance..
final firestoreInstance = Firestore.instance;

///Get height of the device...
double height(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return height;
}

///Get width of the device...
double width(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width;
}

///Initialize the Agora...
Future<void> initializeAgora() async {
  AgoraRtcEngine.create(agoraId);
  AgoraRtcEngine.enableVideo();
  AgoraRtcEngine.setChannelProfile(ChannelProfile.Communication);
}

///Gets the default list of cards....
Stream<List<DefaultWords>> defaultCardsStream() {
  final _snapshots = firestoreInstance.collection('default_words').snapshots();

  final _listModel = _snapshots.map((list) =>
      list.documents.map((doc) => DefaultWords.fromSnapshot(doc)).toList());

  return _listModel;
}
