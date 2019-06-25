import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(ClockApp());

class ClockApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClockAppState();
  }
}

class ClockAppState extends State<ClockApp> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);


    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Flutter"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextWidget(
                    label: "HRS", value: hours.toString().padLeft(2, '0')),
                CustomTextWidget(
                    label: "MIN", value: minutes.toString().padLeft(2, '0')),
                CustomTextWidget(
                    label: "SEC", value: seconds.toString().padLeft(2, '0')),
              ],
            ),
            RaisedButton(
              child: Text(!isActive ? "Start" : "Stop"),
              onPressed: () {
                setState(() {
                  isActive = !isActive;
                });
              },
            )
          ]),
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  final String label;
  final String value;

  CustomTextWidget({this.label, this.value});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery
        .of(context)
        .size
        .width / 3 - 20;

    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10),
        color: Colors.black87,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}
