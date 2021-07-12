import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BallPage());

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Ask Me Anything"),
          backgroundColor: Colors.blue.shade900,
          /* When appbar is dark, ensure system status bar is not hard to read */
          brightness: Brightness.dark, // Android
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark), // iOS
        ),
        body: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void handlePressed() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          handlePressed();
        },
        child: Image.asset("images/ball$ballNumber.png"),
      ),
    );
  }
}
