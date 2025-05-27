import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math' as math;

class Dicee extends StatefulWidget {
  const Dicee({super.key});

  @override
  State<Dicee> createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  var leftdice = 5;
  var rightdice = 3;
  Color backgroundColor = Colors.red;
  final List<String> moodEmojis = [
    '😄',
    '😢',
    '😡',
    '🥳',
    '😴',
    '🤔',
    '😍',
    '😎',
    '😭',
    '😬',
  ];
  String currentEmoji = '😄';
  final random = math.Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Center(
            child: Text(
              "DICEE",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.pangolin().fontFamily,
              ),
            ),
          ),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ),
        body: GestureDetector(
          onTap: () {
            // Random random = Random();
            var random1 = math.Random().nextInt(6) + 1;
            var random2 = math.Random().nextInt(6) + 1;
            currentEmoji = moodEmojis[random.nextInt(moodEmojis.length)];
            print("random2: $random2");
            setState(() {
              leftdice = random1;
              rightdice = random2;
              backgroundColor = Color(
                math.Random().nextInt(0xFFFFFFFF),
              ).withAlpha(255);
            });
          },
          child: Center(
            child: Column(
              children: [
                Text(currentEmoji, style: TextStyle(fontSize: 100)),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('images/dice${leftdice}.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('images/dice${rightdice}.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
