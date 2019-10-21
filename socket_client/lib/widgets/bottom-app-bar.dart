import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(
          height: 65.0,
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble), title: Text('Private')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group_work), title: Text('Group'))
            ],
          )),
    );
  }
}
