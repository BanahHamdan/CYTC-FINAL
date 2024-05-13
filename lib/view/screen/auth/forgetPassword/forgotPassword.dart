// ignore_for_file: prefer_const_constructors

import 'package:cytc/view/screen/auth/forgetPassword/ChangePasswordCode.dart';
import 'package:cytc/view/screen/auth/login.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  color: Color(0xFF071533),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'هل نسيت كلمة المرور؟',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      textAlign: TextAlign.right,
                      cursorColor: Color(0xFFf3c344),
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.fromLTRB(
                        //     180, 20, 10, 20), // Adjust padding
                        hintText: 'ادخل البريد الالكتروني',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFf3c344), width: 3.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // hintStyle: TextStyle(
                        //   color: Colors.grey, // Default hint color
                        // ),
                        // labelStyle: TextStyle(
                        //   color: Colors.black, // Black label color
                        // ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordCode()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'ارسل رمز التحقق',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.arrow_back),
              color: Color(0xFF071533),
              iconSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
