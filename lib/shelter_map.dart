// using map to locate a few checkpoints for shelters

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:hope_line/applicationConstants.dart';

class ShelterMap extends StatelessWidget {
  const ShelterMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlutterMap(
        options: MapOptions(
          center: const LatLng(35.561216, 45.435426),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
            additionalOptions: const {
              'mapStyleId': applicationConstants.mapBoxStyleId,
              'accessToken': applicationConstants.mapBoxAccessToken,
              'id': 'mapbox/streets-v11',
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(35.561216, 45.435426),
                height: 80.0,
                builder: (ctx) => GestureDetector(
                  onTap: () {
                    showDialog(
                      context: ctx,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('HopeLine Main Branch/Shelter'),
                        //some random info about the shelter
                        content: const Text('Location: Opposite of the '
                            'Dabashan School.\n'
                            'Capacity: 200 people.\n'
                            'Phone Number: 0750 123 4567'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Icon(Icons.pin_drop),
                ),
              ),
              Marker(
                point: LatLng(35.563887, 45.425231),
                height: 80.0,
                builder: (ctx) => GestureDetector(
                  onTap: () {
                    showDialog(
                      context: ctx,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('HopeLine Shelter 2'),
                        //some random info about the shelter
                        content: const Text('Location: Next to '
                            'Sharbazher Mosque.\n'
                            'Capacity: 100 people.\n'
                            'Phone Number: 0750 123 4567'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Icon(Icons.pin_drop),
                ),
              ),
              Marker(
                point: LatLng(35.569639, 45.441034),
                height: 80.0,
                builder: (ctx) => GestureDetector(
                  onTap: () {
                    showDialog(
                      context: ctx,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('HopeLine Shelter 3'),
                        //some random info about the shelter
                        content: const Text('Location: 3rd floor of '
                            'Talary Dya.\n'
                            'Capacity: 30 people.\n'
                            'Phone Number: 0750 123 4567'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Icon(Icons.pin_drop),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
