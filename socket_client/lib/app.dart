import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

import 'screens/private_message.dart';

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  SocketIO socket =
      SocketIOManager().createSocketIO(DotEnv().env['SOCKET_URL'], '/chat');
  final _routes = <String, WidgetBuilder>{
    '/private': (BuildContext context) => PrivateMessage()
  };

  @override
  void initState() {
    super.initState();
    _onInitSocket();
  }

  void _onInitSocket() {
    socket.init();
    socket.connect();
  }

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
