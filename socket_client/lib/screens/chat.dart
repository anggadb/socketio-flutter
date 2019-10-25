import 'dart:convert';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

import '../services/chat.service.dart';
import 'package:socket_client/models/chat.model.dart' as ChatModel;

class Chat extends StatefulWidget {
  final arguments;
  final roomName;

  Chat({Key key, @required this.arguments, @required this.roomName})
      : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  SocketIO socket =
      SocketIOManager().createSocketIO(DotEnv().env['SOCKET_URL'], '/chat');
  var chats = new List<ChatModel.Chat>();

  @override
  void initState() {
    super.initState();
    _getChatByRoom(widget.arguments);
  }

  void _getChatByRoom(id) {
    ChatService().getChatById(id).then((data) => {
          setState(() {
            Iterable list = json.decode(data.body);
            chats =
                list.map((model) => ChatModel.Chat.fromJson(model)).toList();
          })
        });
  }

  void _onTyping() {
    socket.init();
    socket.sendMessage('typing', '{"username": "Angga Bachtiar"}');
  }

  Widget _nipLocator(int sender, String text) {
    if (sender == 1) {
      return new Bubble(
        margin: BubbleEdges.only(top: 10),
        alignment: Alignment.topLeft,
        nip: BubbleNip.leftTop,
        child: Text(text),
      );
    } else {
      return new Bubble(
        margin: BubbleEdges.only(top: 10),
        alignment: Alignment.topRight,
        nip: BubbleNip.rightTop,
        color: Colors.yellow,
        child: Text(text, textAlign: TextAlign.right),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            new Text(widget.roomName),
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
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return _nipLocator(chats[index].sender, chats[index].chat);
                },
              ),
            ),
            new Positioned(
              child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        onChanged: (text) {
                          _onTyping();
                        },
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
