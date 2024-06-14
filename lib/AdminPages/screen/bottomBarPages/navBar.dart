// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// import 'package:cytc/AdminPages/Home/AdminHome.dart';
// import 'package:cytc/AdminPages/screen/bottomBarPages/posts/Adminviewpost.dart';
// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/activities_main.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/calender/calender.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/chat/chat.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/posts/posts.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class AdminBar extends StatefulWidget {
//   final String userId;
//   final String userRole;
//   final int initialIndex;

//   const AdminBar({Key? key, required this.userId, required this.userRole, this.initialIndex = 4}) : super(key: key);

//   @override
//   State<AdminBar> createState() => _AdminBarState();
// }

// class _AdminBarState extends State<AdminBar> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   late int _selectedIndex;
//   TextEditingController textEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.initialIndex;
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return CalendarPage();
//       case 1:
//         return ChatPage(userId: widget.userId);
//       case 2:
//         return UserPostsPage(userId: widget.userId);
//       case 3:
//         return Activities();
//       case 4:
//         return AdminHomePage(userId: '',);
//       default:
//         return AdminHomePage(userId: '',);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           _buildDrawer(), // Fixed drawer on the left side
//           Expanded(
//             child: Column(
//               children: [
//                 Container(
//                   color: Colors.transparent,
//                   padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                   child: Row(
//                     children: [
//                        Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF071533).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.notifications, color: Color(0xFF071533), size: 27),
//                       onPressed: () {
//                         // Handle notification click
//                       },
//                       padding: EdgeInsets.zero,
//                       constraints: BoxConstraints(),
//                     ),
//                   ),
//                 ),
//                       // Image.asset('assets/Logo.png', width: 40, height: 40),
//                       Expanded(
//                         child: Container(
//                           height: 35,
//                           margin: EdgeInsets.symmetric(horizontal: 8.0),
//                           padding: EdgeInsets.only(right: 10, left: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: TextField(
//                             textAlign: TextAlign.right,
//                             controller: textEditingController,
//                             cursorColor: Color(0xFF071533),
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.only(top: 1),
//                               hintText: '...ابحث',
//                               hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Amiri'),
//                               prefixIcon: Icon(Icons.search, color: Color(0xFF071533)),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
                     
//                       Image.asset('assets/Logo.png', width: 80, height: 80),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: _getPage(_selectedIndex),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDrawer() {
//     return Container(
//       width: 250, // Adjust the width as needed
//       color: Color(0xFF1A1A2E),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 40, bottom: 20),
//             decoration: BoxDecoration(
//               color: Color(0xFF1A1A2E),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'مركز تدريب الشباب المجتمعي \n التابع للاغاثة الطبية',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Amiri'),
//                       ),
//                   // SizedBox(width: 16.0),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
//                   //   },
//                   //   child: CircleAvatar(
//                   //     radius: 30,
//                   //     backgroundImage: AssetImage('assets/banah.jpg'), // Replace with your image path
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminBar(initialIndex: 4, userId: widget.userId, userRole: widget.userRole))),
//             title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
//             trailing: Icon(Icons.home, color: Colors.white),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage())), // Add onTap functionality
//             title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
//             trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Colors.white),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage())),  // Add onTap functionality
//             title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
//             trailing: Icon(LineAwesomeIcons.comment_dots, color: Colors.white),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())), // Add onTap functionality for logout
//             title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
//             trailing: Icon(Icons.logout, color: Colors.white),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Adminviewpost(userId: '',))), // Add onTap functionality
//             title: Text('انجازاتنا', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
//             trailing: Icon(Icons.star, color: Colors.white),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(userId: '',))), // Add onTap functionality
//             title: Text('تواصل معنا', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
//             trailing: Icon(Icons.contact_mail, color: Colors.white),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Activities())), // Add onTap functionality
//             title: Text('انضم لنا', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
//             trailing: Icon(Icons.group_add, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/AdminPages/Home/AdminHome.dart';
import 'package:cytc/AdminPages/screen/bottomBarPages/posts/Adminviewpost.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/activities_main.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/calender/calender.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/chat/chat.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AdminBar extends StatefulWidget {
  final String userId;
  final String userRole;
  final int initialIndex;

  const AdminBar({Key? key, required this.userId, required this.userRole, this.initialIndex = 4}) : super(key: key);

  @override
  State<AdminBar> createState() => _AdminBarState();
}

class _AdminBarState extends State<AdminBar> {
  late int _selectedIndex;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return CalendarPage(userId: widget.userId);
      case 1:
        // return ChatPage(userId: widget.userId);
      case 2:
        return UserPostsPage(userId: widget.userId);
      case 3:
        // return Activities(userId: widget.userId);
      case 4:
        return AdminHomePage(userId: widget.userId,);
      case 5:
        return universityTrainingPage(userId: widget.userId, userRole: widget.userRole);
      case 6:
        return SuggestionsPage(userId: widget.userId, userRole: widget.userRole);
      case 7:
        return LoginPage(userId: widget.userId);
      case 8:
        return Adminviewpost(userId: widget.userId,);
      case 9:
        // return Activities(userId: widget.userId);
      default:
        return AdminHomePage(userId: widget.userId,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildDrawer(), // Always visible drawer on the left side
          Expanded(
            child: Column(
              children: [
                Card(
                  // color: Color(0xFF071533).withOpacity(0.3),
                  color: Colors.white,
                  elevation: 0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFF071533).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10), // Circular edges
                            ),
                            child: IconButton(
                              icon: Icon(Icons.notifications, color: Color(0xFF071533), size: 27),
                              onPressed: () {
                                // Handle notification click
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            // width: 50,
                            margin: EdgeInsets.only(right: 800),
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF071533).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10), // Circular edges
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    textAlign: TextAlign.right,
                                    controller: textEditingController,
                                    cursorColor: Color(0xFF071533),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 12),
                                      hintText: '...ابحث',
                                      hintStyle: TextStyle(color: Color(0xFF071533), fontFamily: 'Amiri'),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.only(bottom: 1),
                                  icon: Icon(Icons.search, color: Color(0xFF071533)),
                                  onPressed: () {
                                    // Handle search icon click
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image.asset('assets/Logo.png', width: 70, height: 70),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _getPage(_selectedIndex),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 250, // Adjust the width as needed
        decoration: BoxDecoration(
          color: Color(0xFF071533).withOpacity(0.6),
          borderRadius: BorderRadius.circular(15), // Circular edges
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              decoration: BoxDecoration(
                color: Color(0xFF071533).withOpacity(0.6),
                borderRadius: BorderRadius.circular(15), // Circular edges
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'مركز تدريب الشباب المجتمعي \n التابع للاغاثة الطبية',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Amiri'),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () => _onItemTapped(4),
              title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
              trailing: Icon(Icons.home, color: Colors.white),
            ),
            ListTile(
              onTap: () => _onItemTapped(5),
              title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
              trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Colors.white),
            ),
            ListTile(
              onTap: () => _onItemTapped(6),
              title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
              trailing: Icon(LineAwesomeIcons.comment_dots, color: Colors.white),
            ),
            ListTile(
              onTap: () => _onItemTapped(7),
              title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
              trailing: Icon(Icons.logout, color: Colors.white),
            ),
            ListTile(
              onTap: () => _onItemTapped(8),
              title: Text('انجازاتنا', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
              trailing: Icon(Icons.star, color: Colors.white),
            ),
            ListTile(
              onTap: () => _onItemTapped(1),
              title: Text('تواصل معنا', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
              trailing: Icon(Icons.contact_mail, color: Colors.white),
            ),
            ListTile(
              onTap: () => _onItemTapped(9),
              title: Text('انضم لنا', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Colors.white)),
              trailing: Icon(Icons.group_add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
