 // ignore_for_file: prefer_const_constructors

import 'package:cytc/view/buttonBar.dart';
import 'package:cytc/view/screen/auth/forgetPassword/ChangePasswordCode.dart';
// import 'package:cytc/view/forgotPassword.dart';
import 'package:cytc/view/homePage.dart';
import 'package:flutter/material.dart';

class modifyPasswordPage extends StatelessWidget {
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
                      'تغيير كلمة المرور',
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
                      obscureText: true,
                      cursorColor: Color(0xFFf3c344),
                      decoration: InputDecoration(
                        // labelText: 'ادخل كلمة المرور الجديدة',
                        hintText: 'ادخل كلمة المرور الجديدة',
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
                    TextField(
                      textAlign: TextAlign.right,
                      obscureText: true,
                      cursorColor: Color(0xFFf3c344),
                      decoration: InputDecoration(
                        // labelText: 'اعد كتابة كلمة المرور',
                        hintText: 'اعد كتابة كلمة المرور',
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        //edit
                        MaterialPageRoute(builder: (context) => homePage(userId: null, userRole: null,)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // minimumSize: Size(double.infinity, 50), // Adjust button size here
                      ),
                      child: Container(
                         child: Center(
                          child: Text(
                            'تأكيد الكلمة الجديدة',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF071533),
                            ),
                          ),
                        ),
                      ),
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
                  MaterialPageRoute(builder: (context) => ChangePasswordCode()),
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