// // // ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// // import 'dart:convert';

// // import '../../../linkapi.dart';
// // import 'login.dart';
// // import 'verify.dart';

// // class Signup extends StatefulWidget {
// //   final String userId;
// //   const Signup({Key? key, required this.userId}) : super(key: key);
// //   @override
// //   _SignupState createState() => _SignupState();
// // }

// // class _SignupState extends State<Signup> {
// //   late TextEditingController _emailController;
// //   late TextEditingController _usernameController;
// //   late TextEditingController _passwordController;
// //   late TextEditingController _phoneNumberController; 
// //   late TextEditingController _cityController;
// //   late TextEditingController _bloodTypeController;
// //   late TextEditingController _birthdateController;

// //   late FocusNode _emailFocusNode;
// //   late FocusNode _usernameFocusNode;
// //   late FocusNode _passwordFocusNode;
// //   late FocusNode _confirmPasswordFocusNode;
// //   late FocusNode _phoneNumberFocusNode;
// //   late FocusNode _cityFocusNode;
// //   late FocusNode _bloodTypeFocusNode;
// //   late FocusNode _birthdateFocusNode;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _emailController = TextEditingController();
// //     _usernameController = TextEditingController();
// //     _passwordController = TextEditingController();
// //     _phoneNumberController = TextEditingController();
// //     _cityController = TextEditingController();
// //     _bloodTypeController = TextEditingController();
// //     _birthdateController = TextEditingController();

// //     _emailFocusNode = FocusNode();
// //     _usernameFocusNode = FocusNode();
// //     _passwordFocusNode = FocusNode();
// //     _confirmPasswordFocusNode = FocusNode();
// //     _phoneNumberFocusNode = FocusNode();
// //     _cityFocusNode = FocusNode();
// //     _bloodTypeFocusNode = FocusNode();
// //     _birthdateFocusNode = FocusNode();
// //   }

// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _usernameController.dispose();
// //     _passwordController.dispose();
// //     _phoneNumberController.dispose();
// //     _cityController.dispose();
// //     _bloodTypeController.dispose();
// //     _birthdateController.dispose();
// //     _emailFocusNode.dispose();
// //     _usernameFocusNode.dispose();
// //     _passwordFocusNode.dispose();
// //     _confirmPasswordFocusNode.dispose();
// //     _phoneNumberFocusNode.dispose();
// //     _cityFocusNode.dispose();
// //     _bloodTypeFocusNode.dispose();
// //     _birthdateFocusNode.dispose();
// //     super.dispose();
// //   }

// //   Future<void> SignupReq() async {
// //     if (_emailController.text.isNotEmpty &&
// //         _usernameController.text.isNotEmpty &&
// //         _passwordController.text.isNotEmpty &&
// //         _phoneNumberController.text.isNotEmpty &&
// //         _cityController.text.isNotEmpty &&
// //         _birthdateController.text.isNotEmpty) {
// //       var reqBody = {
// //         "email": _emailController.text,
// //         "username": _usernameController.text,
// //         "password": _passwordController.text,
// //         "phoneNumber": _phoneNumberController.text,
// //         "city": _cityController.text,
// //         "bloodType": _bloodTypeController.text,
// //         "birthdate": _birthdateController.text,
// //         "role": 0,
// //       };
// //       var response = await http.post(Uri.parse(LinkApi.signup),
// //           headers: {"Content-Type": "application/json"},
// //           body: jsonEncode(reqBody));

// //       var jsonResponse = jsonDecode(response.body);

// //       print("jsonResponse: $jsonResponse"); // Log the entire response
// //       print("status : ${jsonResponse['status']}");
// //       print("code : ${jsonResponse['verifyCode']}");

// //       if (jsonResponse['status']) {
// //         // Navigate to VerifyPage with verifyCode and email
// //         print("signup successfully");
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //               builder: (context) => VerifyPage(
// //                   code: jsonResponse['verifyCode'].toString(),
// //                   email: _emailController.text, userId: widget.userId,)),
// //         );
// //       } else {
// //         // show dialog
// //         showDialog(
// //           context: context,
// //           builder: (_) {
// //             return AlertDialog(
// //               title: const Text('Error Message'),
// //               content: Text(jsonResponse['error']), // from backend
// //               actions: [
// //                 TextButton(
// //                   onPressed: Navigator.of(context).pop,
// //                   child: Text('Ok'),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //         print("SomeThing Went Wrong in signup");
// //       }
// //     } else {
// //       showEmptyFieldsDialog();
// //     }
// //   }

// //   void showEmptyFieldsDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (_) {
// //         return AlertDialog(
// //           title: 
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               Text(
// //                 'خطأ',
// //                 textAlign: TextAlign.right,
// //                 style: TextStyle(fontFamily: 'Amiri', color: Color(0xFF071533)),
// //               ),
// //               Image.asset('assets/gif/signup.gif', width: 40,height: 40,)
// //             ],
// //           ),
// //           content: Text(
// //             'يرجى تعبئة جميع الحقول المطلوبة',
// //                 textAlign: TextAlign.right,
// //             style: TextStyle(fontFamily: 'Amiri', color: Color(0xFF071533)),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text(
// //                 'موافق',
// //                 textAlign: TextAlign.left,
// //                 style: TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145)),
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           ClipPath(
// //             clipper: BackgroundClipper(),
// //             child: Container(
// //               color: Color(0xFFffe145),
// //               height: MediaQuery.of(context).size.height * 0.55,
// //             ),
// //           ),
// //           SingleChildScrollView(
// //             child: Center(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   children: [
// //                     Align(
// //                       alignment: Alignment.topRight,
// //                       child: Padding(
// //                         padding: const EdgeInsets.only(top: 10.0),
// //                         child: TextButton(
// //                           onPressed: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId,)),
// //                             );
// //                           },
// //                           child: Icon(
// //                             LineAwesomeIcons.angle_right_solid,
// //                             color: Colors.white,
// //                             size: 20,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 5),
// //                     Text(
// //                       'قم بتعبئة المعلومات اللازمة لانشاء الحساب',
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         fontSize: 22,
// //                         fontWeight: FontWeight.bold,
// //                         fontFamily: 'Amiri',
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     Container(
// //                       width: MediaQuery.of(context).size.width * 0.8,
// //                       padding: EdgeInsets.all(16.0),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         borderRadius: BorderRadius.circular(10.0),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.black12,
// //                             blurRadius: 10.0,
// //                             offset: Offset(0, 5),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(16.0),
// //                         child: Column(
// //                           children: buildTextFields(),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     Center(
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           print("email : ${_emailController.text}");
// //                           print("username : ${_usernameController.text}");
// //                           print("password : ${_passwordController.text}");
// //                           print("phoneNumber : ${_phoneNumberController.text}");
// //                           print("city : ${_cityController.text}");
// //                           print("bloodType : ${_bloodTypeController.text}");
// //                           print("birthdate : ${_birthdateController.text}");
// //                           SignupReq();
// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Color(0xFF071533),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10.0),
// //                           ),
// //                           padding: EdgeInsets.symmetric(
// //                               horizontal: 30.0, vertical: 15.0),
// //                         ),
// //                         child: Text(
// //                           'تسجيل',
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(fontSize: 18, fontFamily: 'Amiri'),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 5),
// //                     // TextButton(
// //                     //   onPressed: () {
// //                     //     Navigator.push(
// //                     //       context,
// //                     //       MaterialPageRoute(builder: (context) => LoginPage()),
// //                     //     );
// //                     //   },
// //                     //   child: Text(
// //                     //     'هل لديك حساب؟ قم بتسجيل الدخول',
// //                     //     style: TextStyle(
// //                     //       color: Color(0xFFffe145),
// //                     //       decoration: TextDecoration.underline,
// //                     //       fontFamily: 'Amiri',
// //                     //     ),
// //                     //   ),
// //                     // ),
// //                     // SizedBox(height: 20,),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   List<Widget> buildTextFields() {
// //     return [
// //       SizedBox(height: 10),
// //       TextField(
// //         textAlign: TextAlign.right,
// //         cursorColor: Color(0xFF071533),
// //         controller: _emailController,
// //         focusNode: _emailFocusNode,
// //         decoration: InputDecoration(
// //           hintText: 'البريد الالكتروني',
// //           hintStyle: TextStyle(fontFamily: 'Amiri'),
// //           prefixIcon: Icon(LineAwesomeIcons.envelope, color: Colors.grey),
// //           filled: true,
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.all(10),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFF071533)),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //       ),
// //       SizedBox(height: 10),
// //       TextField(
// //         textAlign: TextAlign.right,
// //         cursorColor: Color(0xFF071533),
// //         controller: _usernameController,
// //         focusNode: _usernameFocusNode,
// //         decoration: InputDecoration(
// //           hintText: 'اسم المستخدم',
// //           hintStyle: TextStyle(fontFamily: 'Amiri'),
// //           prefixIcon: Icon(LineAwesomeIcons.user, color: Colors.grey),
// //           filled: true,
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.all(10),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFF071533)),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //       ),
// //       SizedBox(height: 10),
// //       TextField(
// //         textAlign: TextAlign.right,
// //         cursorColor: Color(0xFF071533),
// //         controller: _passwordController,
// //         focusNode: _passwordFocusNode,
// //         obscureText: true,
// //         decoration: InputDecoration(
// //           hintText: 'كلمة المرور',
// //           hintStyle: TextStyle(fontFamily: 'Amiri'),
// //           prefixIcon: Icon(LineAwesomeIcons.lock_solid, color: Colors.grey),
// //           filled: true,
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.all(10),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFF071533)),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //       ),
// //       SizedBox(height: 10),
// //       TextField(
// //         textAlign: TextAlign.right,
// //         cursorColor: Color(0xFF071533),
// //         controller: _phoneNumberController,
// //         focusNode: _phoneNumberFocusNode,
// //         decoration: InputDecoration(
// //           hintText: 'رقم الهاتف',
// //           hintStyle: TextStyle(fontFamily: 'Amiri'),
// //           prefixIcon: Icon(LineAwesomeIcons.phone_solid, color: Colors.grey),
// //           filled: true,
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.all(10),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFF071533)),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //       ),
// //       SizedBox(height: 10),
// //       TextField(
// //         textAlign: TextAlign.right,
// //         cursorColor: Color(0xFF071533),
// //         controller: _cityController,
// //         focusNode: _cityFocusNode,
// //         decoration: InputDecoration(
// //           hintText: 'المدينة',
// //           hintStyle: TextStyle(fontFamily: 'Amiri'),
// //           prefixIcon: Icon(LineAwesomeIcons.city_solid, color: Colors.grey),
// //           filled: true,
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.all(10),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFF071533)),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //       ),
// //       SizedBox(height: 10),
// //       TextField(
// //         textAlign: TextAlign.right,
// //         cursorColor: Color(0xFF071533),
// //         controller: _bloodTypeController,
// //         focusNode: _bloodTypeFocusNode,
// //         decoration: InputDecoration(
// //           hintText: 'فصيلة الدم',
// //           hintStyle: TextStyle(fontFamily: 'Amiri'),
// //           prefixIcon: Icon(LineAwesomeIcons.tint_solid, color: Colors.grey),
// //           filled: true,
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.all(10),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFF071533)),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //       ),
// //       SizedBox(height: 10),
// //       TextField(
// //         textAlign: TextAlign.right,
// //         cursorColor: Color(0xFF071533),
// //         controller: _birthdateController,
// //         focusNode: _birthdateFocusNode,
// //         decoration: InputDecoration(
// //           hintText: 'تاريخ الميلاد',
// //           hintStyle: TextStyle(fontFamily: 'Amiri'),
// //           prefixIcon: Icon(LineAwesomeIcons.calendar, color: Colors.grey),
// //           filled: true,
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.all(10),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFF071533)),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //       ),
// //       SizedBox(height: 20),
// //     ];
// //   }
// // }

// // class BackgroundClipper extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
// //     Path path = Path();
// //     path.lineTo(0, size.height * 0.3);
// //     path.quadraticBezierTo(
// //         size.width / 2, size.height / 2, size.width, size.height * 0.3);
// //     path.lineTo(size.width, 0);
// //     path.close();
// //     return path;
// //   }

// //   @override
// //   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
// //     return false;
// //   }
// // }

// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'dart:convert';
// import 'package:intl/intl.dart';

// import '../../../linkapi.dart';
// import 'login.dart';
// import 'verify.dart';

// class Signup extends StatefulWidget {
//   final String userId;
//   const Signup({Key? key, required this.userId}) : super(key: key);
//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   late TextEditingController _emailController;
//   late TextEditingController _usernameController;
//   late TextEditingController _passwordController;
//   late TextEditingController _phoneNumberController;
//   late TextEditingController _cityController;
//   late TextEditingController _bloodTypeController;
//   late TextEditingController _birthdateController;

//   late FocusNode _emailFocusNode;
//   late FocusNode _usernameFocusNode;
//   late FocusNode _passwordFocusNode;
//   late FocusNode _confirmPasswordFocusNode;
//   late FocusNode _phoneNumberFocusNode;
//   late FocusNode _cityFocusNode;
//   late FocusNode _bloodTypeFocusNode;
//   late FocusNode _birthdateFocusNode;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _usernameController = TextEditingController();
//     _passwordController = TextEditingController();
//     _phoneNumberController = TextEditingController();
//     _cityController = TextEditingController();
//     _bloodTypeController = TextEditingController();
//     _birthdateController = TextEditingController();

//     _emailFocusNode = FocusNode();
//     _usernameFocusNode = FocusNode();
//     _passwordFocusNode = FocusNode();
//     _confirmPasswordFocusNode = FocusNode();
//     _phoneNumberFocusNode = FocusNode();
//     _cityFocusNode = FocusNode();
//     _bloodTypeFocusNode = FocusNode();
//     _birthdateFocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _phoneNumberController.dispose();
//     _cityController.dispose();
//     _bloodTypeController.dispose();
//     _birthdateController.dispose();
//     _emailFocusNode.dispose();
//     _usernameFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     _confirmPasswordFocusNode.dispose();
//     _phoneNumberFocusNode.dispose();
//     _cityFocusNode.dispose();
//     _bloodTypeFocusNode.dispose();
//     _birthdateFocusNode.dispose();
//     super.dispose();
//   }

//   Future<void> signupReq() async {
//     if (_emailController.text.isNotEmpty &&
//         _usernameController.text.isNotEmpty &&
//         _passwordController.text.isNotEmpty &&
//         _phoneNumberController.text.isNotEmpty &&
//         _cityController.text.isNotEmpty &&
//         _birthdateController.text.isNotEmpty) {
//       var reqBody = {
//         "email": _emailController.text,
//         "username": _usernameController.text,
//         "password": _passwordController.text,
//         "phoneNumber": _phoneNumberController.text,
//         "city": _cityController.text,
//         "bloodType": _bloodTypeController.text,
//         "birthDate": _birthdateController.text, // Ensure the key is 'birthDate'
//         "role": 0,
//       };

//       print("Request Body: $reqBody");

//       try {
//         var response = await http.post(
//           Uri.parse('http://localhost:9999/user/signup'),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(reqBody),
//         );

//         if (response.statusCode == 201) {
//           var jsonResponse = jsonDecode(response.body);

//           print("jsonResponse: $jsonResponse");
//           print("status : ${jsonResponse['status']}");
//           print("code : ${jsonResponse['verifyCode']}");
//           print("userId : ${jsonResponse['userId']}");

//           if (jsonResponse['status']) {
//             print("signup successfully");
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => VerifyPage(
//                   code: jsonResponse['verifyCode'].toString(),
//                   email: _emailController.text,
//                   userId: jsonResponse['userId'].toString(),
//                 ),
//               ),
//             );
//           } else {
//             showDialog(
//               context: context,
//               builder: (_) {
//                 return AlertDialog(
//                   title: const Text('Error Message'),
//                   content:
//                       Text(jsonResponse['error'] ?? 'Unknown error occurred'),
//                   actions: [
//                     TextButton(
//                       onPressed: Navigator.of(context).pop,
//                       child: Text('Ok'),
//                     ),
//                   ],
//                 );
//               },
//             );
//             print("Something went wrong in signup: ${jsonResponse['error']}");
//           }
//         } else {
//           print("Failed to sign up. Status code: ${response.statusCode}");
//           print("Response body: ${response.body}");
//           showDialog(
//             context: context,
//             builder: (_) {
//               return AlertDialog(
//                 title: const Text('Error Message'),
//                 content: Text('Failed to sign up. Please try again later.'),
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
//       } catch (e) {
//         print("Error during sign up: $e");
//         showDialog(
//           context: context,
//           builder: (_) {
//             return AlertDialog(
//               title: const Text('Error Message'),
//               content: Text('An error occurred: $e'),
//               actions: [
//                 TextButton(
//                   onPressed: Navigator.of(context).pop,
//                   child: Text('Ok'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } else {
//       showEmptyFieldsDialog();
//     }
//   }

//   void showEmptyFieldsDialog() {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 'خطأ',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(fontFamily: 'Amiri', color: Color(0xFF071533)),
//               ),
//               Image.asset('assets/gif/signup.gif', width: 40, height: 40)
//             ],
//           ),
//           content: Text(
//             'يرجى تعبئة جميع الحقول المطلوبة',
//             textAlign: TextAlign.right,
//             style: TextStyle(fontFamily: 'Amiri', color: Color(0xFF071533)),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'موافق',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145)),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         _birthdateController.text =
//             DateFormat('yyyy-MM-dd').format(picked); // Ensure correct format
//       });
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
//               height: MediaQuery.of(context).size.height * 0.55,
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
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     LoginPage(userId: widget.userId),
//                               ),
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
//                     SizedBox(height: 5),
//                     Text(
//                       'قم بتعبئة المعلومات اللازمة لانشاء الحساب',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Amiri',
//                         color: Colors.white,
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
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: buildTextFields(),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           print("email : ${_emailController.text}");
//                           print("username : ${_usernameController.text}");
//                           print("password : ${_passwordController.text}");
//                           print("phoneNumber : ${_phoneNumberController.text}");
//                           print("city : ${_cityController.text}");
//                           print("bloodType : ${_bloodTypeController.text}");
//                           print("birthdate : ${_birthdateController.text}");
//                           signupReq();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF071533),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 30.0, vertical: 15.0),
//                         ),
//                         child: Text(
//                           'تسجيل',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 18, fontFamily: 'Amiri'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> buildTextFields() {
//     return [
//       SizedBox(height: 10),
//       TextField(
//         textAlign: TextAlign.right,
//         cursorColor: Color(0xFF071533),
//         controller: _emailController,
//         focusNode: _emailFocusNode,
//         decoration: InputDecoration(
//           hintText: 'البريد الالكتروني',
//           hintStyle: TextStyle(fontFamily: 'Amiri'),
//           prefixIcon: Icon(LineAwesomeIcons.envelope, color: Colors.grey),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF071533)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//       SizedBox(height: 10),
//       TextField(
//         textAlign: TextAlign.right,
//         cursorColor: Color(0xFF071533),
//         controller: _usernameController,
//         focusNode: _usernameFocusNode,
//         decoration: InputDecoration(
//           hintText: 'اسم المستخدم',
//           hintStyle: TextStyle(fontFamily: 'Amiri'),
//           prefixIcon: Icon(LineAwesomeIcons.user, color: Colors.grey),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF071533)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//       SizedBox(height: 10),
//       TextField(
//         textAlign: TextAlign.right,
//         cursorColor: Color(0xFF071533),
//         controller: _passwordController,
//         focusNode: _passwordFocusNode,
//         obscureText: true,
//         decoration: InputDecoration(
//           hintText: 'كلمة المرور',
//           hintStyle: TextStyle(fontFamily: 'Amiri'),
//           prefixIcon: Icon(LineAwesomeIcons.lock_solid, color: Colors.grey),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF071533)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//       SizedBox(height: 10),
//       TextField(
//         textAlign: TextAlign.right,
//         cursorColor: Color(0xFF071533),
//         controller: _phoneNumberController,
//         focusNode: _phoneNumberFocusNode,
//         decoration: InputDecoration(
//           hintText: 'رقم الهاتف',
//           hintStyle: TextStyle(fontFamily: 'Amiri'),
//           prefixIcon: Icon(LineAwesomeIcons.phone_solid, color: Colors.grey),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF071533)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//       SizedBox(height: 10),
//       TextField(
//         textAlign: TextAlign.right,
//         cursorColor: Color(0xFF071533),
//         controller: _cityController,
//         focusNode: _cityFocusNode,
//         decoration: InputDecoration(
//           hintText: 'المدينة',
//           hintStyle: TextStyle(fontFamily: 'Amiri'),
//           prefixIcon: Icon(LineAwesomeIcons.city_solid, color: Colors.grey),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF071533)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//       SizedBox(height: 10),
//       TextField(
//         textAlign: TextAlign.right,
//         cursorColor: Color(0xFF071533),
//         controller: _bloodTypeController,
//         focusNode: _bloodTypeFocusNode,
//         decoration: InputDecoration(
//           hintText: 'فصيلة الدم',
//           hintStyle: TextStyle(fontFamily: 'Amiri'),
//           prefixIcon: Icon(LineAwesomeIcons.tint_solid, color: Colors.grey),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF071533)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//       SizedBox(height: 10),
//       TextField(
//         textAlign: TextAlign.right,
//         cursorColor: Color(0xFF071533),
//         controller: _birthdateController,
//         focusNode: _birthdateFocusNode,
//         decoration: InputDecoration(
//           hintText: 'تاريخ الميلاد',
//           hintStyle: TextStyle(fontFamily: 'Amiri'),
//           prefixIcon: Icon(LineAwesomeIcons.calendar, color: Colors.grey),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.all(10),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF071533)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//           _selectDate(context);
//         },
//       ),
//       SizedBox(height: 20),
//     ];
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


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../../../linkapi.dart';
import 'login.dart';
import 'verify.dart';

class Signup extends StatefulWidget {
  final String userId;
  const Signup({Key? key, required this.userId}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController _emailController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _cityController;
  late TextEditingController _bloodTypeController;
  late TextEditingController _birthdateController;

  late FocusNode _emailFocusNode;
  late FocusNode _usernameFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  late FocusNode _phoneNumberFocusNode;
  late FocusNode _cityFocusNode;
  late FocusNode _bloodTypeFocusNode;
  late FocusNode _birthdateFocusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _cityController = TextEditingController();
    _bloodTypeController = TextEditingController();
    _birthdateController = TextEditingController();

    _emailFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _phoneNumberFocusNode = FocusNode();
    _cityFocusNode = FocusNode();
    _bloodTypeFocusNode = FocusNode();
    _birthdateFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    _bloodTypeController.dispose();
    _birthdateController.dispose();
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _cityFocusNode.dispose();
    _bloodTypeFocusNode.dispose();
    _birthdateFocusNode.dispose();
    super.dispose();
  }

  Future<void> signupReq() async {
    if (_emailController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _birthdateController.text.isNotEmpty) {
      var reqBody = {
        "email": _emailController.text,
        "username": _usernameController.text,
        "password": _passwordController.text,
        "phoneNumber": _phoneNumberController.text,
        "city": _cityController.text,
        "bloodType": _bloodTypeController.text,
        "birthDate": _birthdateController.text, // Ensure the key is 'birthDate'
        "role": 0,
      };

      print("Request Body: $reqBody");

      try {
        var response = await http.post(
          Uri.parse('http://localhost:9999/user/signup'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody),
        );

        if (response.statusCode == 201) {
          var jsonResponse = jsonDecode(response.body);

          print("jsonResponse: $jsonResponse");
          print("status : ${jsonResponse['status']}");
          print("code : ${jsonResponse['verifyCode']}");
          print("userId : ${jsonResponse['userId']}");

          if (jsonResponse['status']) {
            print("signup successfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyPage(
                  code: jsonResponse['verifyCode'].toString(),
                  email: _emailController.text,
                  userId: jsonResponse['userId'].toString(),
                ),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text('Error Message'),
                  content:
                      Text(jsonResponse['error'] ?? 'Unknown error occurred'),
                  actions: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
            print("Something went wrong in signup: ${jsonResponse['error']}");
          }
        } else {
          print("Failed to sign up. Status code: ${response.statusCode}");
          print("Response body: ${response.body}");
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Error Message'),
                content: Text('Failed to sign up. Please try again later.'),
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
      } catch (e) {
        print("Error during sign up: $e");
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('Error Message'),
              content: Text('An error occurred: $e'),
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
      showEmptyFieldsDialog();
    }
  }

  void showEmptyFieldsDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'خطأ',
                textAlign: TextAlign.right,
                style: TextStyle(fontFamily: 'Amiri', color: Color(0xFF071533)),
              ),
              Image.asset('assets/gif/signup.gif', width: 40, height: 40)
            ],
          ),
          content: Text(
            'يرجى تعبئة جميع الحقول المطلوبة',
            textAlign: TextAlign.right,
            style: TextStyle(fontFamily: 'Amiri', color: Color(0xFF071533)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'موافق',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145)),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _birthdateController.text =
            DateFormat('yyyy-MM-dd').format(picked); // Ensure correct format
      });
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
              height: MediaQuery.of(context).size.height * 0.55,
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
                                builder: (context) =>
                                    LoginPage(userId: widget.userId),
                              ),
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
                    SizedBox(height: 5),
                    Text(
                      'قم بتعبئة المعلومات اللازمة لانشاء الحساب',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                        color: Colors.white,
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
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: buildTextFields(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print("email : ${_emailController.text}");
                          print("username : ${_usernameController.text}");
                          print("password : ${_passwordController.text}");
                          print("phoneNumber : ${_phoneNumberController.text}");
                          print("city : ${_cityController.text}");
                          print("bloodType : ${_bloodTypeController.text}");
                          print("birthdate : ${_birthdateController.text}");
                          signupReq();
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
                          'تسجيل',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontFamily: 'Amiri'),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildTextFields() {
    return [
      SizedBox(height: 10),
      TextField(
        textAlign: TextAlign.right,
        cursorColor: Color(0xFF071533),
        controller: _emailController,
        focusNode: _emailFocusNode,
        decoration: InputDecoration(
          hintText: 'البريد الالكتروني',
          hintStyle: TextStyle(fontFamily: 'Amiri'),
          prefixIcon: Icon(LineAwesomeIcons.envelope, color: Colors.grey),
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
        textAlign: TextAlign.right,
        cursorColor: Color(0xFF071533),
        controller: _usernameController,
        focusNode: _usernameFocusNode,
        decoration: InputDecoration(
          hintText: 'اسم المستخدم',
          hintStyle: TextStyle(fontFamily: 'Amiri'),
          prefixIcon: Icon(LineAwesomeIcons.user, color: Colors.grey),
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
        textAlign: TextAlign.right,
        cursorColor: Color(0xFF071533),
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'كلمة المرور',
          hintStyle: TextStyle(fontFamily: 'Amiri'),
          prefixIcon: Icon(LineAwesomeIcons.lock_solid, color: Colors.grey),
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
        textAlign: TextAlign.right,
        cursorColor: Color(0xFF071533),
        controller: _phoneNumberController,
        focusNode: _phoneNumberFocusNode,
        decoration: InputDecoration(
          hintText: 'رقم الهاتف',
          hintStyle: TextStyle(fontFamily: 'Amiri'),
          prefixIcon: Icon(LineAwesomeIcons.phone_solid, color: Colors.grey),
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
        textAlign: TextAlign.right,
        cursorColor: Color(0xFF071533),
        controller: _cityController,
        focusNode: _cityFocusNode,
        decoration: InputDecoration(
          hintText: 'المدينة',
          hintStyle: TextStyle(fontFamily: 'Amiri'),
          prefixIcon: Icon(LineAwesomeIcons.city_solid, color: Colors.grey),
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
        textAlign: TextAlign.right,
        cursorColor: Color(0xFF071533),
        controller: _bloodTypeController,
        focusNode: _bloodTypeFocusNode,
        decoration: InputDecoration(
          hintText: 'فصيلة الدم',
          hintStyle: TextStyle(fontFamily: 'Amiri'),
          prefixIcon: Icon(LineAwesomeIcons.tint_solid, color: Colors.grey),
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
        textAlign: TextAlign.right,
        cursorColor: Color(0xFF071533),
        controller: _birthdateController,
        focusNode: _birthdateFocusNode,
        decoration: InputDecoration(
          hintText: 'تاريخ الميلاد',
          hintStyle: TextStyle(fontFamily: 'Amiri'),
          prefixIcon: Icon(LineAwesomeIcons.calendar, color: Colors.grey),
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
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        },
      ),
      SizedBox(height: 20),
    ];
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