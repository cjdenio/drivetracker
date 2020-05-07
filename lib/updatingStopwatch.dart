import 'dart:async';
import 'package:flutter/widgets.dart';

/// Stopwatch that emits a callback when updated
class UpdatingStopwatch extends Stopwatch implements ChangeNotifier {
  Timer timer;

  List<Function> listeners = [];

  void stop() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    super.stop();
  }

  void start() {
    if (timer == null) {
      timer = Timer.periodic(
          Duration(milliseconds: 500), (_) => this.notifyListeners());
    }
    super.start();
  }

  void reset() {
    if(this.isRunning){
      this.stop();
    }
    super.reset();
    this.notifyListeners();
  }

  @override
  void addListener(listener) {
    this.listeners.add(listener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  bool get hasListeners => this.listeners.length >= 1;

  @override
  void notifyListeners() {
    listeners.forEach((element) {
      element();
    });
  }

  @override
  void removeListener(listener) {
    this.listeners.remove(listener);
  }
}
