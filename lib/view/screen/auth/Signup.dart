// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:cytc/view/screen/auth/verify.dart';
import 'package:flutter/material.dart';
import '../../../linkapi.dart';
import 'package:cytc/view/screen/auth/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatefulWidget {
  const Signup({super.key});

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
  late FocusNode _emailFocusNode;
  late FocusNode _usernameFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  late FocusNode _phoneNumberFocusNode;
  late FocusNode _cityFocusNode;
  late FocusNode _bloodTypeFocusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _cityController = TextEditingController();
    _bloodTypeController = TextEditingController();

    _emailFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _phoneNumberFocusNode = FocusNode();
    _cityFocusNode = FocusNode();
    _bloodTypeFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    _bloodTypeController.dispose();
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _cityFocusNode.dispose();
    _bloodTypeFocusNode.dispose();
    super.dispose();
  }

  Future<void> SignupReq() async {
    if (_emailController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _cityController.text.isNotEmpty) {
      var reqBody = {
        "email": _emailController.text,
        "username": _usernameController.text,
        "password": _passwordController.text,
        "phoneNumber": _phoneNumberController.text,
        "city": _cityController.text,
        "bloodType": _bloodTypeController.text,
        "role": 0,
      };
      // LinkApi.login == http://10.0.2.2:9999/user/signin
      var response = await http.post(Uri.parse(LinkApi.signup),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);

      print("status : ${jsonResponse['status']}");
      print("code : ${jsonResponse['verifyCode']}");

      if (jsonResponse['status']) {
        // TODO pass token
        print("signup successfully");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  VerifyPage(code: jsonResponse['verifyCode'].toString())),
        );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => bar(
        //             userId: jsonResponse['id'],
        //             userRole: jsonResponse['role'])));
      } else {
        // dialog
        // showDialog(
        //   context: context,
        //   builder: (_) {
        //     return AlertDialog(
        //       title: const Text('Error Message'),
        //       content: Text(jsonResponse['message']), // from backend
        //       actions: [
        //         TextButton(
        //           onPressed: Navigator.of(context).pop,
        //           child: Text('Ok'),
        //         ),
        //       ],
        //     );
        //   },
        // );
        print("SomeThing Went Wrong in login");
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SingleChildScrollView(
            // Make the entire body scrollable
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 110, bottom: 20),
                    child: Image.asset(
                      'assets/Logo.png',
                      width: 190,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(5), // Adjust padding as needed
                  // margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Color(0xFF071533),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                    child: Column(
                      children: [
                        Text(
                          'قم بتعبئة المعلومات اللازمة لانشاء الحساب', // Add your text here
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20), // Add some spacing after the text
                        ...buildTextFields(),
                        ...buildButtons(context),
                      ],
                      // children: buildTextFields() + buildButtons(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 22,
            left: 16,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); // Navigate back to the previous page
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 32,
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
        cursorColor: Color(0xFFf3c344),
        controller: _emailController,
        focusNode: _emailFocusNode,
        decoration: InputDecoration(
          // labelText: 'البريد الالكتروني',
          hintText: 'البريد الالكتروني',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFf3c344), width: 3.0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        textAlign: TextAlign.right,
        cursorColor: Color(0xFFf3c344),
        controller: _usernameController,
        focusNode: _usernameFocusNode,
        decoration: InputDecoration(
          // labelText: 'اسم المستخدم',
          hintText: 'اسم المستخدم',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFf3c344), width: 3.0),
            borderRadius: BorderRadius.circular(20),
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
          // labelText: 'كلمة المرور',
          hintText: 'كلمة المرور',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFf3c344), width: 3.0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        textAlign: TextAlign.right,
        cursorColor: Color(0xFFf3c344),
        controller: _phoneNumberController,
        focusNode: _phoneNumberFocusNode,
        decoration: InputDecoration(
          // labelText: 'رقم الهاتف',
          hintText: 'رقم الهاتف',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFf3c344), width: 3.0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        textAlign: TextAlign.right,
        cursorColor: Color(0xFFf3c344),
        controller: _cityController,
        focusNode: _cityFocusNode,
        decoration: InputDecoration(
          // labelText: 'المدينة',
          hintText: 'المدينة',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFf3c344), width: 3.0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        textAlign: TextAlign.right,
        cursorColor: Color(0xFFf3c344),
        controller: _bloodTypeController,
        focusNode: _bloodTypeFocusNode,
        decoration: InputDecoration(
          // labelText: 'فصيلة الدم',
          hintText: 'فصيلة الدم',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFf3c344), width: 3.0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
    ];
  }

  List<Widget> buildButtons(BuildContext context) {
    return [
      ElevatedButton(
        onPressed: () {
          // بدنا نعمل فنكشن لل api
          print("email : ${_emailController.text}");
          print("username : ${_usernameController.text}");
          print("password : ${_passwordController.text}");
          print("phoneNumber : ${_phoneNumberController.text}");
          print("city : ${_cityController.text}");
          print("bloodType : ${_bloodTypeController.text}");
          SignupReq();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => VerifyPage()),
          // );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
        child: Text(
          'تسجيل',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF071533),
          ),
        ),
      ),
      SizedBox(height: 5),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 23), // Adjust horizontal padding as needed
          child: Text(
            'هل لديك حساب؟ قم بتسجيل الدخول',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    ];
  }
}
