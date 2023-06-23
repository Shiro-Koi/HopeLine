import 'package:flutter/material.dart';
import 'package:hope_line/initial_screen.dart';

void main() {
  runApp(const HopeLine());
}

class HopeLine extends StatelessWidget {
  const HopeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HopeLine',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const InitialScreen(),
    );
  }
}
