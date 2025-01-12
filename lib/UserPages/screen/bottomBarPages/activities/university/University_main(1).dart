// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// ////////////////////////////////////////////
// ///
// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class universityTrainingPage extends StatefulWidget {
//   @override
//   _universityTrainingPageState createState() => _universityTrainingPageState();

//   final String userId;
//   final String userRole;
//   const universityTrainingPage(
//       {Key? key, required this.userId, required this.userRole})
//       : super(key: key);
// }

// class _universityTrainingPageState extends State<universityTrainingPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController universityController = TextEditingController();
//   final TextEditingController majorController = TextEditingController();
//   final TextEditingController trainingHoursController = TextEditingController();
//   final TextEditingController gpaController = TextEditingController(); // New Controller
//   final TextEditingController skillsController = TextEditingController(); // New Controller
//   final TextEditingController cvController = TextEditingController();

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   Future<void> submitTrainingRequest() async {
//     final String apiUrl = "http://localhost:9999/university-training/create";

//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: json.encode({
//         "fullName": nameController.text,
//         "universityName": universityController.text,
//         "field": majorController.text,
//         "trainingHours": trainingHoursController.text,
//         "cv": cvController.text,
//       }),
//     );

//     if (response.statusCode == 201) {
//       // Successfully added training request
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('تم ارسال طلب التدريب بنجاح')),
//       );
//       // Clear the form fields
//       nameController.clear();
//       emailController.clear();
//       universityController.clear();
//       majorController.clear();
//       trainingHoursController.clear();
//       gpaController.clear(); // Clear new field
//       skillsController.clear(); // Clear new field
//       cvController.clear();
//     } else {
//       // Error occurred
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('هناك نقص تاكد انك قمت بملئ جميع المتطلبات ')),
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
//               'تقديم طلب تدريب للخريجين',
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             centerTitle: true,
//             actions: [
//               IconButton(
//                 icon: Icon(LineAwesomeIcons.angle_right_solid,
//                     color: Colors.white),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       drawer: _buildDrawer(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildInputField(
//                 controller: nameController,
//                 icon: Icons.person,
//                 hintText: 'الاسم الثلاثي',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: emailController,
//                 icon: Icons.email,
//                 hintText: 'البريد الإلكتروني',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: universityController,
//                 icon: Icons.school,
//                 hintText: 'اسم الجامعة',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: majorController,
//                 icon: Icons.book,
//                 hintText: 'التخصص',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: trainingHoursController,
//                 icon: Icons.timer,
//                 hintText: 'عدد ساعات التدريب',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: gpaController,
//                 icon: Icons.grade,
//                 hintText: 'معدلك الجامعي:',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: skillsController,
//                 icon: Icons.build,
//                 hintText: 'اخبرنا عن مهاراتك:',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: cvController,
//                 icon: Icons.attach_file,
//                 hintText: 'ضع الرابط للسي في الخاص بك',
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   _showParticipationDialog(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFFffe145),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: Text(
//                   'إرسال',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Amiri',
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField({
//     required TextEditingController controller,
//     required IconData icon,
//     required String hintText,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xFF071533).withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Icon(icon, color: Color(0xFF071533), size: 40),
//           SizedBox(height: 8),
//           TextField(
//             textAlign: TextAlign.right,
//             controller: controller,
//             decoration: InputDecoration(
//               alignLabelWithHint: true,
//               hintTextDirection: TextDirection.rtl,
//               hintText: hintText,
//               hintStyle: TextStyle(
//                 color: Color(0xFF071533),
//                 fontFamily: 'Amiri',
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     color: Color(0xFFffe145),
//                     width: 2), // Border color when focused
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(color: Colors.grey), // Border color when enabled
//               ),
//             ),
//             cursorColor: Color(0xFFffe145),
//           ),
//         ],
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
//                 onPressed: () async {
//                   await submitTrainingRequest();
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF071533),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: EdgeInsets.all(18),
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
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProfilePage(
//                                   userId: widget.userId,
//                                   userRole: widget.userRole)));
//                     },
//                     child: CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage(
//                           'assets/banah.jpg'), // Replace with your image path
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => bar(userId: '', userRole: ''))),
//             title: Text('الرئيسية',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(Icons.home, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => universityTrainingPage(
//                         userId: widget.userId,
//                         userRole: widget.userRole))), // Add onTap functionality
//             title: Text('تقديم طلب تدريب للخريجين',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.graduation_cap_solid,
//                 color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => SuggestionsPage(
//                         userId: widget.userId,
//                         userRole: widget.userRole))), // Add onTap functionality
//             title: Text('شاركنا باقتراحاتك وافكارك',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing:
//                 Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => LoginPage(
//                           userId: widget.userId,
//                         ))), // Add onTap functionality for logout
//             title: Text('تسجيل خروج',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
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
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
////////////////////////////////////////////
///
///
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class universityTrainingPage extends StatefulWidget {
  @override
  _universityTrainingPageState createState() => _universityTrainingPageState();

  final String userId;
  final String userRole;
  const universityTrainingPage(
      {Key? key, required this.userId, required this.userRole})
      : super(key: key);
}

class _universityTrainingPageState extends State<universityTrainingPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController trainingHoursController = TextEditingController();
  final TextEditingController gpaController =
      TextEditingController(); // New Controller
  final TextEditingController skillsController =
      TextEditingController(); // New Controller
  final TextEditingController cvController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> submitTrainingRequest() async {
    final String apiUrl = "http://localhost:9999/university-training/create";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "fullName": nameController.text,
        "email": emailController.text, // Add email to request body
        "universityName": universityController.text,
        "field": majorController.text,
        "trainingHours": trainingHoursController.text,
        "cv": cvController.text,
        "gpa": gpaController.text, // Add GPA to request body
        "skills": skillsController.text, // Add skills to request body
      }),
    );

    if (response.statusCode == 201) {
      // Successfully added training request
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم ارسال طلب التدريب بنجاح')),
      );
      // Clear the form fields
      nameController.clear();
      emailController.clear();
      universityController.clear();
      majorController.clear();
      trainingHoursController.clear();
      gpaController.clear(); // Clear new field
      skillsController.clear(); // Clear new field
      cvController.clear();
    } else {
      // Error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('هناك نقص تاكد انك قمت بملئ جميع المتطلبات ')),
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
              'تقديم طلب تدريب للخريجين',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField(
                controller: nameController,
                icon: Icons.person,
                hintText: 'الاسم الثلاثي',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: emailController,
                icon: Icons.email,
                hintText: 'البريد الإلكتروني',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: universityController,
                icon: Icons.school,
                hintText: 'اسم الجامعة',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: majorController,
                icon: Icons.book,
                hintText: 'التخصص',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: trainingHoursController,
                icon: Icons.timer,
                hintText: 'عدد ساعات التدريب',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: gpaController,
                icon: Icons.grade,
                hintText: 'معدلك الجامعي:',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: skillsController,
                icon: Icons.build,
                hintText: 'اخبرنا عن مهاراتك:',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: cvController,
                icon: Icons.attach_file,
                hintText: 'ضع الرابط للسي في الخاص بك',
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
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
  }) {
    return Container(
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
          Icon(icon, color: Color(0xFF071533), size: 40),
          SizedBox(height: 8),
          TextField(
            textAlign: TextAlign.right,
            controller: controller,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintTextDirection: TextDirection.rtl,
              hintText: hintText,
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
                borderSide:
                    BorderSide(color: Colors.grey), // Border color when enabled
              ),
            ),
            cursorColor: Color(0xFFffe145),
          ),
        ],
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
                  await submitTrainingRequest();
                  Navigator.pop(context); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF071533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(18),
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
                    builder: (context) => bar(userId: '', userRole: ''))),
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
                          userId: widget.userId,
                        ))), // Add onTap functionality for logout
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

