// basic immediate help screen

import 'package:flutter/material.dart';

class ImmediateHelp extends StatelessWidget {
  const ImmediateHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Immediate Help')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // button to call the first emergency contact
            ElevatedButton(
              onPressed: () => {},
              child: const Text('Call Emergency Contact 1'),
            ),
            // button to call the second emergency contact
            ElevatedButton(
              onPressed: () => {},
              child: const Text('Call Emergency Contact 2'),
            ),
          ],
        ),
      ),
    );
  }
}