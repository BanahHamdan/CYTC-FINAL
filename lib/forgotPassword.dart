// ignore_for_file: prefer_const_constructors

import 'package:cytc/ChangePasswordCode.dart';
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
                width: MediaQuery.of(context).size.width * 0.9, // Set width of the green box to 80% of the screen width
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  color: Color(0xFF9BCB3D),
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      cursorColor: Color(0xFFF29F3D),
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
                            color: Color(0xFFF29F3D),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                              MaterialPageRoute(builder: (context) => ChangePasswordCode()),
                            );                          
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF29F3D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'ارسل رمز التحقق',
                            style: TextStyle(
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
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Color(0xFF9BCB3D),
              iconSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
