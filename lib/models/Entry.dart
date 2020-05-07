class Entry{
  DateTime startTime;
  DateTime endTime;
  Duration get duration{
    return endTime.difference(startTime);
  }

  Entry({this.startTime, this.endTime});
}