// test mapbox api by locating a random place

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:hope_line/applicationConstants.dart';

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: FlutterMap(
      //   options: MapOptions(
      //     center: LatLng(51.5, -0.09),
      //     zoom: 13.0,
      //   ),
      //   layers: [
      //     TileLayerOptions(
      //       urlTemplate:
      //           'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      //       subdomains: ['a', 'b', 'c'],
      //     ),
      //     MarkerLayerOptions(
      //       markers: [
      //         Marker(
      //           width: 80.0,
      //           height: 80.0,
      //           point: LatLng(51.5, -0.09),
      //           builder: (ctx) => Container(
      //             child: FlutterLogo(),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.5, -0.09),
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
                width: 80.0,
                height: 80.0,
                point: applicationConstants.myLocation,
                builder: (ctx) => const FlutterLogo(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}