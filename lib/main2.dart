// // ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, library_private_types_in_public_api, use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

// import 'package:cytc/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:cytc/UserPages/screen/auth/forgetPassword/forgotPassword.dart';
// import 'package:cytc/UserPages/screen/auth/Signup.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class main2 extends StatefulWidget {
//   const main2({super.key});

//   @override
//   _main2State createState() => _main2State();
// }

// class _main2State extends State<main2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color(0xFF071533).withOpacity(0.1),
//       body: Stack(
//         children: [
//           ClipPath(
//             clipper: BackgroundClipper(),
//             child: Stack(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.99,
//                   // decoration: BoxDecoration(
//                   //   image: DecorationImage(
//                   //     image: AssetImage('assets/mainYellow.png'), // Replace with your image asset path
//                   //     fit: BoxFit.cover,
//                   //   ),
//                   // ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.55,
//                   color: Colors.black.withOpacity(0.4), // Optional: Add a color overlay
//                 ),
//               ],
//             ),
//           ),
//           SingleChildScrollView(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(height: 70),
//                     Column(
//                       children: [
//                         Text(
//                           'اهلا بكم في تطبيق مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'Amiri',
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 150),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       padding: EdgeInsets.all(16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 10.0,
//                             offset: Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             Image.asset('assets/Logo.png', width: 120, height: 120),
//                             SizedBox(height: 20),
//                             ElevatedButton(
//                               onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => main2()),
                                // );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFF071533),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 30.0, vertical: 15.0),
//                               ),
//                               child: Text(
//                                 'تسجيل الدخول',
//                                 textAlign: TextAlign.right,
//                                 style: TextStyle(fontSize: 18, fontFamily: 'Amiri'),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => Signup()),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFF071533),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 30.0, vertical: 15.0),
//                               ),
//                               child: Text(
//                                 'أنشئ حسابًا جديدًا',
//                                 textAlign: TextAlign.right,
//                                 style: TextStyle(fontSize: 18, fontFamily: 'Amiri'),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.3);
//     path.quadraticBezierTo(
//         size.width / 2, size.height / 2, size.width, size.height * 0.3);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }


// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, library_private_types_in_public_api, use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:cytc/UserPages/screen/auth/Signup.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:flutter/material.dart';

class main2 extends StatefulWidget {
  final String userId;
  const main2({Key? key, required this.userId}) : super(key: key);
  @override
  _main2State createState() => _main2State();
}

class _main2State extends State<main2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mainYellow.png'), // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 100),
                    Column(
                      children: [
                        Text(
                          'اهلا بكم في تطبيق مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      // height: 400,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset('assets/Logo.png', width: 120, height: 120),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF071533),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 15.0),
                              ),
                              child: Text(
                                'تسجيل الدخول',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 18, fontFamily: 'Amiri'),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Signup(userId: widget.userId)),
                                );
                              },
                              child: Text(
                                'أنشئ حسابًا جديدًا',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Amiri',
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF071533),
                                  fontWeight: FontWeight.bold,
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
            ),
          ),
        ],
      ),
    );
  }
}


// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.3);
//     path.quadraticBezierTo(
//         size.width / 2, size.height / 2, size.width, size.height * 0.3);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
