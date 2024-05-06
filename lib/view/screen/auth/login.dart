// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cytc/view/homePage.dart';
import 'package:cytc/view/screen/auth/forgetPassword/forgotPassword.dart';
import 'package:cytc/view/screen/auth/Signup.dart';
import 'package:get/get.dart';
import '../../../controller/auth/loginController.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/auth/login.dart';
import '../../../main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isImageVisible = true;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  LoginController loginController = LoginController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isImageVisible =
          !_emailFocusNode.hasFocus && !_passwordFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                color: Color(0xFF9FBB73),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    TextField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      onTap: _handleFocusChange,
                      cursorColor: Color(0xFFF3B664),
                      decoration: InputDecoration(
                        labelText: 'البريد الالكتروني',
                        hintText: 'ادخل البريد الالكتروني',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF3B664),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      onTap: _handleFocusChange,
                      cursorColor: Color(0xFFF3B664),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        hintText: 'ادخل كلمة المرور',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF3B664),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:()=> LoginController.login(_emailController.text , _passwordController.text)
                      // () async {
                        // String email = _emailController.text;
                        // String password = _passwordController.text;

                        // String apiUrl = 'http://10.0.2.2:9999/user/signin';

                        // try {
                        //   // Create a map containing the email and password
                        //   Map<String, String> body = {
                        //     'email': email,
                        //     'password': password,
                        //   };
                        //   print(" 1 ");

                        //   // Convert the body to JSON
                        //   String jsonBody = json.encode(body);
                        //   print(" 2 ");
                        //   // Make a POST request to the API endpoint
                        //   http.Response response = await http.post(
                        //     Uri.parse(apiUrl),
                        //     headers: <String, String>{
                        //       'Content-Type': 'application/json',
                        //     },
                        //     body: jsonBody,
                        //   );
                        //   print(" 3 ");

                        //   // Check if the request was successful (status code 200)
                        //   if (response.statusCode == 200) {
                        //     // Parse the response JSON
                        
                        //     Map<String, dynamic> responseData =
                        //         json.decode(response.body);

                        //     // You can handle the response data here, such as saving user tokens,
                        //     // navigating to the home page, etc.

                        //     // For demonstration purposes, let's print the response data
                        //     print('Login successful:');
                        //     print(responseData["role"]);
                        //     // ignore: use_build_context_synchronously
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => homePage()),
                        //     );
                        //   } else {
                        //     // If the request was not successful, handle the error
                        //     // You can handle different status codes here, such as 400 for invalid credentials, etc.
                        //     print(
                        //         'Login failed. Status code: ${response.statusCode}');
                        //     print('Response body: ${response.body}');
                        //   }
                        // } catch (error) {
                        //   // Handle any errors that occurred during the request
                        //   print('Error during login request: $error');
                        // }
                      // }
                      ,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF3B664),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forgotPassword()),
                        );
                      },
                      child: Text(
                        'هل نسيت كلمة المرور؟',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        'انشىء حساب جديد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isImageVisible)
            Positioned(
              top: 55,
              left: 110,
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/Logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Positioned(
            bottom: 22,
            left: 16,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
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
}
