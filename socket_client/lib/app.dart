import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Chat App'),
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
                    icon: Icon(Icons.list), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), title: Text('Settings')),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Tap here to new message', child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
