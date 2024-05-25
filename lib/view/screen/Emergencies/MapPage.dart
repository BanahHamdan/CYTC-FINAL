// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPage extends StatefulWidget {
  final LatLng destination;

  const MapPage({required this.destination, super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: _currentP == null
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentP ?? LatLng(37.4223, -122.0848),
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
    };

    if (_currentP != null) {
      markers.add(
        Marker(
          markerId: MarkerId("_currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _currentP!,
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










// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   Location _locationController = Location();

//   late GoogleMapController _controller;
//   bool _controllerInitialized = false;

//   static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
//   static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
//   LatLng? _currentP;

//   @override
//   void initState() {
//     super.initState();
//     _initLocationService();
//     getLocationUpdates();
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _controller = controller;
//     _controllerInitialized = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Demo'),
//       ),
//       body: _currentP == null
//           ? const Center(
//               child: Text("Loading..."),
//             )
//           : GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _currentP ?? _pGooglePlex,
//                 zoom: 13.0,
//               ),
//               markers: _createMarkers(),
//             ),
//     );
//   }

//   Set<Marker> _createMarkers() {
//     Set<Marker> markers = {
//       Marker(
//         markerId: MarkerId("_sourceLocation"),
//         icon: BitmapDescriptor.defaultMarker,
//         position: _pApplePark,
//       ),
//     };

//     if (_currentP != null) {
//       markers.add(
//         Marker(
//           markerId: MarkerId("_currentLocation"),
//           icon: BitmapDescriptor.defaultMarker,
//           position: _currentP!,
//         ),
//       );
//     }

//     return markers;
//   }

//   Future<void> getLocationUpdates() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     // Check if location services are enabled
//     _serviceEnabled = await _locationController.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await _locationController.requestService();
//       if (!_serviceEnabled) {
//         print("Location services are not enabled");
//         return;
//       }
//     }

//     // Check and request location permissions
//     _permissionGranted = await _locationController.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await _locationController.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         print("Location permissions are not granted");
//         return;
//       }
//     }

//     // Listen for location updates
//     _locationController.onLocationChanged.listen((LocationData currentLocation) {
//       if (currentLocation.latitude != null && currentLocation.longitude != null) {
//         setState(() {
//           _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           print("Current location: $_currentP, Accuracy: ${currentLocation.accuracy}");

//           if (_controllerInitialized) {
//             _controller.animateCamera(
//               CameraUpdate.newCameraPosition(
//                 CameraPosition(
//                   target: _currentP!,
//                   zoom: 13.0,
//                 ),
//               ),
//             );
//           }
//         });
//       }
//     });
//   }
//   void _initLocationService() {
//     _locationController.changeSettings(
//       accuracy: LocationAccuracy.high,
//       interval: 1000, // Update every second
//       distanceFilter: 10, // Update every 10 meters
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   Location _locationController = new Location();

//   late GoogleMapController _controller;

//   static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
//   static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
//   LatLng? _currentP = null;

//   @override
//   void initState(){
//     super.initState();
//     getLocationUpdates();
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _controller = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Demo'),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _pGooglePlex,
//           zoom: 13.0,
//         ),
//         markers: {
//           Marker(
//               markerId: MarkerId("_currentLocation"),
//               icon: BitmapDescriptor.defaultMarker,
//               position: _pGooglePlex),
//               Marker(
//               markerId: MarkerId("_sourceLocation"),
//               icon: BitmapDescriptor.defaultMarker,
//               position: _pApplePark),
//         },
//       ),
//     );
//   }

//   Future<void> getLocationUpdates() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await _locationController.serviceEnabled();
//     if (_serviceEnabled) {
//       _serviceEnabled = await _locationController.requestService();
//     } else {
//       return;
//     }

//     _permissionGranted = await _locationController.hasPermission();

//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await _locationController.requestPermission();

//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//     _locationController.onLocationChanged
//         .listen((LocationData currentLocation) {
//       if (currentLocation.latitude != null &&
//           currentLocation.longitude != null) {
//             setState(() {
//                _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
//                print(_currentP);
//             });
//           }
//     });
//   }
// }
