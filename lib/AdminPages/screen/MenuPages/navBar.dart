// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cytc/AdminPages/Home/AdminHome.dart';
// import 'package:cytc/AdminPages/screen/MenuPages/posts/Adminviewpost.dart';
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

// class _AdminBarState extends State<AdminBar> {
//   late int _selectedIndex;
//   TextEditingController textEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.initialIndex;
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return CalendarPage(userId: widget.userId);
//       case 1:
//         // return ChatPage(userId: widget.userId);
//       case 2:
//         return UserPostsPage(userId: widget.userId);
//       case 3:
//         // return Activities(userId: widget.userId);
//       case 4:
//         return AdminHomePage(userId: widget.userId,  child: Text(''),);
//       case 5:
//         return universityTrainingPage(userId: widget.userId, userRole: widget.userRole);
//       case 6:
//         return SuggestionsPage(userId: widget.userId, userRole: widget.userRole);
//       case 7:
//         return LoginPage(userId: widget.userId);
//       case 8:
//         return Adminviewpost(userId: widget.userId);
//       case 9:
//         // return Activities(userId: widget.userId);
//       default:
//         return AdminHomePage(userId: widget.userId, child: Text(''),);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           _buildDrawer(), // Always visible drawer on the left side
//           Expanded(
//             child: Column(
//               children: [
//                 Card(
//                   color: Colors.white,
//                   elevation: 0,
//                   margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Container(
//                     color: Colors.transparent,
//                     padding: EdgeInsets.symmetric(horizontal: 11, vertical: 0.0),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//                           child: Container(
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               color: Color(0xFF071533).withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(8.0), // Circular edges
//                             ),
//                             child: IconButton(
//                               icon: Icon(Icons.notifications, color: Color(0xFF071533), size: 15),
//                               onPressed: () {
//                                 // Handle notification click
//                               },
//                               padding: EdgeInsets.zero,
//                               constraints: BoxConstraints(),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Container(
//                             height: 20,
//                             margin: EdgeInsets.only(right: 500),
//                             padding: EdgeInsets.only(right: 7),
//                             decoration: BoxDecoration(
//                               color: Color(0xFF071533).withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(7), // Circular edges
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: TextField(
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(fontSize: 11),
//                                     controller: textEditingController,
//                                     cursorColor: Color(0xFF071533),
//                                     decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.only(bottom: 15),
//                                       hintText: '...ابحث',
//                                       hintStyle: TextStyle(color: Color(0xFF071533), fontFamily: 'Amiri', fontSize: 11),
//                                       border: InputBorder.none,
//                                     ),
//                                   ),
//                                 ),
//                                 IconButton(
//                                   padding: EdgeInsets.only(bottom: 0.75),
//                                   icon: Icon(Icons.search, color: Color(0xFF071533), size: 15,),
//                                   onPressed: () {
//                                     // Handle search icon click
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Image.asset('assets/Logo.png', width: 52.5, height: 52.5),
//                       ],
//                     ),
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
//     return Card(
//       margin: EdgeInsets.all(6.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(11.25),
//       ),
//       child: Container(
//         width: 187.5, // Adjust the width as needed
//         decoration: BoxDecoration(
//           color: Color(0xFF071533) ,  //.withOpacity(0.6),
//           borderRadius: BorderRadius.circular(11.25), // Circular edges
//         ),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(top: 30, bottom: 15),
//               decoration: BoxDecoration(
//                 color: Color(0xFF071533), //.withOpacity(0.6),
//                 borderRadius: BorderRadius.circular(11.25), // Circular edges
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'مركز تدريب الشباب المجتمعي \n التابع للاغاثة الطبية',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Amiri'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ListTile(
//               onTap: () => _onItemTapped(4),
//               title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
//               trailing: Icon(Icons.home, color: Colors.white, size: 15),
//             ),
//             ListTile(
//               onTap: () => _onItemTapped(5),
//               title: Text('طلبات التدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
//               trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Colors.white, size: 15),
//             ),
//             ListTile(
//               onTap: () => _onItemTapped(6),
//               title: Text('اقتراحات وافكار المستخدمين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
//               trailing: Icon(LineAwesomeIcons.comment_dots, color: Colors.white, size: 15),
//             ),
//             ListTile(
//               onTap: () => _onItemTapped(8),
//               title: Text('الانجازات', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
//               trailing: Icon(Icons.star, color: Colors.white, size: 15),
//             ),
//             ListTile(
//               onTap: () => _onItemTapped(1),
//               title: Text('الرسائل', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
//               trailing: Icon(Icons.contact_mail, color: Colors.white, size: 15),
//             ),
//             ListTile(
//               onTap: () => _onItemTapped(9),
//               title: Text('الانشطة', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
//               trailing: Icon(Icons.group_add, color: Colors.white, size: 15),
//             ),
//             ListTile(
//               onTap: () => _onItemTapped(7),
//               title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
//               trailing: Icon(Icons.logout, color: Colors.white, size: 15),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/AdminPages/Home/AdminHome.dart';
import 'package:cytc/AdminPages/screen/MenuPages/chat/ListOfUsers.dart';
import 'package:cytc/AdminPages/screen/MenuPages/posts/Adminviewpost.dart';
import 'package:cytc/AdminPages/screen/MenuPages/Activities/suggestion/ViewSuggessions.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/activities_main.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/calender/calender.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/chat/chat.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'Activities/University/viewTrainingRequests.dart';
import 'Activities/activities.dart';

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
        return ListOfUsers(userId: widget.userId, userRole: widget.userRole);
      case 2:
        return UserPostsPage(userId: widget.userId);
      case 3:
        // return Activities(userId: widget.userId);
      case 4:
        return AdminHomePage(userId: widget.userId,  child: Text(''),);
      case 5:
        return ViewTrainingRequestsPage();
      case 6:
        return ViewSuggestionsPage();
      case 7:
        return LoginPage(userId: widget.userId);
      case 8:
        return Adminviewpost(userId: widget.userId);
      case 9:
        return AdminActivities(userId: widget.userId, userRole: widget.userRole,);
      default:
        return AdminHomePage(userId: widget.userId, child: Text(''),);
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
                  color: Colors.white,
                  elevation: 0,
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 0.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color(0xFF071533).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.0), // Circular edges
                            ),
                            child: IconButton(
                              icon: Icon(Icons.notifications, color: Color(0xFF071533), size: 15),
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
                            height: 20,
                            margin: EdgeInsets.only(right: 500),
                            padding: EdgeInsets.only(right: 7),
                            decoration: BoxDecoration(
                              color: Color(0xFF071533).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(7), // Circular edges
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 11),
                                    controller: textEditingController,
                                    cursorColor: Color(0xFF071533),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 15),
                                      hintText: '...ابحث',
                                      hintStyle: TextStyle(color: Color(0xFF071533), fontFamily: 'Amiri', fontSize: 11),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.only(bottom: 0.75),
                                  icon: Icon(Icons.search, color: Color(0xFF071533), size: 15,),
                                  onPressed: () {
                                    // Handle search icon click
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image.asset('assets/Logo.png', width: 52.5, height: 52.5),
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
      margin: EdgeInsets.all(6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.25),
      ),
      child: Container(
        width: 187.5, // Adjust the width as needed
        decoration: BoxDecoration(
          color: Color(0xFF071533) ,  //.withOpacity(0.6),
          borderRadius: BorderRadius.circular(11.25), // Circular edges
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 15),
              decoration: BoxDecoration(
                color: Color(0xFF071533), //.withOpacity(0.6),
                borderRadius: BorderRadius.circular(11.25), // Circular edges
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'مركز تدريب الشباب المجتمعي \n التابع للاغاثة الطبية',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Amiri'),
                    ),
                  ],
                ),
              ),
            ),
            _buildDrawerItem(Icons.home, 'الرئيسية', 4),
            _buildDrawerItem(LineAwesomeIcons.graduation_cap_solid, 'طلبات التدريب للخريجين', 5),
            _buildDrawerItem(LineAwesomeIcons.comment_dots, 'اقتراحات وافكار المستخدمين', 6),
            _buildDrawerItem(Icons.star, 'الانجازات', 8),
            _buildDrawerItem(Icons.contact_mail, 'الرسائل', 1),
            _buildDrawerItem(Icons.group_add, 'الانشطة', 9),
            _buildDrawerItem(Icons.logout, 'تسجيل خروج', 7),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    bool isSelected = _selectedIndex == index;
    return ListTile(
      onTap: () => _onItemTapped(index),
      title: Text(title, textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 11, color: Colors.white)),
      trailing: Icon(icon, color: isSelected ? Color(0xFFffe145) : Colors.white, size: 15),
    );
  }
}
