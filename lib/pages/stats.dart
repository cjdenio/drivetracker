import 'package:drivetracker/appState.dart';
import 'package:drivetracker/widgets/coolWidgets.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget{
  final AppState appState;
  StatsPage(this.appState);

  StatsPageState createState() => StatsPageState();
}

class StatsPageState extends State<StatsPage>{
  double value = 0.5;

  Widget build(BuildContext context){
    return Scaffold(
      drawer: CoolDrawer(),
      appBar: AppBar(
          title: Text("Stats")
      ),
      body: Column(
        children: [
          LinearProgressIndicator(value: this.value),
          OutlineButton(onPressed: (){setState(() {
            value = 1;
          });},child: Text("Test"),)
        ],
      )
    );
  }
}