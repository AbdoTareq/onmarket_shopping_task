import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// this for alice debugging network calls
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final logger = Logger();

//base url
const base_url = 'Put_base_url_here';
const headers = {'Accept': 'application/json'};
const baseImagePath = 'assets/images';

const Map<int, Color> colorMap = {
  50: Color.fromRGBO(249, 209, 99, .1),
  100: Color.fromRGBO(249, 209, 99, .2),
  200: Color.fromRGBO(249, 209, 99, .3),
  300: Color.fromRGBO(249, 209, 99, .4),
  400: Color.fromRGBO(249, 209, 99, .5),
  500: Color.fromRGBO(249, 209, 99, .6),
  600: Color.fromRGBO(249, 209, 99, .7),
  700: Color.fromRGBO(249, 209, 99, .8),
  800: Color.fromRGBO(249, 209, 99, .9),
  900: Color.fromRGBO(249, 209, 99, .1),
};

// styles
final Color? kbackgroundColor = Colors.grey[300];
const MaterialColor kPrimaryColor = MaterialColor(0xFFf9d163, colorMap);
const TextStyle kTStyle = TextStyle(
  fontSize: 30,
  color: Colors.white,
);
