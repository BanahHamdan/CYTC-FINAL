// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  LatLng? _chosenLocation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        SnackBar(
            content: Text(
          'قم بتحديد المكان على الخارطة',
          textAlign: TextAlign.center,
        )),
      );
    }
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
}
