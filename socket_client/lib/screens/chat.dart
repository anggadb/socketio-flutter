import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            new Text('Angga Bachtiar'),
            new Align(
              alignment: Alignment.center,
              child: Text(
                'ONLINE',
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15.0),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            new Positioned(
              child: Text('This will be the chat list'),
            ),
            new Positioned(
              child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "type here",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                      ),
                    ),
                    new IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: () {})
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
