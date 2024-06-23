// // ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, library_private_types_in_public_api, use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables
// import 'package:cytc/linkapi.dart';
// import 'package:cytc/UserPages/screen/auth/Signup.dart';
// import 'package:cytc/UserPages/screen/auth/forgetPassword/forgotPassword.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// import '../bottomBarPages/buttonBar.dart';

// class LoginPage extends StatefulWidget {
//   final String userId;

//   const LoginPage({super.key, required this.userId});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;
//   late FocusNode _emailFocusNode;
//   late FocusNode _passwordFocusNode;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     _emailFocusNode = FocusNode();
//     _passwordFocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }

//   Future<void> loginReq() async {
//     if (_emailController.text.isNotEmpty &&
//         _passwordController.text.isNotEmpty) {
//       var reqBody = {
//         "email": _emailController.text,
//         "password": _passwordController.text,
//       };
//       var response = await http.post(Uri.parse(LinkApi.login),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(reqBody));

//       var jsonResponse = jsonDecode(response.body);

//       print("status : " + jsonResponse['status'].toString());

//       if (jsonResponse['status']) {
//         if (jsonResponse['role'] == '0' || jsonResponse['role'] == '1') {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => bar(
//                       userId: jsonResponse['id'],
//                       userRole: jsonResponse['role'])));
//         } else {
//           showDialog(
//             context: context,
//             builder: (_) {
//               return AlertDialog(
//                 title: const Text('Error Message'),
//                 content: Text(jsonResponse['message']),
//                 actions: [
//                   TextButton(
//                     onPressed: Navigator.of(context).pop,
//                     child: Text('Ok'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       } else {
//         showDialog(
//           context: context,
//           builder: (_) {
//             return AlertDialog(
//               title: const Text('Error Message'),
//               content: Text(jsonResponse['message']),
//               actions: [
//                 TextButton(
//                   onPressed: Navigator.of(context).pop,
//                   child: Text('Ok'),
//                 ),
//               ],
//             );
//           },
//         );
//         print("SomeThing Went Wrong in login");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           ClipPath(
//             clipper: BackgroundClipper(),
//             child: Container(
//               color: Color(0xFFffe145),
//               // height: MediaQuery.of(context).size.height * 0.55,
//             ),
//           ),
//           SingleChildScrollView(
//             child: Center(
//               child: Padding(
//                 // padding: EdgeInsets.all(10),
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
//                             // Handle back button press
//                           },
//                           child: Icon(
//                             LineAwesomeIcons.angle_right_solid,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       '!مرحبًا بعودتك',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Amiri',
//                         color: Colors.white,
//                       ),
//                     ),
//                     Image.asset('assets/homePage/groupUsersWhite.png',
//                         width: 140, height: 140),
//                     // SizedBox(height: 20),

//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.7, // Adjusted width
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
//                       // Card(
//                       //   shape: RoundedRectangleBorder(
//                       //     borderRadius: BorderRadius.circular(10),
//                       //   ),
//                       //   elevation: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             TextField(
//                               cursorColor: Color(0xFF071533),
//                               controller: _emailController,
//                               focusNode: _emailFocusNode,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(LineAwesomeIcons.envelope, color: Colors.grey),
//                                 hintText: 'البريد الإلكتروني',
//                                 hintStyle: TextStyle(fontFamily: 'Amiri'),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 contentPadding: EdgeInsets.all(10),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(color: Colors.grey),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide:
//                                       BorderSide(color: Color(0xFF071533)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 16),
//                             TextField(
//                               cursorColor: Color(0xFF071533),
//                               controller: _passwordController,
//                               focusNode: _passwordFocusNode,
//                               obscureText: true,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(LineAwesomeIcons.lock_solid, color: Colors.grey),
//                                 hintText: 'كلمة المرور',
//                                 hintStyle: TextStyle(fontFamily: 'Amiri'),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 contentPadding: EdgeInsets.all(10),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide: BorderSide(color: Colors.grey),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   borderSide:
//                                       BorderSide(color: Color(0xFF071533)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 10.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ForgotPassword(userId: widget.userId,)),
//                                     );
//                                   },
//                                   child: Text(
//                                     'نسيت كلمة المرور؟',
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       color: Color(0xFFffe145),
//                                       decoration: TextDecoration.underline,
//                                       fontFamily: 'Amiri',
//                                     ),
//                                   ),
//                                 ),
//                                 // Image.asset('assets/gif/LogIn1.gif', width: 50, height: 50,),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: 20),
//                     Center( // Added Center to center-align the button
//                       child: ElevatedButton(
//                         onPressed: loginReq,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF071533),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 30.0, vertical: 15.0), // Adjusted padding
//                         ),
//                         child: Text(
//                           'تسجيل الدخول',
//                           textAlign: TextAlign.right,
//                           style: TextStyle(fontSize: 18, fontFamily: 'Amiri'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Signup(userId: widget.userId,)),
//                         );
//                       },
//                       child: Text(
//                         'أنشئ حسابًا جديدًا',
//                         style: TextStyle(
//                           color: Color(0xFF071533),
//                           decoration: TextDecoration.underline,
//                           fontFamily: 'Amiri',
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
import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
import 'package:cytc/linkapi.dart';
import 'package:cytc/UserPages/screen/auth/Signup.dart';
import 'package:cytc/UserPages/screen/auth/forgetPassword/forgotPassword.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../main2.dart';
import '../bottomBarPages/buttonBar.dart';
//import '../../AdminPages/screen/AdminBar.dart'; // Import the AdminBar page

class LoginPage extends StatefulWidget {
  final String userId;

  const LoginPage({super.key, required this.userId});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> loginReq() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };
      var response = await http.post(Uri.parse(LinkApi.login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);

      print("status : " + jsonResponse['status'].toString());

      if (jsonResponse['status']) {
        if (jsonResponse['role'] == '0' || jsonResponse['role'] == '1') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => bar(
                      userId: jsonResponse['id'],
                      userRole: jsonResponse['role'])));
        } else if (jsonResponse['role'] == '2') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AdminBar(
                      userId: jsonResponse['id'],
                      userRole: jsonResponse['role'])));
        } else {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Error Message'),
                content: Text(jsonResponse['message']),
                actions: [
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('Error Message'),
              content: Text(jsonResponse['message']),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        print("SomeThing Went Wrong in login");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: BackgroundClipper(),
            // child: Container(
            //   color: Color(0xFF071533).withOpacity(0.3),
            // ),
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
                                  MaterialPageRoute(builder: (context) => main2(userId: widget.userId,)),
                                );
                          },
                          child: Icon(
                            LineAwesomeIcons.angle_right_solid,
                            color: Color(0xFF071533),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '!مرحبًا بعودتك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Image.asset('assets/Logo.png',
                        width: 100, height: 100),
                        SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
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
                              cursorColor: Color(0xFF071533),
                              controller: _emailController,
                              focusNode: _emailFocusNode,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.envelope,
                                    color: Colors.grey),
                                hintText: 'البريد الإلكتروني',
                                hintStyle: TextStyle(fontFamily: 'Amiri'),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFF071533)),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            TextField(
                              cursorColor: Color(0xFF071533),
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              obscureText: true,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.lock_solid,
                                    color: Colors.grey),
                                hintText: 'كلمة المرور',
                                hintStyle: TextStyle(fontFamily: 'Amiri'),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFF071533)),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPassword(
                                                userId: widget.userId,
                                              )),
                                    );
                                  },
                                  child: Text(
                                    'نسيت كلمة المرور؟',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFffe145),
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Amiri',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: loginReq,
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
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup(
                                    userId: widget.userId,
                                  )),
                        );
                      },
                      child: Text(
                        'أنشئ حسابًا جديدًا',
                        style: TextStyle(
                          color: Color(0xFF071533),
                          decoration: TextDecoration.underline,
                          fontFamily: 'Amiri',
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