import 'package:drivetracker/appState.dart';
import 'package:drivetracker/widgets/stopwatch.dart';
import 'package:flutter/material.dart';
import '../widgets/coolWidgets.dart';

class HomePage extends StatefulWidget {
  final AppState appState;

  HomePage(this.appState);

  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CoolDrawer(),
        appBar: AppBar(
          title: Row(children: [
            Container(
              child: Icon(
                Icons.directions_car,
                size: 40,
              ),
              margin: EdgeInsets.only(right: 20),
            ),
            Text(
              "DriveTracker",
            )
          ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                Navigator.of(context).pushNamed('/help');
              },
            )
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                  opacity: widget.appState.startTime != null ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(text: "Started at "),
                            TextSpan(
                                text: widget.appState.startTimeFormat,
                                style: TextStyle(fontWeight: FontWeight.bold)
                            )
                          ]
                      )
                  )
              ),
              StopwatchTextWidget(
                  TextStyle(fontSize: 80.0, fontWeight: FontWeight.w200),
                  widget.appState),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.blue),
                    child: IconButton(
                      tooltip: widget.appState.stopwatch.isRunning
                          ? "Stop"
                          : "Start",
                      icon: Icon(widget.appState.stopwatch.isRunning
                          ? Icons.stop
                          : Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          if (widget.appState.stopwatch.elapsedMilliseconds ==
                              0) {
                            widget.appState.startTime = DateTime.now();
                          }

                          if (widget.appState.stopwatch.isRunning) {
                            //Set end time:
                            widget.appState.endTime = DateTime.now();

                            widget.appState.stopwatch.stop();
                          } else {
                            widget.appState.stopwatch.start();
                          }
                        });
                      },
                    )),
                IconButton(
                  icon: Icon(Icons.refresh),
                  tooltip: "Reset",
                  onPressed: () {
                    setState(() {
                      widget.appState.stopwatch.reset();
                      widget.appState.startTime = null;
                    });
                  },
                ),
                (!widget.appState.stopwatch.isRunning && widget.appState.stopwatch.elapsedMilliseconds > 0 ? Builder(builder: (BuildContext ctx) {
                  return IconButton(
                    icon: Icon(Icons.save),
                    tooltip: "Save Time",
                    onPressed: () {
                      widget.appState
                          .addEntry();
                      setState(() {
                        widget.appState.stopwatch.reset();
                        widget.appState.startTime = null;
                      });
                      Scaffold.of(ctx)
                          .showSnackBar(SnackBar(content: Text("Success!"),action: SnackBarAction(label: "Edit",onPressed: (){Navigator.pushReplacementNamed(context, '/entries',);},),));
                    },
                  );
                }) : null)
              ].where((w) => w != null).toList().map((w) => Container(child: w,margin: EdgeInsets.symmetric(horizontal: 10),)).toList()),
            ].where((e) => e != null).toList()));
  }
}
