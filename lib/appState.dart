import 'package:drivetracker/models/Entry.dart';
import 'package:drivetracker/updatingStopwatch.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class AppState{
  final UpdatingStopwatch stopwatch = UpdatingStopwatch();
  final List <Entry> entries = [];
  ValueNotifier entryNotifier;

  DateTime startTime;
  DateTime endTime;
  ValueNotifier startTimeNotifier;

  String get startTimeFormat{
    return startTime != null ? DateFormat.jm().format(startTime) : "00:00 AM";
  }

  AppState(){
    entryNotifier = ValueNotifier(entries);
    startTimeNotifier = ValueNotifier(startTime);
  }

  void addEntry(){
    entries.add(Entry(startTime: startTime, endTime: endTime));
  }

  Settings settings = new Settings();
}

class Settings{

}