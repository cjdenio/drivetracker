import 'package:drivetracker/appState.dart';
import 'package:flutter/material.dart';

class StopwatchTextWidget extends StatefulWidget {
  StopwatchTextWidget(this.style, this.appState);
  final TextStyle style;
  final AppState appState;

  StopwatchTextWidgetState createState() => StopwatchTextWidgetState();
}

class StopwatchTextWidgetState extends State<StopwatchTextWidget> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  initState() {
    widget.appState.stopwatch.addListener(callback);

    seconds = (widget.appState.stopwatch.elapsedMilliseconds / 1000).floor() % 60;
    minutes = (widget.appState.stopwatch.elapsedMilliseconds / 1000 / 60).floor() % 60;
    hours = (widget.appState.stopwatch.elapsedMilliseconds / 1000 / 60 / 60).floor();

    super.initState();
  }

  dispose(){
    widget.appState.stopwatch.removeListener(callback);

    super.dispose();
  }

  callback(){
    setState(() {
      seconds = (widget.appState.stopwatch.elapsedMilliseconds / 1000).floor() % 60;
      minutes = (widget.appState.stopwatch.elapsedMilliseconds / 1000 / 60).floor() % 60;
      hours = (widget.appState.stopwatch.elapsedMilliseconds / 1000 / 60 / 60).floor();
    });
  }

  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 70, color: Colors.white,fontWeight: FontWeight.w200),
        children: [
          TextSpan(
            text: hours.toString().padLeft(2, '0') + ":" + minutes.toString().padLeft(2, '0')
          ),
          TextSpan(
            text: ":" + seconds.toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300)
          )
        ]
      )
    );
  }
}
