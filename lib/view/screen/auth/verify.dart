// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cytc/view/screen/auth/Signup.dart';
// import 'package:cytc/view/main.dart';
import 'package:flutter/material.dart';

import '../../main.dart';


class VerifyPage extends StatefulWidget {
  final code;
    // const bar({Key? key, required this.userId, required this.userRole});

  const VerifyPage({super.key,required this.code});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {  
  @override
  void initState() {
    super.initState();
    print("---------------------");
    print("code "+widget.code);
    print("---------------------");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Color(0xFF071533), // Set green color as background
            ),
          ),
          Positioned(
            left: 16,
            bottom: 22,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 32,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ادخل رمز التحقق',
                  style: TextStyle(fontSize: 25, color: Colors.white), // Set text color to white
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(30), // Add padding to create space around text boxes
                  width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set white color as background
                    borderRadius: BorderRadius.circular(20), // Add border radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      VerificationBox(),
                      SizedBox(width: 10),
                      VerificationBox(),
                      SizedBox(width: 10),
                      VerificationBox(),
                      SizedBox(width: 10),
                      VerificationBox(),
                      SizedBox(width: 10),
                      VerificationBox(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => WelcomePage()),
                    // );                  
                  },
                  child: Text(
                    'تحقق',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF071533),
                    ),
                    ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Adjust the border radius as needed
                    ),
                  ),
                ),
                 SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => forgotPassword()), // Navigate to Signup page
                        // );
                      },
                      child: Text(
                        'ارسل الرمز مرة اخرى',
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
        ],
      ),
    );
  }
}

class VerificationBox extends StatelessWidget {
  const VerificationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF071533)),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
