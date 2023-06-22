import 'package:flutter/material.dart';
import 'package:hope_line/applicationConstants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // Add your map-related variables and methods here

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.509364, -0.128928),
        zoom: 9.2,
      ),
      children: [
        TileLayer(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/dhruv25/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
            additionalOptions: {
              'mapStyleId': applicationConstants.mapBoxStyleId,
              'accessToken': applicationConstants.mapBoxAccessToken,
            }),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: const Color.fromARGB(255, 33, 32, 32),
  //       title: const Text('Flutter MapBox'),
  //     ),
  //     body: Stack(
  //       children: [
  //         FlutterMap(
  //           options: MapOptions(
  //             minZoom: 5,
  //             maxZoom: 18,
  //             zoom: 13,
  //             center: applicationConstants.myLocation,
  //           ),
  //           layers: [
  //             TileLayerOptions(
  //               urlTemplate:
  //                   'https://api.mapbox.com/styles/v1/dyary017/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}',
  //               additionalOptions: {
  //                 'mapStyleId': applicationConstants.mapBoxStyleId,
  //                 'accessToken': applicationConstants.mapBoxAccessToken,
  //               },
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
