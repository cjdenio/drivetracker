import 'package:drivetracker/models/Entry.dart';
import 'package:drivetracker/widgets/coolWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../appState.dart';

import 'package:intl/intl.dart';
import 'package:duration/duration.dart';

class EntriesPage extends StatefulWidget{
  final AppState appState;
  EntriesPage(this.appState);

  EntriesPageState createState() => EntriesPageState();
}

class EntriesPageState extends State<EntriesPage>{
  Widget build(BuildContext context){
    return Scaffold(
      drawer: CoolDrawer(),
      appBar: AppBar(
        title: Text("Entries")
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          Entry entry = widget.appState.entries[index];
          return ListTile(
              title: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: DateFormat.yMMMMd().format(entry.startTime) + ": " + DateFormat.jm().format(entry.startTime) + " - " + DateFormat.jm().format(entry.endTime)
                        ),
                        TextSpan(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          text: prettyDuration(entry.duration)
                        )
                      ]
                  )
              )
          );
        },
        itemCount: widget.appState.entries.length,
      ),
    );
  }
}