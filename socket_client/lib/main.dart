import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './app.dart';

Future main() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}
