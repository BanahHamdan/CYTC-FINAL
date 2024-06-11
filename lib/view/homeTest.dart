// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeTest(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeTest extends StatefulWidget {
  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  int _selectedIndex = 2; // Default selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.person, color: Colors.grey),
              onPressed: () {
                // Navigate to profile page
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.grey),
              onPressed: () {
                // Navigate to cart page
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.grey),
            onPressed: () {
              // Open menu
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {
              // Show notifications
            },
          ),
        ],
        title: TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: 'ابحث...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.refresh,
                    size: 40,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'إعادة التحميل',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf3c344),
                    Color(0xFFffe145),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ساهم بعطائك',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                  Text(
                    'وقف إحسان\nصدقة جارية يدوم نفعها، ويتضاعف أجرها',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Amiri',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'فرص التبرع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Amiri',
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'تعذر عرض فرص التبرع',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                  SizedBox(height: 10),
                  Icon(
                    Icons.refresh,
                    size: 40,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'إعادة التحميل',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'الرئيسية',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.auto_awesome_mosaic),
      //       label: 'وقف إحسان',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.attach_money),
      //       label: 'التبرع السريع',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'فرص التبرع',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.campaign),
      //       label: 'برامجنا',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.teal,
      //   unselectedItemColor: Colors.grey,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
