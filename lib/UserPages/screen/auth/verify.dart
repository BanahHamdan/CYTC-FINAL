// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:convert';

import '../../../linkapi.dart';
import 'login.dart';
import 'Signup.dart';

class VerifyPage extends StatefulWidget {
  final String code;
  final String email;
  final String userId;
  const VerifyPage({super.key, required this.code, required this.email, required this.userId});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  late List<TextEditingController> _codeControllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _codeControllers = List.generate(5, (_) => TextEditingController());
    _focusNodes = List.generate(5, (_) => FocusNode());
    print("---------------------");
    print("Original code from backend: " + widget.code);
    print("---------------------");
  }

  @override
  void dispose() {
    _codeControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  Future<void> verifyAndActivateUser() async {
    String enteredCode =
        _codeControllers.map((controller) => controller.text).join();
    print("Entered code by user: " + enteredCode); // Log the entered code

    if (enteredCode == widget.code) {
      var reqBody = {
        "email": widget.email,
        "code": enteredCode,
      };
      var response = await http.put(Uri.parse(LinkApi.activateUser),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        print("User activated successfully");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId,)),
        );
      } else {
        print("Error activating user: ${jsonResponse['error']}");
      }
    } else {
      print("Incorrect verification code");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            // child: Align(
            //   alignment: Alignment.topRight,
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup(userId: widget.userId,)),
                  );
                },
                child: Icon(
                  LineAwesomeIcons.angle_right_solid,
                  color: Color(0xFF071533),
                  size: 20,
                ),
              ),
            // ),
          ),
          // ClipPath(
          //   clipper: BackgroundClipper(),
          //   child: Container(
          //     color: Color(0xFFffe145),
          //     height: MediaQuery.of(context).size.height * 0.55,
          //   ),
          // ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'ادخل رمز التحقق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                    SizedBox(height: 20),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          5,
                          (index) => VerificationBox(
                            controller: _codeControllers[index],
                            focusNode: _focusNodes[index],
                            index: index,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (index < 4) {
                                  _focusNodes[index + 1].requestFocus();
                                  Color(0xFFffe145);
                                } else {
                                  _focusNodes[index].unfocus();
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: verifyAndActivateUser,
                        child: Text(
                          'تحقق',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Amiri',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF071533),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle resend code functionality
                        },
                        child: Text(
                          'ارسل الرمز مرة اخرى',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFffe145),
                            fontSize: 15,
                            fontFamily: 'Amiri',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Image.asset(
                      'assets/homePage/signup.png',
                      width: 200,
                      height: 200,
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

class VerificationBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final int index;
  final ValueChanged<String> onChanged;

  const VerificationBox({
    required this.controller,
    required this.focusNode,
    required this.index,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF071533)),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
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

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'dart:convert';

// import '../../../linkapi.dart';
// import 'login.dart';
// import 'Signup.dart';
// import '../../interests.dart';

// class VerifyPage extends StatefulWidget {
//   final String code;
//   final String email;
//   final String userId;
//   const VerifyPage(
//       {super.key,
//       required this.code,
//       required this.email,
//       required this.userId});

//   @override
//   _VerifyPageState createState() => _VerifyPageState();
// }

// class _VerifyPageState extends State<VerifyPage> {
//   late List<TextEditingController> _codeControllers;
//   late List<FocusNode> _focusNodes;

//   @override
//   void initState() {
//     super.initState();
//     codeControllers = List.generate(5, () => TextEditingController());
//     focusNodes = List.generate(5, () => FocusNode());
//     print("---------------------");
//     print("Original code from backend: " + widget.code);
//     print("---------------------");
//   }

//   @override
//   void dispose() {
//     _codeControllers.forEach((controller) => controller.dispose());
//     _focusNodes.forEach((node) => node.dispose());
//     super.dispose();
//   }

//   Future<void> verifyAndActivateUser() async {
//     String enteredCode =
//         _codeControllers.map((controller) => controller.text).join();
//     print("Entered code by user: " + enteredCode); // Log the entered code

//     if (enteredCode == widget.code) {
//       var reqBody = {
//         "email": widget.email,
//         "code": enteredCode,
//       };
//       var response = await http.put(Uri.parse(LinkApi.activateUser),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(reqBody));

//       var jsonResponse = jsonDecode(response.body);
//       if (jsonResponse['status']) {
//         print("User activated successfully");
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => InterestsPage(userId: widget.userId)),
//         );
//       } else {
//         print("Error activating user: ${jsonResponse['error']}");
//       }
//     } else {
//       print("Incorrect verification code");
//       _showIncorrectCodeDialog();
//     }
//   }

//   void _showIncorrectCodeDialog() {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: Text('خطأ',
//               textAlign: TextAlign.right,
//               style: TextStyle(fontFamily: 'Amiri')),
//           content: Text('رمز التحقق غير صحيح، يرجى المحاولة مرة أخرى.',
//               textAlign: TextAlign.right,
//               style: TextStyle(fontFamily: 'Amiri')),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _clearCodeFields();
//               },
//               child: Text('موافق',
//                   style:
//                       TextStyle(fontFamily: 'Amiri', color: Color(0xFF071533))),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _clearCodeFields() {
//     _codeControllers.forEach((controller) => controller.clear());
//     _focusNodes[0].requestFocus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 20,
//             right: 20,
//             child: TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => Signup(userId: widget.userId)),
//                 );
//               },
//               child: Icon(
//                 LineAwesomeIcons.angle_right_solid,
//                 color: Color(0xFF071533),
//                 size: 20,
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(height: 5),
//                     Text(
//                       'ادخل رمز التحقق',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Amiri',
//                         color: Color(0xFF071533),
//                       ),
//                     ),
//                     SizedBox(height: 20),
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
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: List.generate(
//                           5,
//                           (index) => VerificationBox(
//                             controller: _codeControllers[index],
//                             focusNode: _focusNodes[index],
//                             index: index,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 if (index < 4) {
//                                   _focusNodes[index + 1].requestFocus();
//                                 } else {
//                                   _focusNodes[index].unfocus();
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: verifyAndActivateUser,
//                         child: Text(
//                           'تحقق',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontFamily: 'Amiri',
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF071533),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 25.0, vertical: 10.0),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Handle resend code functionality
//                         },
//                         child: Text(
//                           'ارسل الرمز مرة اخرى',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Color(0xFFffe145),
//                             fontSize: 15,
//                             fontFamily: 'Amiri',
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 70,
//                     ),
//                     Image.asset(
//                       'assets/homePage/signup.png',
//                       width: 200,
//                       height: 200,
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

// class VerificationBox extends StatelessWidget {
//   final TextEditingController controller;
//   final FocusNode focusNode;
//   final int index;
//   final ValueChanged<String> onChanged;

//   const VerificationBox({
//     required this.controller,
//     required this.focusNode,
//     required this.index,
//     required this.onChanged,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40,
//       height: 50,
//       decoration: BoxDecoration(
//         border: Border.all(color: Color(0xFF071533)),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       alignment: Alignment.center,
//       child: TextField(
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         focusNode: focusNode,
//         controller: controller,
//         onChanged: onChanged,
//         style: TextStyle(fontSize: 20),
//         decoration: InputDecoration(
//           counter: Offstage(),
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }