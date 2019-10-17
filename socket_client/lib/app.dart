import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  SocketIO socket =
      SocketIOManager().createSocketIO("http://192.168.8.102:3001", '/chat');

  @override
  void initState() {
    super.initState();
    _onInitSocketIO();
  }

  void _onInitSocketIO() {
    socket.init();
    socket.connect();
    String jsonData =
        '{"username": "Angga Bahctiar", "userId": 1, "socketId": "chat/mmaladmLJANJNdanka"}';
    socket.sendMessage('activated', jsonData, _onActivated);
  }

  void _onActivated(dynamic response) {
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new NetworkImage(
                          'https://vancouver.ca/images/cov/feature/corp-plan-downtown-landing-image.jpg'),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("My Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            new Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            new Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('KreatifChat'),
      ),
      body: Center(
        child: Text('This will be the main chat list'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
            height: 65.0,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble), title: Text('Private')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group_work), title: Text('Group')),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.contacts), title: Text('Contacts')),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.group), title: Text('Groups'))
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tap here to new message',
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
