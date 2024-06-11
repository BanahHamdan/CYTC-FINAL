// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

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
        SnackBar(content: Text('قم بتحديد المكان على الخارطة', textAlign: TextAlign.right,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
  preferredSize: Size.fromHeight(70.0), // Set the height you want
  child: ClipRRect(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFBE66F), //0xFFffe145
            Color(0xFFffe145), //0xFFFFD700   اعتمدي اللي محطوط مش الكومنت
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF071533).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'اختر المكان المطلوب',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: _saveLocation,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
),

      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(32.22399814117364,
              35.262018884114724), // Centered on GooglePlex initially
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
