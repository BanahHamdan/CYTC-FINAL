// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  LatLng? _chosenLocation;

  void _onMapCreated(GoogleMapController controller) {
    // Optional: Add any initialization here
  }

  void _onTap(LatLng location) {
    setState(() {
      _chosenLocation = location;
    });
  }

  void _saveLocation() {
    if (_chosenLocation != null) {
      Navigator.pop(context, _chosenLocation);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please choose a location on the map')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveLocation,
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(32.22399814117364, 35.262018884114724), // Centered on GooglePlex initially
          zoom: 13.0,
        ),
        onTap: _onTap,
        markers: _chosenLocation == null
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('chosenLocation'),
                  position: _chosenLocation!,
                ),
              },
      ),
    );
  }
}
