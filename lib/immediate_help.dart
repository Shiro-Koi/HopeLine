// basic immediate help screen

import 'package:flutter/material.dart';

class ImmediateHelp extends StatelessWidget {
  ImmediateHelp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Immediate Help')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset("images/checkmark.png", height: 150, width: 150),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Help is on the way, Don\'t worry.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
