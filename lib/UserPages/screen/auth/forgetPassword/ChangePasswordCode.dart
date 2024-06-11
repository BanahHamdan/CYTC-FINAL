// // change_password_code.dart

// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:cytc/UserPages/screen/auth/forgetPassword/forgotPassword.dart';
// import 'package:cytc/UserPages/screen/auth/forgetPassword/modifyPassword.dart';
// import 'package:flutter/material.dart';

// class ChangePasswordCode extends StatelessWidget {
//   const ChangePasswordCode({super.key});
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: null,
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.white,
//           ),
//           Positioned.fill(
//             child: Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width *
//                     0.9, // Set width of the green box to 80% of the screen width
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF071533),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       'أدخل رمز التحقق',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     TextField(
//                       textAlign: TextAlign.right,
//                       cursorColor: Color(0xFFf3c344),
//                       decoration: InputDecoration(
//                         // labelText: 'رمز التحقق',
//                         hintText: 'ادخل رمز التحقق ',
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xFFf3c344),
//                             width: 3.0,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         // hintStyle: TextStyle(
//                         //   color: Colors.grey, // Default hint color
//                         // ),
//                         // labelStyle: TextStyle(
//                         //   color: Colors.black, // Black label color
//                         // ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ButtonBar(
//                       alignment: MainAxisAlignment.center, // Center the button
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => modifyPasswordPage()),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           child: Text(
//                             'تحقق',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Color(0xFF071533),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 22,
//             left: 16,
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => forgotPassword()),);
//               },
//               icon: Icon(Icons.arrow_back),
//               color: Color(0xFF071533),
//               iconSize: 32,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cytc/UserPages/screen/auth/forgetPassword/forgotPassword.dart';
import 'package:cytc/UserPages/screen/auth/forgetPassword/modifyPassword.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ChangePasswordCode extends StatelessWidget {
  const ChangePasswordCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              color: Color(0xFFffe145),
              height: MediaQuery.of(context).size.height * 0.99,
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => forgotPassword()),
                            );
                          },
                          child: Icon(
                            LineAwesomeIcons.angle_right_solid,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    Text(
                      'أدخل رمز التحقق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            TextField(
                              textAlign: TextAlign.right,
                              cursorColor: Color(0xFF071533),
                              decoration: InputDecoration(
                                hintText: 'ادخل رمز التحقق',
                                hintStyle: TextStyle(fontFamily: 'Amiri'),
                                prefixIcon: Icon(LineAwesomeIcons.key_solid, color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF071533)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => modifyPasswordPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF071533),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                              ),
                              child: Text(
                                'تحقق',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontFamily: 'Amiri',
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

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

