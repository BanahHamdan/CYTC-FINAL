// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'verify.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late FocusNode _emailFocusNode;
  late FocusNode _usernameFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  late FocusNode _phoneNumberFocusNode;
  late FocusNode _cityFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _phoneNumberFocusNode = FocusNode();
    _cityFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _cityFocusNode.dispose();
    super.dispose();
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
            top: 16,
            right: 16,
            child: Image.asset(
              'assets/Logo.png', 
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 25),
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'انشاء حساب جديد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      focusNode: _emailFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'البريد الالكتروني',
                        hintText: 'ادخل البريد الالكتروني',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF29F3D), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: TextStyle(
                          color: _emailFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      focusNode: _usernameFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_usernameFocusNode);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'اسم المستخدم',
                        hintText: 'ادخل اسم المستخدم',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF29F3D), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: TextStyle(
                          color: _usernameFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      focusNode: _passwordFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        });
                      },
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
                          borderSide: BorderSide(color: Color(0xFFF29F3D), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: TextStyle(
                          color: _passwordFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      focusNode: _confirmPasswordFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'تأكيد كلمة المرور',
                        hintText: 'ادخل تأكيد كلمة المرور',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF29F3D), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: TextStyle(
                          color: _confirmPasswordFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      focusNode: _phoneNumberFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'رقم الهاتف',
                        hintText: 'ادخل رقم الهاتف',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF29F3D), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: TextStyle(
                          color: _phoneNumberFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      focusNode: _cityFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_cityFocusNode);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'المدينة',
                        hintText: 'ادخل اسم المدينة التي تسكن بها',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF29F3D), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: TextStyle(
                          color: _cityFocusNode.hasFocus ? Color(0xFFF29F3D) : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the Verify page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPage()));
                      },
                      child: Text(
                        'انشىء الحساب',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF29F3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                Navigator.of(context).pop();
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



// void main() {
//   runApp(MaterialApp(
//     home: Signup(),
//   ));
// }
