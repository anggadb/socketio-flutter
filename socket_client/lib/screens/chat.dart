import 'dart:convert';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

import '../services/chat.service.dart';
import 'package:socket_client/models/chat.model.dart' as ChatModel;
import 'package:socket_client/models/reciever_info.dart';
import 'package:socket_client/env.dart';

class Chat extends StatefulWidget {
  final arguments;
  final roomName;
  final userId;

  Chat(
      {Key key, @required this.arguments, @required this.roomName, this.userId})
      : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  SocketIO socket =
      SocketIOManager().createSocketIO(Environment().socketUrl, '/chat');
  var chats = new List<ChatModel.Chat>();
  var recieverInfo = new List<SocketInfo>();
  bool visible = false;

  @override
  void initState() {
    super.initState();
    _getChatByRoom(widget.arguments);
    _getReciverInfo(widget.userId);
    _isOnline(widget.userId);
    print(recieverInfo);
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

  void _getReciverInfo(int id) {
    socket.sendMessage('detail-user', '{"userId": "' + id.toString() + '"}');
    socket.subscribe('detail-user', (data) => _recieverInfoRes(data));
  }

  void _recieverInfoRes(dynamic data) {
    setState(() {
      Iterable list = json.decode(data);
      recieverInfo = list.map((model) => SocketInfo.fromJson(model)).toList();
    });
    socket.unSubscribe('detail-user');
  }

  void _onTyping() {
    socket.sendMessage(
        'typing', '{"username": "' + Environment().activeName + '"}');
  }

  void _isOnline(int userId) {
    socket.sendMessage(
        'check-online', '{"userId": "' + userId.toString() + '"}');
    socket.subscribe('check-online', _onlineRes);
  }

  void _onlineRes(dynamic data) {
    if (data == true) {
      setState(() {
        this.visible = true;
      });
    } else {
      setState(() {
        this.visible = false;
      });
    }
    socket.unSubscribe('check-online');
  }

  Widget _nipLocator(int sender, String text) {
    if (sender == int.parse(Environment().activeId)) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Align(
              child: Text(
                widget.roomName,
                textAlign: TextAlign.center,
              ),
            ),
            new Visibility(
                visible: true,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ONLINE',
                      style: TextStyle(
                          fontWeight: FontWeight.w200, fontSize: 15.0),
                    )))
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
