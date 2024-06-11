// // ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class MapPage extends StatefulWidget {
//   final LatLng destination;

//   const MapPage({required this.destination, super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   Location _locationController = Location();
//   late GoogleMapController _controller;
//   bool _controllerInitialized = false;
//   LatLng? _currentP;
//   List<LatLng> _polylinePoints = [];
//   BitmapDescriptor? _customMarkerIcon;
//   Offset? _markerOffset;
//   Set<Polyline> _polylines = {};

//   @override
//   void initState() {
//     super.initState();
//     _initLocationService();
//     _loadCustomMarkerIcon();
//     getLocationUpdates();
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _controller = controller;
//     _controllerInitialized = true;
//   }

//   Future<void> _loadCustomMarkerIcon() async {
//     _customMarkerIcon = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(size: Size(48, 48)),
//       'assets/custom_marker.png',
//     );
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70.0), // Set the height you want
//         child: ClipRRect(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFFFBE66F), //0xFFffe145
//                   Color(0xFFffe145), //0xFFFFD700   اعتمدي اللي محطوط مش الكومنت
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0xFF071533).withOpacity(0.3),
//                   spreadRadius: 2,
//                   blurRadius: 10,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             Icons.arrow_back_ios_new,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         Center(
//                           child: Text(
//                             'الخارطة تظهر لك كيفية الوصول الى المكان المطلوب من موقعك الحالي',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Amiri',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           _currentP == null
//               ? Center(
//                   child: SpinKitFadingCircle(
//                     color: Color(0xFF071533),
//                     size: 50.0,
//                   ),
//                 )
//               : GoogleMap(
//                   onMapCreated: (controller) {
//                     _onMapCreated(controller);
//                     if (_currentP != null) {
//                       _calculateMarkerOffset(_currentP!);
//                     }
//                   },
//                   initialCameraPosition: CameraPosition(
//                     target: _currentP ?? LatLng(37.4223, -122.0848),
//                     zoom: 13.0,
//                   ),
//                   markers: _createMarkers(),
//                   polylines: _polylines,
//                   onCameraMove: (position) {
//                     if (_currentP != null) {
//                       _calculateMarkerOffset(_currentP!);
//                     }
//                   },
//                 ),
//           if (_markerOffset != null)
//             Positioned(
//               left: _markerOffset!.dx,
//               top: _markerOffset!.dy,
//               child: Text(
//                 "Current Location",
//                 style: TextStyle(
//                   color: Colors.red.shade100,
//                   fontWeight: FontWeight.bold,
//                   backgroundColor: Colors.red,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   void _calculateMarkerOffset(LatLng position) async {
//     ScreenCoordinate screenCoordinate = await _controller.getScreenCoordinate(position);
//     setState(() {
//       _markerOffset = Offset(
//         screenCoordinate.x.toDouble() - 50, // Adjust based on your marker size and text position
//         screenCoordinate.y.toDouble() - 60, // Adjust based on your marker size and text position
//       );
//     });
//   }

//   Set<Marker> _createMarkers() {
//     Set<Marker> markers = {
//       Marker(
//         markerId: MarkerId("destination"),
//         icon: BitmapDescriptor.defaultMarker,
//         position: widget.destination,
//       ),
//     };

//     if (_currentP != null) {
//       markers.add(
//         Marker(
//           markerId: MarkerId("_currentLocation"),
//           icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
//           position: _currentP!,
//         ),
//       );
//     }

//     return markers;
//   }

//   Future<void> getLocationUpdates() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await _locationController.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await _locationController.requestService();
//       if (!_serviceEnabled) {
//         print("Location services are not enabled");
//         return;
//       }
//     }

//     _permissionGranted = await _locationController.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await _locationController.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         print("Location permissions are not granted");
//         return;
//       }
//     }

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
//           _getRoute();
//           _updatePolylines(); // Update polyline when the location is updated
//         });
//       }
//     });
//   }

//   Future<void> _getRoute() async {
//     if (_currentP == null) return;

//     final response = await http.get(Uri.parse(
//         'https://maps.googleapis.com/maps/api/directions/json?origin=${_currentP!.latitude},${_currentP!.longitude}&destination=${widget.destination.latitude},${widget.destination.longitude}&key=YOUR_API_KEY'));

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       final routes = jsonResponse['routes'] as List;
//       if (routes.isNotEmpty) {
//         final points = routes[0]['overview_polyline']['points'];
//         _polylinePoints = _decodePolyline(points);
//         setState(() {});
//       }
//     }
//   }

//   List<LatLng> _decodePolyline(String polyline) {
//     List<LatLng> points = [];
//     int index = 0, len = polyline.length;
//     int lat = 0, lng = 0;

//     while (index < len) {
//       int b, shift = 0, result = 0;
//       do {
//         b = polyline.codeUnitAt(index++) - 63;
//         result |= (b & 0x1f) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
//       lat += dlat;

//       shift = 0;
//       result = 0;
//       do {
//         b = polyline.codeUnitAt(index++) - 63;
//         result |= (b & 0x1f) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
//       lng += dlng;

//       points.add(LatLng(lat / 1E5, lng / 1E5));
//     }

//     return points;
//   }

//   void _updatePolylines() {
//     if (_currentP == null) return;
//     setState(() {
//       _polylines = {
//         Polyline(
//           polylineId: PolylineId("current_to_destination"),
//           points: [_currentP!, widget.destination],
//           color: Colors.blue,
//           width: 5,
//         ),
//       };
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




















 

import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        // child: ClipPath(
        // clipper: CustomAppBarClipper(),
        child: AppBar(
          backgroundColor: Color(0xFF071533).withOpacity(0.1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(LineAwesomeIcons.bars_solid, color: Color(0xFF071533)),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Text(
            'قم بتحديد المكان المطلوب على الخارطة',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Color(0xFF071533),
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(LineAwesomeIcons.angle_right_solid,
                  color: Color(0xFF071533)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        // ),
      ),
      drawer: _buildDrawer(),
      
      body: _currentP == null
          ? const Center(
              child: Text("...انتظر قليلا"),
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
  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'بانه خالد حمدان',
                        style: TextStyle(
                          color: Color(0xFF071533),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/banah.jpg'), // Replace with your image path
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => bar(userId: '', userRole: ''))),
            title: Text('الرئيسية',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        universityTrainingPage())), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid,
                color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SuggestionsPage())), // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing:
                Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () {}, // Add onTap functionality for logout
            title: Text('تسجيل خروج',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
          ),
        ],
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


