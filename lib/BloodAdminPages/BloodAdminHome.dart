// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:cytc/AdminPages/Home/Emergencies/addBloodDonation.dart';
import 'package:cytc/BloodAdminPages/Table.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class BloodAdminHomePage extends StatelessWidget {
  final String userId;

  const BloodAdminHomePage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(),
      ),
      home: BloodAdminHome(),
    );
  }
}

class BloodAdminHome extends StatefulWidget {
  @override
  _BloodAdminHomeState createState() => _BloodAdminHomeState();
}

class _BloodAdminHomeState extends State<BloodAdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'قم بادخال حالات الطوارئ  ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFffe145),
                    fontFamily: 'Amiri',
                  ),
                ),
                SizedBox(width: 5),
                Image.asset(
                  'assets/gif/alert.gif',
                  height: 40,
                  width: 40,
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildCardRequestBloodUnits(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardRequestBloodUnits() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth < 600 ? constraints.maxWidth : 400;

        return Center(
          child: SizedBox(
            width: cardWidth,
            height: 150,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BloodAdminBloodRequests()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.25),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'طلب وحدات دم',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF071533),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amiri',
                        ),
                      ),
                      SizedBox(height: 15),
                      Image.asset(
                        'assets/adminPage/bloodAdd.png',
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
