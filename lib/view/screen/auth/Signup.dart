// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'verify.dart';
import 'package:cytc/view/screen/auth/login.dart';

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
  late FocusNode _bloodTypeFocusNode;

  @override
  void initState() {
    super.initState();
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
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _cityFocusNode.dispose();
    _bloodTypeFocusNode.dispose();
    super.dispose();
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
                    padding: const EdgeInsets.only(right: 16, bottom: 20),
                    child: Image.asset(
                      'assets/Logo.png',
                      width: 100,
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
                    color: Color(0xFF9FBB73),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                    child: Column(
                      children: [
                        Text(
                          'قم بتعبئة المعلومات اللازمة لانشاء الحساب', // Add your text here
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
          borderSide: BorderSide(color: Color(0xFFF3B664), width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    SizedBox(height: 10),
    TextField(
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
          borderSide: BorderSide(color: Color(0xFFF3B664), width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    SizedBox(height: 10),
    TextField(
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
          borderSide: BorderSide(color: Color(0xFFF3B664), width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    SizedBox(height: 10),
    TextField(
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
          borderSide: BorderSide(color: Color(0xFFF3B664), width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    SizedBox(height: 10),
    TextField(
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
          borderSide: BorderSide(color: Color(0xFFF3B664), width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    SizedBox(height: 10),
    TextField(
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
          borderSide: BorderSide(color: Color(0xFFF3B664), width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    SizedBox(height: 30),
  ];
}

  List<Widget> buildButtons(BuildContext context) {
  return [
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerifyPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF3B664),
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
        ),
      ),
    ),
    SizedBox(height: 10),
    TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Text(
        'هل لديك حساب؟ قم بتسجيل الدخول',
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  ];
}
}