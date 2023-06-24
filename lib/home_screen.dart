import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hope_line/immediate_help.dart';
import 'package:hope_line/call_help.dart';
import 'package:hope_line/applicationConstants.dart';
import 'package:hope_line/shelter_map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // function to navigate to the immediate help screen
  void navigateToImmediateHelp(BuildContext context) async {
    // before navigating to the immediate help screen we try to get the location and report it

    getThePosition().then(
      (value) {
        var firebase = applicationConstants.getFirebaseInstance();
        var dataRef = firebase.ref("data");

        var newRef = dataRef.push();
        newRef.set({
          "latitude": value.latitude,
          "longitude": value.longitude,
          "date_sent": DateTime.now().millisecondsSinceEpoch
        });
      },
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImmediateHelp()),
    );
  }

  Future<Position> getThePosition() async {
    //TODO: check the permissions before trying to get the location

    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // here we may find the height of the person or the floor which the person sits in (for later)
    return pos;
  }

  // function to navigate to the call for help screen
  void navigateToCallHelp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CallHelp()),
    );
  }

  // function to navigate to a map screen for shelter locations
  void navigateToShelterMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShelterMap()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar button to reset the saved data (from full_data.json and lite_data.json)
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Be Safe~',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                child: ElevatedButton(
                  onPressed: () => navigateToCallHelp(context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Color.fromARGB(255, 26, 226, 79)),
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
            const SizedBox(height: 110),
            Center(
              child: SizedBox(
                height: 100,
                width: 240,
                child: ElevatedButton(
                  onPressed: () => navigateToImmediateHelp(context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Color.fromARGB(255, 218, 20, 20)),
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
            // Find Shelter button
            const SizedBox(height: 110),
            Center(
              child: SizedBox(
                height: 100,
                width: 240,
                child: ElevatedButton(
                  onPressed: () => navigateToShelterMap(context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Color.fromARGB(255, 46, 142, 232)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/shelter_icon.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Find Shelter',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
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
