// // ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, library_private_types_in_public_api, use_build_context_synchronously, prefer_interpolation_to_compose_strings

// import 'package:cytc/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:cytc/UserPages/screen/auth/forgetPassword/forgotPassword.dart';
// import 'package:cytc/UserPages/screen/auth/Signup.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../bottomBarPages/buttonBar.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isImageVisible = true;
//   late TextEditingController _emailController;

//   ///
//   late TextEditingController _passwordController;

//   ///
//   late FocusNode _emailFocusNode;
//   late FocusNode _passwordFocusNode;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();

//     ///
//     _passwordController = TextEditingController();

//     ///
//     _emailFocusNode = FocusNode();
//     _passwordFocusNode = FocusNode();
//     _emailFocusNode.addListener(_handleFocusChange);
//     _passwordFocusNode.addListener(_handleFocusChange);
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleFocusChange() {
//     setState(() {
//       _isImageVisible =
//           !_emailFocusNode.hasFocus && !_passwordFocusNode.hasFocus;
//     });
//   }

//   /// هاد الفنكشن هو الي بنستدعيه لما نكبس ع كبسة تسجيل الدخول
//   /// وظيفته ياخد الايميل و الباسورد و يبعتهم للباك
//   /// اذا كانت العملية صحيحة بنقلنا لصفحة الهوم
//   /// و ازا في اي مشكلة بتظهر الديالوج
//   Future<void> loginReq() async {
//     if (_emailController.text.isNotEmpty &&
//         _passwordController.text.isNotEmpty) {
//       //هاي الداتا الي بدنا نبعتها للباك , فنكشن تسجيل الدخول بالباك باخد متغيرين (الايميل و الباسورد)++++++
//       var reqBody = {
//         "email": _emailController.text,
//         "password": _passwordController.text,
//       };
//       // LinkApi.login == http://10.0.2.2:9999/user/signin
//       var response = await http.post(Uri.parse(LinkApi.login),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(reqBody));

//       var jsonResponse = jsonDecode(response.body);

//       print("status : " + jsonResponse['status'].toString());

//       if (jsonResponse['status']) {
//         // TODO pass token
//         print("login successfully");
//         print("Role :" + jsonResponse['role']);
//         if (jsonResponse['role'] == '0' || jsonResponse['role'] == '1') {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => bar(
//                       userId: jsonResponse['id'],
//                       userRole: jsonResponse['role'])));
//         } else {
//           // go to admin home page
//           AlertDialog(
//             title: const Text('Error Message'),
//             content: Text(
//               jsonResponse['message'],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 style: TextButton.styleFrom(
//                   textStyle: Theme.of(context).textTheme.labelLarge,
//                 ),
//                 child: const Text('Disable'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   textStyle: Theme.of(context).textTheme.labelLarge,
//                 ),
//                 child: const Text('Enable'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         }
//       } else {
//         // dialog
//         showDialog(
//           context: context,
//           builder: (_) {
//             return AlertDialog(
//               title: const Text('Error Message'),
//               content: Text(jsonResponse['message']), // from backend
//               actions: [
//                 TextButton(
//                   onPressed: Navigator.of(context).pop,
//                   child: Text('Ok'),
//                 ),
//               ],
//             );
//           },
//         );
//         //  AlertDialog(
//         //   title: const Text('Error Message'),
//         //   content: Text(
//         //     jsonResponse['message'],
//         //   ),
//         //   actions: <Widget>[
//         //     TextButton(
//         //       style: TextButton.styleFrom(
//         //         textStyle: Theme.of(context).textTheme.labelLarge,
//         //       ),
//         //       child: const Text('Disable'),
//         //       onPressed: () {
//         //         Navigator.of(context).pop();
//         //       },
//         //     ),
//         //     TextButton(
//         //       style: TextButton.styleFrom(
//         //         textStyle: Theme.of(context).textTheme.labelLarge,
//         //       ),
//         //       child: const Text('Enable'),
//         //       onPressed: () {
//         //         Navigator.of(context).pop();
//         //       },
//         //     ),
//         //   ],
//         // );
//         print("SomeThing Went Wrong in login");
//       }
//     } else {}
//   }

//   int validateAddress(String address) {
//     String patttern = r'(^[a-zA-Z0-9 ,.-]*$)';
//     RegExp regExp = RegExp(patttern);
//     if (address.isEmpty || address.isEmpty) {
//       return 1;
//     } else if (address.length < 10) {
//       return 3;
//     } else {
//       return 0;
//     }
//   }

//   // Future<void> _dialogBuilder(BuildContext context) {
//   //   return showDialog<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: const Text('Basic dialog title'),
//   //         content: const Text(
//   //           'A dialog is a type of modal window that\n'
//   //           'appears in front of app content to\n'
//   //           'provide critical information, or prompt\n'
//   //           'for a decision to be made.',
//   //         ),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             style: TextButton.styleFrom(
//   //               textStyle: Theme.of(context).textTheme.labelLarge,
//   //             ),
//   //             child: const Text('Disable'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //           TextButton(
//   //             style: TextButton.styleFrom(
//   //               textStyle: Theme.of(context).textTheme.labelLarge,
//   //             ),
//   //             child: const Text('Enable'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: null,
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.white,
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.only(bottom: 80),
//               decoration: BoxDecoration(
//                 color: Color(0xFF071533),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50.0),
//                   topRight: Radius.circular(50.0),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 55),
//                       child: Text(
//                         'تسجيل الدخول',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     TextField(
//                       textAlign: TextAlign.right,
//                       // Set text direction to right-to-left
//                       controller:
//                           _emailController, //هاي الكونترولر الي بتساعدنا ناخد الداتا من التيكست فيلد
//                       focusNode: _emailFocusNode,
//                       onTap: _handleFocusChange,
//                       cursorColor: Color(0xFFffe145),
//                       // validator: (value) {
//                       //   if (value == null || value.isEmpty) {
//                       //     return "Please enter state";
//                       //   } else {
//                       //     return null;
//                       //   }
//                       // },
//                       decoration: InputDecoration(
//                         // contentPadding: EdgeInsets.fromLTRB(
//                         //     220, 20, 10, 20), // Adjust padding
//                         // labelText: 'البريد الالكتروني',
//                         hintText: 'ادخل البريد الالكتروني',
//                         // alignLabelWithHint: true,
//                         filled: true,
//                         fillColor: Colors.white,
//                         // errorBorder:,
//                         // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(
//                               width: 2,
//                               color: Colors.red,
//                             )),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xFFffe145),
//                             width: 3.0,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       textAlign: TextAlign.right,
//                       controller: _passwordController,
//                       focusNode: _passwordFocusNode,
//                       onTap: _handleFocusChange,
//                       cursorColor: Color(0xFFffe145),
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         // contentPadding: EdgeInsets.fromLTRB(
//                         //     250, 20, 10, 20), // Adjust padding
//                         // labelText: 'كلمة المرور',
//                         hintText: 'ادخل كلمة المرور',
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xFFffe145),
//                             width: 3.0,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         print("email = " + _emailController.text);
//                         print("password = " + _passwordController.text);
//                         loginReq();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           // side: BorderSide(
//                           // color: Colors.black, width: 1), // Add border here
//                         ),
//                       ),
//                       child: Text(
//                         'تسجيل الدخول',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           color: Color(0xFF071533),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => forgotPassword()),
//                         );
//                       },
//                       child: Text(
//                         'هل نسيت كلمة المرور؟',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Signup()),
//                         );
//                       },
//                       child: Text(
//                         'انشىء حساب جديد',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           if (_isImageVisible)
//             Positioned(
//               top: 70,
//               left: 60,
//               child: Container(
//                 width: 296,
//                 height: 170,
//                 child: Image.asset(
//                   'assets/Logo.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           Positioned(
//             bottom: 22,
//             left: 16,
//             child: IconButton(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => WelcomePage()),
//                 // );
//               },
//               icon: Icon(Icons.arrow_back),
//               color: Colors.white,
//               iconSize: 32,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//////////////////////////////////////////////////////

// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, library_private_types_in_public_api, use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables
import 'package:cytc/linkapi.dart';
import 'package:cytc/UserPages/screen/auth/Signup.dart';
import 'package:cytc/UserPages/screen/auth/forgetPassword/forgotPassword.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../bottomBarPages/buttonBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
            child: Container(
              color: Color(0xFFffe145),
              // height: MediaQuery.of(context).size.height * 0.55,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                // padding: EdgeInsets.all(10),
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
                            // Handle back button press
                          },
                          child: Icon(
                            LineAwesomeIcons.angle_right_solid,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '!مرحبًا بعودتك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                        color: Colors.white,
                      ),
                    ),
                    Image.asset('assets/homePage/groupUsersWhite.png',
                        width: 140, height: 140),
                    // SizedBox(height: 20),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.7, // Adjusted width
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
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   elevation: 4,
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
                                prefixIcon: Icon(LineAwesomeIcons.envelope, color: Colors.grey),
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
                                prefixIcon: Icon(LineAwesomeIcons.lock_solid, color: Colors.grey),
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
                                          builder: (context) =>
                                              forgotPassword()),
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
                                // Image.asset('assets/gif/LogIn1.gif', width: 50, height: 50,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Center( // Added Center to center-align the button
                      child: ElevatedButton(
                        onPressed: loginReq,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF071533),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0), // Adjusted padding
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
                          MaterialPageRoute(builder: (context) => Signup()),
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