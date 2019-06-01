import 'package:amigo/screens/home.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> amigoRouter() {
  return {
    '/home': (context) => MainScreen(),
  };
}
