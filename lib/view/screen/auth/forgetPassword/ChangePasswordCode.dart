// change_password_code.dart

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cytc/view/screen/auth/forgetPassword/forgotPassword.dart';
import 'package:cytc/view/screen/auth/forgetPassword/modifyPassword.dart';
import 'package:flutter/material.dart';

class ChangePasswordCode extends StatelessWidget {
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
                width: MediaQuery.of(context).size.width *
                    0.9, // Set width of the green box to 80% of the screen width
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
                      'أدخل رمز التحقق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      textAlign: TextAlign.right,
                      cursorColor: Color(0xFFf3c344),
                      decoration: InputDecoration(
                        // labelText: 'رمز التحقق',
                        hintText: 'ادخل رمز التحقق ',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFf3c344),
                            width: 3.0,
                          ),
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
                      alignment: MainAxisAlignment.center, // Center the button
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => modifyPasswordPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'تحقق',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF071533),
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
                Navigator.push(context,
                          MaterialPageRoute(builder: (context) => forgotPassword()),);
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
