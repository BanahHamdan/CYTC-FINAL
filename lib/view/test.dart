// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cytc/view/screen/bottomBarPages/activities/Campaigns/Events/events_main(1).dart';
// import 'package:flutter/material.dart';

// class test extends StatefulWidget {
//   // final userId;
//   // final userRole;

//   // const test({
//   //   Key? key,
//   //   required this.userId,
//   //   required this.userRole,
//   // }) : super(key: key);

//   @override
//   _testState createState() => _testState();
// }

// class _testState extends State<test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF9F7F2),
//       appBar: AppBar(
//         title: Text(
//           'الرئيسية',
//           style: TextStyle(
//             fontFamily: 'Amiri',
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // Add notification functionality
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xFF071533),
//               ),
//               child: Text(
//                 'القائمة',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Amiri',
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text(
//                 'الرئيسية',
//                 style: TextStyle(fontFamily: 'Amiri'),
//               ),
//               onTap: () {
//                 // Navigate to home page
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.event),
//               title: Text(
//                 'الفعاليات',
//                 style: TextStyle(fontFamily: 'Amiri'),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EventsPage()),
//                 );
//               },
//             ),
//             // Add more ListTile widgets as needed
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 150,
//                     margin: EdgeInsets.only(right: 8.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         'مستطيل 1',
//                         style: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: 150,
//                     margin: EdgeInsets.only(left: 8.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         'مستطيل 2',
//                         style: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Text(
//                   'مستطيل طويل',
//                   style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
