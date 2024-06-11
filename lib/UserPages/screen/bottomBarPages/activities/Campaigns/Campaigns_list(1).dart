// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Campaigns_details(2).dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  _CampaignPageState createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();
  List campaigns = [];

  @override
  void initState() {
    super.initState();
    fetchCampaigns();
  }

  Future<void> fetchCampaigns() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/event/interest/حملات'));
    if (response.statusCode == 200) {
      setState(() {
        campaigns = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load campaigns');
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
                                  // Add functionality here if needed
                                },
                              ),
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
                            'تعرف على حملاتنا الحالية',
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
                                  padding: const EdgeInsets.only(right: 16.0),
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
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: campaigns.length,
              itemBuilder: (context, index) {
                return _buildListItem(campaigns[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> campaign) {
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
                campaign['name'],
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
              builder: (context) => CampaignDetails(campaign: campaign),
            ),
          );
        },
      ),
    );
  }
}
