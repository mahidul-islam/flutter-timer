import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;
  int _start = 100;
  bool isButtonPlay = true;

  void startStopTimer() {
    const oneSec = const Duration(seconds: 1);
    // ignore: todo
    // TODO (Zihan): To Convert it into millisecond use below Duration and change the logic accordingly.
    // const oneMilliSec = const Duration(milliseconds: 1);

    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              '$_start',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          IconButton(
            iconSize: 50,
            icon: isButtonPlay ? Icon(Icons.play_arrow) : Icon(Icons.pause),
            onPressed: () {
              setState(() {
                isButtonPlay = !isButtonPlay;
              });
              startStopTimer();
            },
          ),
        ],
      ),
    );
  }
}
