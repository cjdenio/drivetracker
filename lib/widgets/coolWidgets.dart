// This file contains pre-built widgets that the app uses (like Drawers and AppBars and such)
//
//
// *yawn* is it time for bed yet?

import 'package:flutter/material.dart';

class CoolDrawer extends StatelessWidget{
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Timer"),
            leading: Icon(Icons.timer),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text("Entries"),
            leading: Icon(Icons.list),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/entries');
            },
          ),
          ListTile(
            title: Text("Stats"),
            leading: Icon(Icons.insert_chart),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/stats');
            },
          ),
          Divider(),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/settings');
            },
          )
        ],
      )
    );
  }
}