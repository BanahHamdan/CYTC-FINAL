// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/view/screen/mainPages/Events/events_details(3).dart';
import 'package:cytc/view/screen/mainPages/Events/events_main(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eventsList extends StatefulWidget {
  const eventsList({super.key});

  @override
  _eventsListState createState() => _eventsListState();
}

class _eventsListState extends State<eventsList> {
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F7F2),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf3c344), //0xFFf3c344
                    Color(0xFFffe145),
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
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => eventsPage()),
                                  );
                                },
                              ),
                              // SizedBox(width: 0),
                              IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // Add functionality for burger menu
                                },
                              ),
                            ],
                          ),
                          Text(
                            'شارك معنا وانضم الى عائلتنا',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Amiri',
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Add functionality for notification icon
                                },
                                padding: EdgeInsets.zero,
                                icon: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF071533),
                                  ),
                                  child: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  // Add functionality to navigate to profile page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right:
                                          16.0), // Adjust the value as needed
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage('assets/banah.jpg'),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 30,
                        margin: EdgeInsets.fromLTRB(120, 0, 120, 0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 247, 250, 252)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          textAlign: TextAlign.right,
                          controller: textEditingController,
                          cursorColor: Colors.white.withOpacity(0.9),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 0),
                            hintText: '... ابحث',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontFamily: 'Amiri',
                              fontSize: 15,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white.withOpacity(0.9),
                                size: 18,
                              ),
                              onPressed: () {
                                //search func
                              },
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildListItem('دورة اسعاف اولي'),
                _buildListItem('دورة اسعاف اولي متقدم'),
                _buildListItem('دورة القيادة المجتمعية'),
                _buildListItem('تدريب التأهب للطوارئ'),
                _buildListItem('دورة تعليم الدبكة الفلسطينية'),
                _buildListItem('دورة الصحافة والاعلام'),
                _buildListItem('دورة لغة انجليزية للمبتدئين'),
              ],
            ),
          ),
          // BottomNavigationBar(
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'الرئيسية',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.favorite),
          //       label: 'وقفا إحسان',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.add_circle_outline),
          //       label: 'التبرع السريع',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.grid_view),
          //       label: 'فرص التبرع',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.apps),
          //       label: 'برامجنا',
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        // Arrow icon on the left side
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 15),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text aligned to the right
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
            SizedBox(width: 10), // Space between icon and text
            // Icon with grey circle background
            // Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Color(0xFFE0E0E0),
            //   ),
            //   padding: EdgeInsets.all(
            //       8), // Adjust padding to make the circle bigger or smaller
            //   child: Icon(icon, color: Color(0xFF071533)),
            // ),
          ],
        ),
        onTap: () {
          // Navigate to different pages based on the title clicked
          // For example:
          if (title == 'دورة اسعاف اولي') {
            // Navigate to the corresponding page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JoinUs()),
            );
          }
          //else if (title == 'ورش عمل ولقاءات توعوية') {
          //   // Navigate to the corresponding page
          // } else if (title == 'مخيمات صيفية') {
          //   // Navigate to the corresponding page
          // } else if (title == 'مبادرات شبابية') {
          //   // Navigate to the corresponding page
          // }
        },
      ),
    );
  }
}
