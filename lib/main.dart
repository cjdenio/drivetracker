import 'package:drivetracker/appState.dart';
import 'package:drivetracker/pages/settings.dart';
import 'package:drivetracker/pages/stats.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/help.dart';
import 'pages/entries.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppState appState;
  
  MyApp(){
    this.appState = AppState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark
      ),
      routes: {
        '/': (context) => HomePage(appState),
        '/help': (context) => HelpPage(),
        '/entries': (context) => EntriesPage(appState),
        '/settings': (context) => SettingsPage(appState),
        '/stats': (context) => StatsPage(appState)
      }
    );
  }
}