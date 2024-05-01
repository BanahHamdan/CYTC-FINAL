// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'view/screen/auth/login.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome.jpg'), 
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Color(0xFF9BCB3D), 
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF29F3D),
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
              ),
            ),
          ),
          // Positioned(
          //   bottom: 100,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     child: Center(
          //       child: Text(
          //         'اهلا بكم في تطبيق مركز تدريب الشباب المجتمعي التابع لاغاثة الطبية',
          //         style: GoogleFonts.getFont(
          //           'Lalezar',
          //           fontSize: 36.0,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Center(
//         child: Text('Login Page Content'),
//       ),
//     );
//   }
// }
