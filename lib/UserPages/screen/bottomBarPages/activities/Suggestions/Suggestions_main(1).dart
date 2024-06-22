// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class SuggestionsPage extends StatefulWidget {
//   @override
//   _SuggestionsPageState createState() => _SuggestionsPageState();

//   final String userId;
//   final String userRole;
//   const SuggestionsPage({Key? key, required this.userId, required this.userRole}) : super(key: key);
// }

// class _SuggestionsPageState extends State<SuggestionsPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   Future<void> submitSuggestion() async {
//     final String apiUrl = "http://localhost:9999/suggestion/create";

//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: json.encode({
//         "fullName": nameController.text,
//         "email": emailController.text,
//         "title": titleController.text,
//         "description": descriptionController.text,
//       }),
//     );

//     if (response.statusCode == 201) {
//       // Successfully added suggestion
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Suggestion added successfully!')),
//       );
//       // Clear the form fields
//       nameController.clear();
//       emailController.clear();
//       titleController.clear();
//       descriptionController.clear();
//     } else {
//       // Error occurred
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to add suggestion')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       key: _scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80.0),
//         child: ClipPath(
//           clipper: CustomAppBarClipper(),
//           child: AppBar(
//             backgroundColor: Color(0xFFffe145).withOpacity(0.7),
//             elevation: 0,
//             leading: IconButton(
//               icon: Icon(LineAwesomeIcons.bars_solid, color: Colors.white),
//               onPressed: () {
//                 _scaffoldKey.currentState?.openDrawer();
//               },
//             ),
//             title: Text(
//               'تعرف على الاحتفالات والمهرجانات القادمة',
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             centerTitle: true,
//             actions: [
//               IconButton(
//                 icon: Icon(LineAwesomeIcons.angle_right_solid, color: Colors.white),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       drawer: _buildDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(right: 8),
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF071533).withOpacity(0.1),
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Icon(Icons.email, color: Color(0xFF071533), size: 40),
//                         SizedBox(height: 8),
//                         TextField(
//                           textAlign: TextAlign.right,
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             alignLabelWithHint: true,
//                             hintTextDirection: TextDirection.rtl,
//                             hintText: 'البريد الإلكتروني',
//                             hintStyle: TextStyle(
//                               color: Color(0xFF071533),
//                               fontFamily: 'Amiri',
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Color(0xFFffe145),
//                                   width: 2), // Border color when focused
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color:
//                                       Colors.grey), // Border color when enabled
//                             ),
//                           ),
//                           cursorColor: Color(0xFFffe145),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(left: 8),
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF071533).withOpacity(0.1),
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Icon(Icons.person, color: Color(0xFF071533), size: 40),
//                         SizedBox(height: 8),
//                         TextField(
//                           textAlign: TextAlign.right,
//                           controller: nameController,
//                           decoration: InputDecoration(
//                             alignLabelWithHint: true,
//                             hintTextDirection: TextDirection.rtl,
//                             hintText: 'الاسم',
//                             hintStyle: TextStyle(
//                               color: Color(0xFF071533),
//                               fontFamily: 'Amiri',
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Color(0xFFffe145),
//                                   width: 2), // Border color when focused
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color:
//                                       Colors.grey), // Border color when enabled
//                             ),
//                           ),
//                           cursorColor: Color(0xFFffe145),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF071533).withOpacity(0.1),
//                     spreadRadius: 2,
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Icon(Icons.message, color: Color(0xFF071533), size: 40),
//                   SizedBox(height: 8),
//                   TextField(
//                     textAlign: TextAlign.right,
//                     controller: titleController,
//                     maxLines: 1,
//                     decoration: InputDecoration(
//                       alignLabelWithHint: true,
//                       hintTextDirection: TextDirection.rtl,
//                       hintText: 'عنوان النشاط / الفكرة',
//                       hintStyle: TextStyle(
//                         color: Color(0xFF071533),
//                         fontFamily: 'Amiri',
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color(0xFFffe145),
//                             width: 2), // Border color when focused
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.grey), // Border color when enabled
//                       ),
//                     ),
//                     cursorColor: Color(0xFFffe145),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF071533).withOpacity(0.1),
//                     spreadRadius: 2,
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SizedBox(height: 8),
//                   TextField(
//                     textAlign: TextAlign.right,
//                     controller: descriptionController,
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                       alignLabelWithHint: true,
//                       hintTextDirection: TextDirection.rtl,
//                       hintText: 'اشرح لنا اكثر لتوضيح فكرتك',
//                       hintStyle: TextStyle(
//                         color: Color(0xFF071533),
//                         fontFamily: 'Amiri',
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color(0xFFffe145),
//                             width: 2), // Border color when focused
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.grey), // Border color when enabled
//                       ),
//                     ),
//                     cursorColor: Color(0xFFffe145),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 _showParticipationDialog(context);
//                 // submitSuggestion();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFFffe145),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 16),
//               ),
//               child: Text(
//                 'إرسال',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'Amiri',
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showParticipationDialog(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'عند ضغطك على زر تأكيد الارسال \n فأنت تقوم بتأكيد ارسالك للطلب',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Color(0xFF071533),
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Amiri',
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // submitSuggestion();
//                   // Handle donate button press
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF071533),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: EdgeInsets.all(15),
//                 ),
//                 child: Text(
//                   'تأكيد الارسال',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontFamily: 'Amiri',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
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
//                         'بانه خالد حمدان',
//                         style: TextStyle(
//                           color: Color(0xFF071533),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           fontFamily: 'Amiri',
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 16.0),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId, userRole: widget.userRole)));
//                     },
//                     child: CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage('assets/banah.jpg'), // Replace with your image path
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: widget.userId, userRole: ''))),
//             title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(Icons.home, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage(userId: widget.userId, userRole: widget.userRole))), // Add onTap functionality
//             title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage(userId: widget.userId, userRole: widget.userRole))), // Add onTap functionality
//             title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
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
// }

// class CustomAppBarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.6);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height * 0.6,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
///////////////////////////////////
import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SuggestionsPage extends StatefulWidget {
  @override
  _SuggestionsPageState createState() => _SuggestionsPageState();

  final String userId;
  final String userRole;
  const SuggestionsPage(
      {Key? key, required this.userId, required this.userRole})
      : super(key: key);
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> submitSuggestion() async {
    final String apiUrl = "http://localhost:9999/suggestion/create";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "fullName": nameController.text,
        "email": emailController.text,
        "title": titleController.text,
        "description": descriptionController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Successfully added suggestion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم ارسال اقتراحك بنجاح')),
      );
      // Clear the form fields
      nameController.clear();
      emailController.clear();
      titleController.clear();
      descriptionController.clear();
    } else {
      // Error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add suggestion')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ClipPath(
          clipper: CustomAppBarClipper(),
          child: AppBar(
            backgroundColor: Color(0xFFffe145).withOpacity(0.7),
            elevation: 0,
            leading: IconButton(
              icon: Icon(LineAwesomeIcons.bars_solid, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            title: Text(
              'تعرف على الاحتفالات والمهرجانات القادمة',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(LineAwesomeIcons.angle_right_solid,
                    color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF071533).withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.email, color: Color(0xFF071533), size: 40),
                        SizedBox(height: 8),
                        TextField(
                          textAlign: TextAlign.right,
                          controller: emailController,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'البريد الإلكتروني',
                            hintStyle: TextStyle(
                              color: Color(0xFF071533),
                              fontFamily: 'Amiri',
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFffe145),
                                  width: 2), // Border color when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Colors.grey), // Border color when enabled
                            ),
                          ),
                          cursorColor: Color(0xFFffe145),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF071533).withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.person, color: Color(0xFF071533), size: 40),
                        SizedBox(height: 8),
                        TextField(
                          textAlign: TextAlign.right,
                          controller: nameController,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'الاسم',
                            hintStyle: TextStyle(
                              color: Color(0xFF071533),
                              fontFamily: 'Amiri',
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFffe145),
                                  width: 2), // Border color when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Colors.grey), // Border color when enabled
                            ),
                          ),
                          cursorColor: Color(0xFFffe145),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF071533).withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.message, color: Color(0xFF071533), size: 40),
                  SizedBox(height: 8),
                  TextField(
                    textAlign: TextAlign.right,
                    controller: titleController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'عنوان النشاط / الفكرة',
                      hintStyle: TextStyle(
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFffe145),
                            width: 2), // Border color when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Border color when enabled
                      ),
                    ),
                    cursorColor: Color(0xFFffe145),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF071533).withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 8),
                  TextField(
                    textAlign: TextAlign.right,
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'اشرح لنا اكثر لتوضيح فكرتك',
                      hintStyle: TextStyle(
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFffe145),
                            width: 2), // Border color when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Border color when enabled
                      ),
                    ),
                    cursorColor: Color(0xFFffe145),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showParticipationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFffe145),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'إرسال',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Amiri',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showParticipationDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'عند ضغطك على زر تأكيد الارسال \n فأنت تقوم بتأكيد ارسالك للطلب',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF071533),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await submitSuggestion();
                  Navigator.pop(context); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF071533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(15),
                ),
                child: Text(
                  'تأكيد الارسال',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
                        style: TextStyle(
                          color: Color(0xFF071533),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Amiri',
                        ),
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
                                  userRole: widget.userRole)));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/banah.jpg'), // Replace with your image path
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        bar(userId: widget.userId, userRole: ''))),
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
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
