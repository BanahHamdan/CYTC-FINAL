// //  // ignore_for_file: prefer_const_constructors

// // import 'package:cytc/UserPages/screen/auth/forgetPassword/ChangePasswordCode.dart';
// // // import 'package:cytc/view/forgotPassword.dart';
// // import 'package:cytc/UserPages/Home/homePage.dart';
// // import 'package:flutter/material.dart';

// // class modifyPasswordPage extends StatelessWidget {
// //   const modifyPasswordPage({super.key});
  
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: null,
// //       body: Stack(
// //         children: [
// //           Container(
// //             color: Colors.white,
// //           ),
// //           Positioned.fill(
// //             child: Center(
// //               child: Container(
// //                 width: MediaQuery.of(context).size.width * 0.9,
// //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
// //                 decoration: BoxDecoration(
// //                   color: Color(0xFF071533),
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   children: [
// //                     Text(
// //                       'تغيير كلمة المرور',
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     SizedBox(height: 30),
// //                     TextField(
// //                       textAlign: TextAlign.right,
// //                       obscureText: true,
// //                       cursorColor: Color(0xFFffe145),
// //                       decoration: InputDecoration(
// //                         // labelText: 'ادخل كلمة المرور الجديدة',
// //                         hintText: 'ادخل كلمة المرور الجديدة',
// //                         filled: true,
// //                         fillColor: Colors.white,
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(20),
// //                         ),
// //                         focusedBorder: OutlineInputBorder(
// //                           borderSide: BorderSide(color: Color(0xFFffe145), width: 3.0),
// //                           borderRadius: BorderRadius.circular(20),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextField(
// //                       textAlign: TextAlign.right,
// //                       obscureText: true,
// //                       cursorColor: Color(0xFFffe145),
// //                       decoration: InputDecoration(
// //                         // labelText: 'اعد كتابة كلمة المرور',
// //                         hintText: 'اعد كتابة كلمة المرور',
// //                         filled: true,
// //                         fillColor: Colors.white,
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(20),
// //                         ),
// //                         focusedBorder: OutlineInputBorder(
// //                           borderSide: BorderSide(color: Color(0xFFffe145), width: 3.0),
// //                           borderRadius: BorderRadius.circular(20),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         Navigator.push(
// //                         context,
// //                         //edit
// //                         MaterialPageRoute(builder: (context) => homePage(userId: null, userRole: null,)),
// //                         );
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.white,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(20),
// //                         ),
// //                         // minimumSize: Size(double.infinity, 50), // Adjust button size here
// //                       ),
// //                       child: Container(
// //                          child: Center(
// //                           child: Text(
// //                             'تأكيد الكلمة الجديدة',
// //                             style: TextStyle(
// //                               fontSize: 20.0,
// //                               color: Color(0xFF071533),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 22,
// //             left: 16,
// //             child: IconButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => ChangePasswordCode()),
// //                 );
// //               },
// //               icon: Icon(Icons.arrow_back),
// //               color: Color(0xFF071533),
// //               iconSize: 32,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
// import 'package:cytc/UserPages/screen/auth/forgetPassword/ChangePasswordCode.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class modifyPasswordPage extends StatelessWidget {
//   const modifyPasswordPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           ClipPath(
//             clipper: BackgroundClipper(),
//             child: Container(
//               color: Color(0xFFffe145),
//               height: MediaQuery.of(context).size.height * 0.99,
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
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 10.0),
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => ChangePasswordCode()),
//                             );
//                           },
//                           child: Icon(
//                             LineAwesomeIcons.angle_right_solid,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 100),
//                     Text(
//                       'تغيير كلمة المرور',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Amiri',
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 50),
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
//                             TextField(
//                               textAlign: TextAlign.right,
//                               obscureText: true,
//                               cursorColor: Color(0xFF071533),
//                               decoration: InputDecoration(
//                                 hintText: 'ادخل كلمة المرور الجديدة',
//                                 hintStyle: TextStyle(fontFamily: 'Amiri'),
//                                 prefixIcon: Icon(LineAwesomeIcons.lock_solid, color: Colors.grey),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 contentPadding: EdgeInsets.all(10),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(color: Colors.grey),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Color(0xFF071533)),
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                               textAlign: TextAlign.right,
//                               obscureText: true,
//                               cursorColor: Color(0xFF071533),
//                               decoration: InputDecoration(
//                                 hintText: 'اعد كتابة كلمة المرور',
//                                 hintStyle: TextStyle(fontFamily: 'Amiri'),
//                                 prefixIcon: Icon(LineAwesomeIcons.lock_solid, color: Colors.grey),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 contentPadding: EdgeInsets.all(10),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(color: Colors.grey),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Color(0xFF071533)),
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => bar(userId: '', userRole: '',)), //userId: null, userRole: null,
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFF071533),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
//                               ),
//                               child: Text(
//                                 'تأكيد الكلمة الجديدة',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.white,
//                                   fontFamily: 'Amiri',
//                                 ),
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

import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:cytc/UserPages/screen/auth/forgetPassword/ChangePasswordCode.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';

class ModifyPasswordPage extends StatefulWidget {
    final String userId;
  const ModifyPasswordPage({Key? key, required this.userId}) : super(key: key);

  @override
  _ModifyPasswordPageState createState() => _ModifyPasswordPageState();
}

class _ModifyPasswordPageState extends State<ModifyPasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordCode(userId: widget.userId)),
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
                      'تغيير كلمة المرور',
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
                              controller: _passwordController,
                              textAlign: TextAlign.right,
                              obscureText: true,
                              cursorColor: Color(0xFF071533),
                              decoration: InputDecoration(
                                hintText: 'ادخل كلمة المرور الجديدة',
                                hintStyle: TextStyle(fontFamily: 'Amiri'),
                                prefixIcon: Icon(LineAwesomeIcons.lock_solid,
                                    color: Colors.grey),
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
                            SizedBox(height: 10),
                            TextField(
                              controller: _confirmPasswordController,
                              textAlign: TextAlign.right,
                              obscureText: true,
                              cursorColor: Color(0xFF071533),
                              decoration: InputDecoration(
                                hintText: 'اعد كتابة كلمة المرور',
                                hintStyle: TextStyle(fontFamily: 'Amiri'),
                                prefixIcon: Icon(LineAwesomeIcons.lock_solid,
                                    color: Colors.grey),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage(userId: '')),
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
                                'تأكيد الكلمة الجديدة',
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
