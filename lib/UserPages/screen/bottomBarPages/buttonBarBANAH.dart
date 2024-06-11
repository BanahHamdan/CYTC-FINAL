// // // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// // //ready
// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// // import 'package:cytc/view/homeCircularGrey.dart';
// // import 'package:cytc/view/screen/bottomBarPages/posts.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cytc/view/screen/bottomBarPages/calender.dart';
// // import 'package:cytc/view/screen/bottomBarPages/chat.dart';
// // import 'package:cytc/view/homePage.dart';

// // class bar extends StatefulWidget {

// //   final  userId;
// //   final  userRole;
// //   const bar({super.key, required this.userId, required this.userRole}); //  const bar({super.key, Key? key, required this.userId, required this.userRole});

// //   @override
// //   State<bar> createState() => _barState();
// // }

// // class _barState extends State<bar> {
// //   // late String? userId;
// //   // late String? userRole;
// //   int _selectedIndex = 3;
// //   bool isSearchBarVisible = false;
// //   TextEditingController textEditingController = TextEditingController();
// // @override
// //   void initState() {
// //     super.initState();
// //     // userId = userId;
// //     // userRole = userRole;
// //     print("*****************");
// //     print("userId "+ widget.userId);
// //     print("userRole "+ widget.userRole);
// //     print("*****************");

// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // appBar: AppBar(
// //       //   backgroundColor:
// //       //       Colors.transparent, // Set background color to transparent
// //       //   elevation: 0, // Remove elevation
// //       //   leading: Row(
// //       //     children: [
// //       //       IconButton(
// //       //         icon: Icon(Icons.menu), // Burger menu icon
// //       //         onPressed: () {
// //       //           // Add functionality for burger menu
// //       //         },
// //       //       ),

// //       //       IconButton(
// //       //         onPressed: () {
// //       //           // Add functionality for notification icon
// //       //         },
// //       //         padding: EdgeInsets.zero, // Remove padding around the icon button
// //       //         icon: Container(
// //       //           padding: EdgeInsets.all(4),
// //       //           decoration: BoxDecoration(
// //       //             color:
// //       //                 Color(0xFFEC8F5E), // Notification icon background color
// //       //             shape: BoxShape.circle,
// //       //           ),
// //       //           child: Icon(
// //       //             Icons.notifications, // Notification icon
// //       //             color: Colors.white, // Notification icon color
// //       //             size: 17,
// //       //           ),
// //       //         ),
// //       //       ),

// //       //       // ),
// //       //     ],
// //       //   ),

// //       //   actions: [
// //       //     // Wrap the search icon IconButton with Visibility
// //       //     Visibility(
// //       //       visible:
// //       //           !isSearchBarVisible, // Hide the search icon when the search bar is visible
// //       //       child: IconButton(
// //       //         icon: Icon(Icons.search, color: Colors.white), // Search icon
// //       //         onPressed: () {
// //       //           // Update the state to toggle the visibility of the search bar
// //       //           setState(() {
// //       //             isSearchBarVisible = !isSearchBarVisible;
// //       //           });
// //       //         },
// //       //       ),
// //       //     ),
// //       //     // Add the search bar here with Visibility widget to control its visibility
// //       //     Visibility(
// //       //       visible:
// //       //           isSearchBarVisible, // Control the visibility of the search bar
// //       //       child: Expanded(
// //       //         child: Container(
// //       //           margin: EdgeInsets.fromLTRB(100, 10, 10, 10),
// //       //           decoration: BoxDecoration(
// //       //             color: Colors.white,
// //       //             borderRadius: BorderRadius.circular(50),
// //       //           ),
// //       //           child: TextField(
// //       //             controller:
// //       //                 textEditingController, // Assign the TextEditingController to the TextField
// //       //             cursorColor:
// //       //                 Color(0xFF66BFBF), // Customize the color of the cursor
// //       //             decoration: InputDecoration(
// //       //               hintText: 'Search...',
// //       //               hintStyle: TextStyle(
// //       //                   color: Colors
// //       //                       .grey), // Customize the color of the hint text
// //       //               prefixIcon: Icon(Icons.search,
// //       //                   color: Color(0xFF66BFBF)), // Search icon
// //       //               border: InputBorder.none,
// //       //               suffixIcon: IconButton(
// //       //                 icon: Icon(Icons.clear,
// //       //                     color: Color(
// //       //                         0xFF66BFBF)), // Clear icon to clear the search text
// //       //                 onPressed: () {
// //       //                   setState(() {
// //       //                     // Clear the search text and hide the search bar
// //       //                     isSearchBarVisible = false;
// //       //                     // Clear the text field
// //       //                     // You need to define the TextEditingController for this
// //       //                     // textEditingController.clear();
// //       //                   });
// //       //                 },
// //       //               ),
// //       //             ),
// //       //             // Define a TextEditingController to control the text field
// //       //             // controller: textEditingController,
// //       //             // Add more properties as needed
// //       //             // Add an onTap callback to the search icon to perform a search action
// //       //             onTap: () {
// //       //               // Perform search action here
// //       //               // You can access the search query using the TextEditingController
// //       //               // For example:
// //       //               // String searchQuery = textEditingController.text;
// //       //               // Perform search using the searchQuery
// //       //             },
// //       //           ),
// //       //         ),
// //       //       ),
// //       //     ),

// //       //     GestureDetector(
// //       //       onTap: () {
// //       //         // Add functionality to navigate to profile page
// //       //       },
// //       //       child: Container(
// //       //         margin: EdgeInsets.only(right: 20),
// //       //         width: 35, // Adjust the width as needed
// //       //         height: 35, // Adjust the height as needed
// //       //         decoration: BoxDecoration(
// //       //           shape: BoxShape.circle,
// //       //           border: Border.all(color: Colors.white, width: 2),
// //       //           image: DecorationImage(
// //       //             image: AssetImage('assets/banah.jpg'),
// //       //             // fit: BoxFit.cover,
// //       //           ),
// //       //         ),
// //       //       ),
// //       //     ),
// //       //   ],  
// //       // ),
      
// //       body: _getPage(_selectedIndex),
// //       backgroundColor: Colors.transparent, //0xFF2b7b18 green
// //       bottomNavigationBar: CurvedNavigationBar(
// //         backgroundColor: Colors.transparent,
// //         color: Color(0xFFffe145),
// //                 // Color(0xFFf3c344),
// //                 // Color(0xFFffe145),    
// //         animationDuration: Duration(milliseconds: 300),
// //         items: [
// //           Icon(Icons.calendar_month, color: Colors.white),
// //           Icon(Icons.chat, color: Colors.white),
// //           Icon(Icons.add_reaction, color: Colors.white),
// //           Icon(Icons.home, color: Colors.white),
// //         ],
// //         onTap: (index) {
// //           setState(() {
// //             _selectedIndex = index;
// //           });
// //         },
// //       ),
// //     );
// //   }

// //   Widget _getPage(int index) {
// //     switch (index) {
// //       case 0:
// //         return CalendarPage();
// //       case 1:
// //         return ChatPage(userId : widget.userId);
// //       case 2:
// //         return ReactionPage(userId : widget.userId);
// //       case 3:
// //       return HomeTestGrey();
// //         // return homePage(userId : widget.userId , userRole : widget.userRole);
// //       default:
// //       return HomeTestGrey();
// //         // return homePage(userId : widget.userId , userRole : widget.userRole);
// //     }
// //   }
// // }

// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// //ready
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:cytc/view/homeCircularGrey.dart';
// import 'package:cytc/view/screen/bottomBarPages/activities/activities_main.dart';
// import 'package:cytc/view/screen/bottomBarPages/posts.dart';
// import 'package:flutter/material.dart';
// import 'package:cytc/view/screen/bottomBarPages/calender.dart';
// import 'package:cytc/view/screen/bottomBarPages/chat.dart';
// import 'package:cytc/view/homePage.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart'; // Import the package

// class bar extends StatefulWidget {
//   final userId;
//   final userRole;
//   const bar({super.key, required this.userId, required this.userRole}); //  const bar({super.key, Key? key, required this.userId, required this.userRole});

//   @override
//   State<bar> createState() => _barState();
// }

// class _barState extends State<bar> {
//   int _selectedIndex = 4;
//   bool isSearchBarVisible = false;
//   TextEditingController textEditingController = TextEditingController();

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     print("*****************");
//     print("userId " + widget.userId);
//     print("userRole " + widget.userRole);
//     print("*****************");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _getPage(_selectedIndex),
//       backgroundColor: Colors.transparent,
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           textTheme: TextTheme(
//             bodySmall: TextStyle(fontFamily: 'Amiri', color: Colors.grey), // Unselected labels
//             bodyMedium: TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145)), // Selected labels
//           ),
//         ),
//         child: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_today), // Use Line Awesome icon
//               label: 'التقويم',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(LineAwesomeIcons.comments), // Use Line Awesome icon
//               label: 'تواصل معنا',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(LineAwesomeIcons.trophy), // Use Line Awesome icon
//               label: 'انجازاتنا',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(LineAwesomeIcons.running), // Use Line Awesome icon
//               label: 'انشطتنا',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home), // Use Line Awesome icon
//               label: 'الرئيسية',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Color(0xFFffe145),
//           unselectedItemColor: Colors.grey,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return CalendarPage();
//       case 1:
//         return ChatPage(userId: widget.userId);
//       case 2: 
//         return ReactionPage(userId: widget.userId);
//       case 3:   //activities 
//         return Activities();
//       case 4:
//         return HomeTestGrey();
//         // return homePage(userId : widget.userId , userRole : widget.userRole);
//       default:
//         return HomeTestGrey();
//         // return homePage(userId : widget.userId , userRole : widget.userRole);
//     }
//   }
// }
