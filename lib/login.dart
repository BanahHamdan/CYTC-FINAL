// ignore_for_file: prefer_const_constructors

import 'package:cytc/homePage.dart';
import 'package:cytc/main.dart';

import 'forgotPassword.dart';
import 'package:flutter/material.dart';
import 'Signup.dart';
// import 'forgotPassword.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isImageVisible = true;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isImageVisible = !_emailFocusNode.hasFocus && !_passwordFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: Stack(
        children: [
          Container(
            color: Colors.white, // Set white background
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                color: Color(0xFF9BCB3D),
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
                      padding: const EdgeInsets.only(top: 55), // Adjust padding here
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
                      focusNode: _emailFocusNode,
                      onTap: _handleFocusChange,
                      cursorColor: Color(0xFFF29F3D), // Set the cursor color
                      decoration: InputDecoration(
                        labelText: 'البريد الالكتروني',
                        hintText: 'ادخل البريد الالكتروني',
                        filled: true,
                        fillColor: Colors.white, // Set the text field background color to white
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Circular edges for the border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF29F3D),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        
                        labelStyle: TextStyle(
                          color: _emailFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black, // Change color conditionally
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      focusNode: _passwordFocusNode,
                      onTap: _handleFocusChange,
                      cursorColor: Color(0xFFF29F3D), // Set the cursor color
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        hintText: 'ادخل كلمة المرور',
                        filled: true,
                        fillColor: Colors.white, // Set the text field background color to white
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Circular edges for the border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF29F3D),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: TextStyle(
                          color: _passwordFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black, // Change color conditionally
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF29F3D), // Match the design color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Circular edges
                        ),
                      ),
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => forgotPassword()), // Navigate to Signup page
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
                          MaterialPageRoute(builder: (context) => Signup()), // Navigate to Signup page
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
          if (_isImageVisible) // Show the image only if _isImageVisible is true
            Positioned(
              top: 55,
              left: 110,
              child: Container(
                width: 200, // Set the width of the image container
                height: 200, // Set the height of the image container
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
}
