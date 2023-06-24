//call help screen, calls the help line number i.e(+9647700124848)

import 'package:flutter/material.dart';
// phone call package
import 'package:url_launcher/url_launcher.dart';

class CallHelp extends StatelessWidget {
  const CallHelp({Key? key}) : super(key: key);

  // function to call the help line number
  void callHelpLine() async {
    Uri url = Uri(
      scheme: 'tel',
      path: '+9647700124848',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } // callHelpLine()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call for Help'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Call for Help',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'If you are in immediate danger, please call the help line number.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 240,
              // set button color to navy
              child: ElevatedButton(
                onPressed: () {
                  callHelpLine();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'Call',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
