// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 17, top: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'تفاعل معنا',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                _buildCategoryCard('اللانشطة والدورات',
                    'Get your dream job here this week', 'assets/homePage/campaign.jpg'),
                _buildCategoryCard('الحملات',
                    'Don\'t miss out on the events', 'assets/image2.png'),
                _buildCategoryCard('المهرجانات والاحتفالات',
                    'Learn new skills with our courses', 'assets/image3.png'),
                _buildCategoryCard('تقديم طلب تدريب للخريجين',
                    'Make a difference by volunteering', 'assets/image4.png'),
                _buildCategoryCard('اقترح علينا افكار جديدة',
                    'Tips to stay healthy and fit', 'assets/image5.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String subtitle, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        width: double.infinity, // Make the container take up all available width
        height: 100, // Fixed height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.5), // Overlay color
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   mainAxisAlignment: MainAxisAlignment.end,
            // children: [
             child: Align(
              alignment: Alignment.topRight,
             child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
             ),
              // SizedBox(height: 4),
              // Text(
              //   subtitle,
              //   style: TextStyle(
              //     fontFamily: 'Amiri',
              //     fontSize: 14,
              //     color: Colors.white,
              //   ),
              // ),
            // ],
          // ),
        ),
      ),
    );
  }
}