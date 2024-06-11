import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'events_details(3).dart';

class EventsList extends StatefulWidget {
  final String category;
  final String apiUrl;

  const EventsList({super.key, required this.category, required this.apiUrl});

  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  TextEditingController textEditingController = TextEditingController();
  List events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final response = await http.get(Uri.parse(widget.apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        events = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load events');
    }
  }

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
                    Color(0xFFf3c344),
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
                              Navigator.pop(context);
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
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return _buildListItem(events[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> event) {
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
                event['name'],
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetails(event: event),
            ),
          );
        },
      ),
    );
  }
}
