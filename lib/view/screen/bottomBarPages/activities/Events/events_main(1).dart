import 'package:cytc/view/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'events_list(2).dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
                    Color(0xFFFBE66F), //0xFFf3c344
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
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              // Navigate back or to home page
                            },
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
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {
                              // Add functionality for notification icon
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: 60),
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
                                // Add search functionality
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
                _buildListItem('دورات', Icons.add,
                    'http://localhost:9999/event/interest/دورات'),
                _buildListItem('ورش عمل ولقاءات توعوية', Icons.work,
                    'http://localhost:9999/event/interest/ورش'),
                _buildListItem('مخيمات صيفية', Icons.emoji_nature,
                    'http://localhost:9999/event/interest/مخيمات'),
                _buildListItem('مبادرات شبابية', Icons.volunteer_activism,
                    'http://localhost:9999/event/interest/مبادرات'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon, String url) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 15),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE0E0E0),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(icon, color: Color(0xFF071533)),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventsList(category: title, apiUrl: url),
            ),
          );
        },
      ),
    );
  }
}
