// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override 
  State <MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  // GoogleMapController? _controller;

  static const LatLng _pGooglePlex = LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        // onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex,
          zoom: 13.0,
        ),
      ),
    );
  }
}
