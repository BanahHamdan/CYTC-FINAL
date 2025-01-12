// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
// import 'package:cytc/UserPages/Home/notification.dart';
// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/calender/calender.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/chat/chat.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/posts/posts.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'activities/activities_main.dart'; // Import the package

// class bar extends StatefulWidget {
//   final String userId;
//   final String userRole;
//   final int initialIndex;

//   const bar({Key? key, required this.userId, required this.userRole, this.initialIndex = 4}) : super(key: key);

//   @override
//   State<bar> createState() => _BarState();
// }

// class _BarState extends State<bar> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   late int _selectedIndex;
//   bool isSearchBarVisible = false;
//   TextEditingController textEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.initialIndex;
//     _getPage(_selectedIndex);
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   void _toggleSearchBar() {
//     setState(() {
//       isSearchBarVisible = !isSearchBarVisible;
//       isSearchBarVisible ? _animationController.forward() : _animationController.reverse();
//     });
//   } 

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

// Widget _getPage(int index) {
//   switch (index) {
//     case 0:
//       return CalendarPage(userId: widget.userId,);
//     case 1:
//       return ChatPage(userId: widget.userId, userRole: widget.userRole,);
//     case 2:
//       return UserPostsPage(userId: widget.userId);
//     case 3:
//       return Activities(userId: widget.userId, userRole: widget.userRole,);
//     case 4:
//       return HomeTest(userId: widget.userId, userRole: widget.userRole,);
//     default:
//        return HomeTest(userId: widget.userId, userRole: widget.userRole,); 
//   }
// }


//   // Widget _getPage(int index) {
//   //   switch (index) {
//   //     case 0:
//   //       return CalendarPage(userId: widget.userId,);
//   //     case 1:
//   //       return ChatPage(userId: widget.userId, userRole: widget.userRole,);
//   //     case 2:
//   //       return UserPostsPage(userId: widget.userId);
//   //     case 3:
//   //       return Activities(userId: widget.userId, userRole: widget.userRole,);
//   //     case 4:
//   //       return HomeTestGrey(userId: widget.userId, userRole: widget.userRole,);
//   //     default:
//   //       return HomeTestGrey(userId: widget.userId, userRole: widget.userRole,);
//   //   }
//   // }

//   bool isMobile(BuildContext context) {
//     return MediaQuery.of(context).size.width < 700;
//   }

// Future<void> _launchFacebookPage() async {
//     const url = 'https://www.facebook.com/cytc.nablus'; // Replace with your Facebook page URL
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leadingWidth: 100,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
//                   child: Container(
//                     width: 27,
//                     height: 27,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF071533).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.menu, color: Color(0xFF071533), size: 20),
//                       onPressed: () {
//                         Scaffold.of(context).openDrawer();
//                       },
//                       padding: EdgeInsets.zero,
//                       constraints: BoxConstraints(),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
//                   child: Container(
//                     width: 27,
//                     height: 27,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF071533).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.notifications, color: Color(0xFF071533), size: 20),
//                       onPressed: () {
//                       Navigator.push(
//                         context, 
//                         MaterialPageRoute(
//                           builder: (context) => NotificationPage(userId: widget.userId,)
//                           )
//                           );
//                       },
//                       padding: EdgeInsets.zero,
//                       constraints: BoxConstraints(),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Color(0xFF071533)),
//             onPressed: _toggleSearchBar,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Image.asset('assets/Logo.png', width: 40, height: 40),
//           ),
//         ],
//       ),
//       drawer: _buildDrawer(),
//       body: Row(
//         children: [
//           if (!isMobile(context)) _buildSideNavigationBar(), // Add this line
//           Expanded(
//             child: Stack(
//               children: [
//                 _getPage(_selectedIndex),
//                 if (isSearchBarVisible)
//                   FadeTransition(
//                     opacity: _animation,
//                     child: Material(
//                       color: Color(0xFF071533).withOpacity(0.5),
//                       child: Column(
//                         children: [
//                           SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
//                           Center(
//                             child: Container(
//                               height: 35,
//                               width: MediaQuery.of(context).size.width * 0.8,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: TextField(
//                                 textAlign: TextAlign.right,
//                                 controller: textEditingController,
//                                 cursorColor: Color(0xFF071533),
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.only(top: 1),
//                                   hintText: '...ابحث',
//                                   hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Amiri'),
//                                   prefixIcon: Icon(Icons.search, color: Color(0xFF071533)),
//                                   border: InputBorder.none,
//                                   suffixIcon: IconButton(
//                                     icon: Icon(Icons.clear, color: Color(0xFF071533), size: 20),
//                                     onPressed: _toggleSearchBar,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: isMobile(context) ? _buildBottomNavigationBar() : null,
//     );
//   }

//   Drawer _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 40, bottom: 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'الملف الشخصي',
//                         style: TextStyle(color: Color(0xFF071533), fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Amiri'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 16.0),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId, userRole: widget.userRole,)));
//                     },
//                     child: Image.asset(
//                       // ("assets/gif/profile.gif"), // Replace with your image path
//                       ("assets/homePage/user2.png"),
//                       width: 50,
//                       height: 50,
//                     ),
//                     // child: CircleAvatar(
//                     //   radius: 30,
//                     //   backgroundImage: AssetImage('assets/gif/profile.gif'), // Replace with your image path
//                     // ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(initialIndex: 4, userId: widget.userId, userRole: widget.userRole))),
//             title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(Icons.home, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: ()  => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage(userId: widget.userId, userRole: widget.userRole))), // Add onTap functionality
//             title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage(userId: widget.userId, userRole: widget.userRole))),  // Add onTap functionality
//             title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: _launchFacebookPage, // Launch the Facebook page URL
//             title: Text('صفحتنا على الفيسبوك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(Icons.facebook, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId))), // Add onTap functionality for logout
//             title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
//           ),
//         ],
//       ),
//     ); 
//   }

//   Widget _buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.calendar_alt), label: 'التقويم'),
//         BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.comment_dots_solid), label: 'تواصل معنا'),
//         BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.trophy_solid), label: 'انجازاتنا'),
//         BottomNavigationBarItem(icon: Icon(Icons.group_add), label: 'انضم لنا'),
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Color(0xFFffe145),
//       unselectedItemColor: Colors.grey,
//       onTap: _onItemTapped,
//     );
//   }

//   Widget _buildSideNavigationBar() {
//     return Container(
//       width: 60,
//       color: Color(0xFF071533).withOpacity(0.1),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.home, color: Color(0xFF071533)),
//             onPressed: () => _onItemTapped(4),
//           ),
//           IconButton(
//             icon: Icon(Icons.group_add, color: Color(0xFF071533)),
//             onPressed: () => _onItemTapped(3),
//           ),
//           IconButton(
//             icon: Icon(LineAwesomeIcons.trophy_solid, color: Color(0xFF071533)),
//             onPressed: () => _onItemTapped(2),
//           ),
//           IconButton(
//             icon: Icon(LineAwesomeIcons.comment_dots_solid, color: Color(0xFF071533)),
//             onPressed: () => _onItemTapped(1),
//           ),IconButton(
//             icon: Icon(LineAwesomeIcons.calendar_alt, color: Color(0xFF071533)),
//             onPressed: () => _onItemTapped(0),
//           ),
//         ],
//       ),
//     );
//   }
  
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:url_launcher/url_launcher.dart';
import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
import 'package:cytc/UserPages/Home/notification.dart';
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
import 'package:http/http.dart' as http;
import 'dart:convert';
////////////////////
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
import 'package:cytc/UserPages/Home/notification.dart';
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
import 'package:http/http.dart' as http;
import 'dart:convert';

class bar extends StatefulWidget {
  final String userId;
  final String userRole;
  final int initialIndex;

  const bar(
      {Key? key,
      required this.userId,
      required this.userRole,
      this.initialIndex = 4})
      : super(key: key);

  @override
  State<bar> createState() => _BarState();
}

class _BarState extends State<bar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late int _selectedIndex;
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();
  int unreadNotificationCount = 0; // Variable to store unread count
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _getPage(_selectedIndex);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _fetchUnreadNotificationCount(); // Fetch unread count on initialization
    _startTimer(); // Start the timer
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _fetchUnreadNotificationCount();
    });
  }

  Future<void> _fetchUnreadNotificationCount() async {
    final response = await http.get(Uri.parse(
        'http://localhost:9999/notification/count-unread/${widget.userId}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        unreadNotificationCount = data['unreadCount'];
      });
    } else {
      // Handle error
      print('Failed to load unread notification count');
    }
  }

  void _toggleSearchBar() {
    setState(() {
      isSearchBarVisible = !isSearchBarVisible;
      isSearchBarVisible
          ? _animationController.forward()
          : _animationController.reverse();
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
        return CalendarPage(
          userId: widget.userId,
        );
      case 1:
        return ChatPage(
          userId: widget.userId,
          userRole: widget.userRole,
        );
      case 2:
        return UserPostsPage(userId: widget.userId);
      case 3:
        return Activities(
          userId: widget.userId,
          userRole: widget.userRole,
        );
      case 4:
        return HomeTest(
          userId: widget.userId,
          userRole: widget.userRole,
        );
      default:
        return HomeTest(
          userId: widget.userId,
          userRole: widget.userRole,
        );
    }
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }

  Future<void> _launchFacebookPage() async {
    const url =
        'https://www.facebook.com/cytc.nablus'; // Replace with your Facebook page URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
                      icon:
                          Icon(Icons.menu, color: Color(0xFF071533), size: 20),
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
                  child: Stack(
                    children: [
                      Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Color(0xFF071533).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.notifications,
                              color: Color(0xFF071533), size: 20),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationPage(
                                          userId: widget.userId,
                                          onNotificationsRead:
                                              _fetchUnreadNotificationCount, // Add the required argument
                                        )));
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        ),
                      ),
                      if (unreadNotificationCount > 0)
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              '$unreadNotificationCount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
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
      body: Row(
        children: [
          if (!isMobile(context)) _buildSideNavigationBar(), // Add this line
          Expanded(
            child: Stack(
              children: [
                _getPage(_selectedIndex),
                if (isSearchBarVisible)
                  FadeTransition(
                    opacity: _animation,
                    child: Material(
                      color: Color(0xFF071533).withOpacity(0.5),
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).padding.top +
                                  kToolbarHeight),
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
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontFamily: 'Amiri'),
                                  prefixIcon: Icon(Icons.search,
                                      color: Color(0xFF071533)),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.clear,
                                        color: Color(0xFF071533), size: 20),
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
          ),
        ],
      ),
      bottomNavigationBar:
          isMobile(context) ? _buildBottomNavigationBar() : null,
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
                        'الملف الشخصي',
                        style: TextStyle(
                            color: Color(0xFF071533),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Amiri'),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    userId: widget.userId,
                                    userRole: widget.userRole,
                                  )));
                    },
                    child: Image.asset(
                      // ("assets/gif/profile.gif"), // Replace with your image path
                      ("assets/homePage/user2.png"),
                      width: 50,
                      height: 50,
                    ),
                    // child: CircleAvatar(
                    //   radius: 30,
                    //   backgroundImage: AssetImage('assets/gif/profile.gif'), // Replace with your image path
                    // ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => bar(
                        initialIndex: 4,
                        userId: widget.userId,
                        userRole: widget.userRole))),
            title: Text('الرئيسية',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => universityTrainingPage(
                        userId: widget.userId,
                        userRole: widget.userRole))), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid,
                color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SuggestionsPage(
                        userId: widget.userId,
                        userRole: widget.userRole))), // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing:
                Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: _launchFacebookPage, // Launch the Facebook page URL
            title: Text('صفحتنا على الفيسبوك',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(Icons.facebook, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(
                        userId: widget
                            .userId))), // Add onTap functionality for logout
            title: Text('تسجيل خروج',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.calendar_alt), label: 'التقويم'),
        BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.comment_dots_solid),
            label: 'تواصل معنا'),
        BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.trophy_solid), label: 'انجازاتنا'),
        BottomNavigationBarItem(icon: Icon(Icons.group_add), label: 'انضم لنا'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFffe145),
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }

  Widget _buildSideNavigationBar() {
    return Container(
      width: 60,
      color: Color(0xFF071533).withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFF071533)),
            onPressed: () => _onItemTapped(4),
          ),
          IconButton(
            icon: Icon(Icons.group_add, color: Color(0xFF071533)),
            onPressed: () => _onItemTapped(3),
          ),
          IconButton(
            icon: Icon(LineAwesomeIcons.trophy_solid, color: Color(0xFF071533)),
            onPressed: () => _onItemTapped(2),
          ),
          IconButton(
            icon: Icon(LineAwesomeIcons.comment_dots_solid,
                color: Color(0xFF071533)),
            onPressed: () => _onItemTapped(1),
          ),
          IconButton(
            icon: Icon(LineAwesomeIcons.calendar_alt, color: Color(0xFF071533)),
            onPressed: () => _onItemTapped(0),
          ),
        ],
      ),
    );
  }
}
