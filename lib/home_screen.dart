// home screen with two options, immediate help or call for help
// immediate help will use immeiate_help.dart screen
// call for help will use call_help.dart screen

import 'package:flutter/material.dart';
import 'package:hope_line/immediate_help.dart';
import 'package:hope_line/call_help.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // function to navigate to the immediate help screen
  void navigateToImmediateHelp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImmediateHelp()),
    );
  }

  // function to navigate to the call for help screen
  void navigateToCallHelp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CallHelp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HopeLine'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // button to navigate to the immediate help screen
            ElevatedButton(
              onPressed: () => navigateToImmediateHelp(context),
              child: const Text('Immediate Help'),
            ),
            // button to navigate to the call for help screen
            ElevatedButton(
              onPressed: () => navigateToCallHelp(context),
              child: const Text('Call for Help'),
            ),
          ],
        ),
      ),
    );
  }
}