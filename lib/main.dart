import 'package:flutter/material.dart';
import 'package:menu_app/frontpage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    debugShowCheckedModeBanner: false,
    routes: {
      'home': (context) => Frontpage(),
    },
  ));
}

