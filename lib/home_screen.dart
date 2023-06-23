import 'package:flutter/material.dart';
import 'package:hope_line/immediate_help.dart';
import 'package:hope_line/call_help.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // function to navigate to the immediate help screen
  void navigateToImmediateHelp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  ImmediateHelp()),
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
      // app bar button to reset the saved data (from full_data.json and lite_data.json)
      appBar: AppBar(
        title: const Text('Be Safe~', style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const SizedBox(height:),
            Center(
              child: SizedBox(
                height: 100,
                width: 240,
                //set button color to navy
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ImmediateHelp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Color.fromARGB(255, 218, 20, 20)              ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/immediate_icon.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Immediate Help',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 110),
            Center(
              child: SizedBox(
                height: 100,
                width: 240,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CallHelp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Color.fromARGB(255, 26, 226, 79)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/call_icon.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Call for Help',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
