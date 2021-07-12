import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Chord(note: 1, color: Colors.red),
              Chord(note: 2, color: Colors.orange),
              Chord(note: 3, color: Colors.yellow),
              Chord(note: 4, color: Colors.green),
              Chord(note: 5, color: Colors.teal),
              Chord(note: 6, color: Colors.blue),
              Chord(note: 7, color: Colors.purple),
            ])),
      ),
    );
  }
}

class Chord extends StatelessWidget {
  final int note;
  final Color color;

  Chord({Key key, @required this.note, @required this.color}) : super(key: key);

  playNote() {
    final player = AudioCache();
    player.play("note$note.wav");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () => playNote(),
        height: 100.0,
        color: color,
      ),
    );
  }
}
