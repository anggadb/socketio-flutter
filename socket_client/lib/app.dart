import 'package:flutter/material.dart';

import 'screens/private_message.dart';
import 'screens/chat.dart';

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    '/private': (BuildContext context) => PrivateMessage(),
    '/chat': (BuildContext context) => Chat()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SocketIO Client',
        theme: ThemeData(
            primaryColor: Colors.brown,
            accentColor: Colors.yellow,
            fontFamily: 'Okomito'),
        home: PrivateMessage(),
        routes: _routes);
  }
}
