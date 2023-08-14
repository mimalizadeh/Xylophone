import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text("Xylophone"),
      // ),
      body: SafeArea(
        child: Xylophon(),
      ),
    ),
  ));
}

class Xylophon extends StatefulWidget {
  const Xylophon({super.key});

  @override
  State<Xylophon> createState() => _XylophonState();
}

class _XylophonState extends State<Xylophon> {
  final player = AudioPlayer();

  void playSound(int soundNumber) async {
    await Future.delayed(const Duration(milliseconds: 100));
    await player.stop();
    await player.play(
      AssetSource("sounds/note$soundNumber.wav"),
    ); // will immediately start playing

  }

  Expanded createKey({required int soundNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        autofocus: true,
        clipBehavior: Clip.hardEdge,
        style: TextButton.styleFrom(backgroundColor: color),
        child: const Text(""),
        onHover: (val) {
          print("Val : {}$val");

          if (val == true) {
            playSound(soundNumber);
          }
        },
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        createKey(soundNumber: 1, color: Colors.red),
        createKey(soundNumber: 2, color: Colors.orange),
        createKey(soundNumber: 3, color: Colors.yellow),
        createKey(soundNumber: 4, color: Colors.green),
        createKey(soundNumber: 5, color: Colors.teal),
        createKey(soundNumber: 6, color: Colors.blue),
      ],
    );
  }
}
