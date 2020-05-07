import 'package:drivetracker/appState.dart';
import 'package:drivetracker/widgets/coolWidgets.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  final AppState appState;
  SettingsPage(this.appState);

  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage>{
  Widget build(BuildContext context){
    return Scaffold(
      drawer: CoolDrawer(),
      appBar: AppBar(
        title: Text("Settings")
      ),
      body: Text("TODO"),
    );
  }
}