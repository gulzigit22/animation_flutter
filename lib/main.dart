import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contoller = ConfettiController();
  bool isplay = false;

  @override
  void dispose() {
    contoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                if (isplay) {
                  contoller.stop();
                } else {
                  contoller.play();
                }
                isplay = !isplay;
              },
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: contoller,
            blastDirection: pi / 2,
            emissionFrequency: 1,
            gravity: 0.1,
          )
        ],
      ),
    );
  }
}
