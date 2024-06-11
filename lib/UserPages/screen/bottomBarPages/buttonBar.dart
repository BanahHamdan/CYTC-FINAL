// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
//ready
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/calender/calender.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/chat/chat.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'activities/activities_main.dart'; // Import the package


class bar extends StatefulWidget {
  final  userId;
  final  userRole;
  const bar({super.key, required this.userId, required this.userRole}); //  const bar({super.key, Key? key, required this.userId, required this.userRole});

  @override
  State<bar> createState() => _barState();
}

class _barState extends State<bar> {
  // late String? userId;
  // late String? userRole;
  int _selectedIndex = 4;
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

@override
  void initState() {
    super.initState();
    // userId = userId; 
    // userRole = userRole;
    print("*****************");
    print("userId "+ widget.userId);
    print("userRole "+ widget.userRole);
    print("*****************");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 120,
        leading: Row(
          children: [
            Container(
              margin: EdgeInsets.all(4.0),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF071533).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                icon: Icon(Icons.menu, color: Color(0xFF071533), size: 20,),
                onPressed: () {
                  // Add menu action here
                },
                padding: EdgeInsets.all(4.0), // Reduced padding for the icon
              ),
            ),
            Container(
              margin: EdgeInsets.all(4.0),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF071533).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                icon: Icon(Icons.notifications, color: Color(0xFF071533), size: 20,),
                onPressed: () {
                  // Add notifications action here
                },
                padding: EdgeInsets.all(4.0), // Reduced padding for the icon
              ),
            ),
          ],
        ),
        actions: [
          // Container(
          //   width: 30,
          //     height: 30,
          //   margin: EdgeInsets.all(4.0),
          //   decoration: BoxDecoration(
          //     color: Color(0xFF071533).withOpacity(0.1),
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
            // child: 
            IconButton(
              icon: Icon(Icons.search, color: Color(0xFF071533), size: 20,),
              onPressed: () {
                // Add search action here
              },
              padding: EdgeInsets.all(4.0), // Reduced padding for the icon
            ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/Logo.png', // Add your image asset here
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      
      body: _getPage(_selectedIndex),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          textTheme: TextTheme(
            bodySmall: TextStyle(fontFamily: 'Amiri', color: Colors.grey), // Unselected labels
            bodyMedium: TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145)), // Selected labels
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.calendar_alt), // Use Line Awesome icon
              label: 'التقويم',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.comment_dots_solid), // Use Line Awesome icon
              label: 'تواصل معنا',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.trophy_solid), // Use Line Awesome icon
              label: 'انجازاتنا',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.sign_in_alt_solid), // Use Line Awesome icon
              label: 'تفاعل معنا',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Use Line Awesome icon
              label: 'الرئيسية',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFffe145),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return CalendarPage();
      case 1:
        return ChatPage(userId: widget.userId);
      case 2: 
        return UserPostsPage(userId: widget.userId);
      case 3:   //activities 
        return Activities();
      case 4:
        return HomeTestGrey(userId: '',);
        // return homePage(userId : widget.userId , userRole : widget.userRole);
      default:
        return HomeTestGrey(userId: '',);
        // return homePage(userId : widget.userId , userRole : widget.userRole);
    }
  }
}
