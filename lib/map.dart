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
}
