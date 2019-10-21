import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Angga Bachtiar"),
            accountEmail: Text("bachtiar.angga@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.yellow,
                child: Text("A",
                    style: TextStyle(color: Colors.black, fontSize: 40.0))),
          ),
          new ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),
          new ListTile(
              leading: Icon(Icons.book),
              title: Text("Contacts"),
              onTap: () {
                Navigator.pop(context);
              }),
          new Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),
          new ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),
          new Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60.0,
                width: double.infinity,
                child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('LOG OUT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
