// // ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPageHome extends StatefulWidget {
  final LatLng destination;

  const MapPageHome({required this.destination, super.key});

  @override
  State<MapPageHome> createState() => _MapPageState();
}

class _MapPageState extends State<MapPageHome> {
  Location _locationController = Location();
  late GoogleMapController _controller;
  bool _controllerInitialized = false;
  LatLng? _currentP;
  List<LatLng> _polylinePoints = [];

  @override
  void initState() {
    super.initState();
    _initLocationService();
    getLocationUpdates();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _controllerInitialized = true;
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Center(
                          child: Text(
                            'الخارطة تظهر لك كيفية الوصول الى المكان المطلوب من موقعك الحالي',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: _currentP == null
          ? const Center(
              child: Text("...انتظر قليلا"),
            )
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentP ?? LatLng(32.2238, 35.2613), // Use fixed coordinates if current location is null
                zoom: 13.0,
              ),
              markers: _createMarkers(),
              polylines: _createPolylines(),
            ),
    );
  }

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {
      Marker(
        markerId: MarkerId("destination"),
        icon: BitmapDescriptor.defaultMarker,
        position: widget.destination,
      ),
      Marker(
        markerId: MarkerId("centerLocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(32.2238, 35.2613), // Fixed coordinates
        infoWindow: InfoWindow(
          title: "موقع المركز",
          snippet: "هذا هو موقع المركز",
        ),
      ),
    };

    if (_currentP != null) {
      markers.add(
        Marker(
          markerId: MarkerId("_currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _currentP!,
          infoWindow: InfoWindow(
            title: "موقعك الحالي",
            snippet: "هذا هو مكانك الان",
          ),
        ),
      );
    }

    return markers;
  }

  Set<Polyline> _createPolylines() {
    return {
      Polyline(
        polylineId: PolylineId("route"),
        points: _polylinePoints,
        color: Colors.blue,
        width: 5,
      ),
    };
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        print("Location services are not enabled");
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("Location permissions are not granted");
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print("Current location: $_currentP, Accuracy: ${currentLocation.accuracy}");

          if (_controllerInitialized) {
            _controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _currentP!,
                  zoom: 13.0,
                ),
              ),
            );
          }
          _getRoute();
        });
      }
    });
  }

  Future<void> _getRoute() async {
    if (_currentP == null) return;

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${_currentP!.latitude},${_currentP!.longitude}&destination=${widget.destination.latitude},${widget.destination.longitude}&key=YOUR_API_KEY'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final routes = jsonResponse['routes'] as List;
      if (routes.isNotEmpty) {
        final points = routes[0]['overview_polyline']['points'];
        _polylinePoints = _decodePolyline(points);
        setState(() {});
      }
    }
  }

  List<LatLng> _decodePolyline(String polyline) {
    List<LatLng> points = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  void _initLocationService() {
    _locationController.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000, // Update every second
      distanceFilter: 10, // Update every 10 meters
    );
  }
}
