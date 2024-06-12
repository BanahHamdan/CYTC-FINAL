// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/calender/calender.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/chat/chat.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'activities/activities_main.dart'; // Import the package

class bar extends StatefulWidget {
  final String userId;
  final String userRole;
  final int initialIndex;

  const bar({Key? key, required this.userId, required this.userRole, this.initialIndex = 4}) : super(key: key);

  @override
  State<bar> createState() => _BarState();
}

class _BarState extends State<bar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late int _selectedIndex;
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleSearchBar() {
    setState(() {
      isSearchBarVisible = !isSearchBarVisible;
      isSearchBarVisible ? _animationController.forward() : _animationController.reverse();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return CalendarPage();
      case 1:
        return ChatPage(userId: widget.userId);
      case 2:
        return UserPostsPage(userId: widget.userId);
      case 3:
        return Activities();
      case 4:
        return HomeTestGrey(userId: '',);
      default:
        return HomeTestGrey(userId: '',);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 100,
        leading: Builder(
          builder: (BuildContext context) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Color(0xFF071533).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Color(0xFF071533), size: 20),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Color(0xFF071533).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notifications, color: Color(0xFF071533), size: 20),
                      onPressed: () {
                        // Handle notification click
                      },
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFF071533)),
            onPressed: _toggleSearchBar,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/Logo.png', width: 40, height: 40),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          _getPage(_selectedIndex),
          if (isSearchBarVisible)
            FadeTransition(
              opacity: _animation,
              child: Material(
                color: Color(0xFF071533).withOpacity(0.5),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
                    Center(
                      child: Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          textAlign: TextAlign.right,
                          controller: textEditingController,
                          cursorColor: Color(0xFF071533),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 1),
                            hintText: '...ابحث',
                            hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Amiri'),
                            prefixIcon: Icon(Icons.search, color: Color(0xFF071533)),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear, color: Color(0xFF071533), size: 20),
                              onPressed: _toggleSearchBar,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
                        style: TextStyle(color: Color(0xFF071533), fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Amiri'),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/banah.jpg'), // Replace with your image path
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(initialIndex: 4, userId: widget.userId, userRole: widget.userRole))),
            title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: ()  => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage())), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage())),  // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())), // Add onTap functionality for logout
            title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.calendar_alt), label: 'التقويم'),
        BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.comment_dots_solid), label: 'تواصل معنا'),
        BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.trophy_solid), label: 'انجازاتنا'),
        BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.sign_in_alt_solid), label: 'انضم لنا'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFffe145),
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}
