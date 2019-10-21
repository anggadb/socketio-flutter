import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

import '../widgets/drawer.dart';
import '../widgets/bottom-app-bar.dart';
import '../models/room_list.model.dart';
import '../services/room.service.dart';

class PrivateMessage extends StatefulWidget {
  @override
  _PrivateMessage createState() => _PrivateMessage();
}

class _PrivateMessage extends State<PrivateMessage> {
  SocketIO socket =
      SocketIOManager().createSocketIO(DotEnv().env['SOCKET_URL'], '/chat');
  var privaterooms = new List<RoomList>();

  @override
  void initState() {
    super.initState();
    _onInitSocketIO();
    _getRooms();
  }

  void _onInitSocketIO() {
    socket.init();
    socket.connect();
  }

  void _getRooms() {
    RoomService().getAllRooms().then((res) {
      setState(() {
        Iterable list = json.decode(res.body);
        privaterooms = list.map((model) => RoomList.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new DrawerWidget(),
      appBar: AppBar(
        title: Text('KreatifChat'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: ListView.separated(
        itemCount: privaterooms.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.yellow,
              child: Text(
                privaterooms[index].name.substring(0, 1).toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
            ),
            title: Text(privaterooms[index].name),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            thickness: 0.2,
          );
        },
      ),
      bottomNavigationBar: BottomAppBarWidget(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tap here to new message',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/chat');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
