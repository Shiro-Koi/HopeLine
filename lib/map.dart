import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  // Add your map-related variables and methods here

  @override
  Widget build(BuildContext context) {
    // Build your map UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Container(
        // Add your map widget or custom map implementation here
        child: Center(
          child: Text('Map Widget'),
          
@override
Widget build(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      center: LatLng(51.509364, -0.128928),
      zoom: 9.2,
    ),
    nonRotatedChildren: [
      RichAttributionWidget(
        attributions: [
          TextSourceAttribution(
            'OpenStreetMap contributors',
            onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          ),
        ],
      ),
    ],
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
    ],
  );
}
        ),
      ),
    );
  }
}
