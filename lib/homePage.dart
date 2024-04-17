// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cytc/ImageDetailPage.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> hotTopics = [
    {"image": "assets/welcome.jpg", "text": "Topic"},
    {"image": "assets/welcome.jpg", "text": "Topic 2"},
    {"image": "assets/welcome.jpg", "text": "Topic 3"},
    // Add more topics as needed.
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _scrollLeft() {
    _scrollController.animateTo(_scrollController.offset - 150,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void _scrollRight() {
    _scrollController.animateTo(_scrollController.offset + 150,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  ' مركز تدريب الشباب المجتمعي',
                  style: TextStyle(fontSize: 20, color: Color(0xFF9BCB3D)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/Logo.png'),
              backgroundColor: Colors.transparent,
              radius: 20.0,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeWidget(scrollController: _scrollController, hotTopics: hotTopics, scrollLeft: _scrollLeft, scrollRight: _scrollRight),
          ProfileWidget(),
          // Add more widgets for navigation items if needed.
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'الملف الشخصي',
          ),
          // Add more BottomNavigationBarItem as needed.
        ],
        selectedItemColor: Color(0xFFF29F3D),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<Map<String, String>> hotTopics;
  final VoidCallback scrollLeft;
  final VoidCallback scrollRight;

  const HomeWidget({
    required this.scrollController,
    required this.hotTopics,
    required this.scrollLeft,
    required this.scrollRight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the right
      children: [
        SizedBox(height: 20), // Add space between text and images
        SizedBox(
          height: 200, // Adjust height to fit your needs
          child: Stack(
            children: [
              GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    scrollLeft();
                  } else if (details.primaryVelocity! < 0) {
                    scrollRight();
                  }
                },
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  itemCount: hotTopics.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160, // Adjust width to fit your needs
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              hotTopics[index]["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            hotTopics[index]["text"]!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: scrollLeft,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onPressed: scrollRight,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Text('محتوى الصفحة الرئيسية'),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('محتوى الصفحة الشخصية'));
  }
}