// ignore_for_file: prefer_const_constructors
import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
import 'package:cytc/BloodAdminPages/BloodAdminHome.dart';
import 'package:cytc/UserPages/Home/notification.dart';
import 'package:cytc/UserPages/interests.dart';
import 'package:cytc/UserPages/screen/auth/verify.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:cytc/main2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async'; 
import 'package:firebase_core/firebase_core.dart';

import 'UserPages/screen/auth/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCOO9-sZ1L0KFisEpTgST8CCNAktbyzP4c",
        appId: "1:225784897790:web:a95ff1c13d0ee2b95085af",
        messagingSenderId: "225784897790",
        projectId: "cytc-firebase",
        storageBucket:
            "cytc-firebase.appspot.com", // Make sure to add the storage bucket here
      ),
    ); 
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Set up the timer to navigate after 10 seconds
    Timer(Duration(seconds: 5), () {
      // Use Get.to to navigate to the next page
      Get.to(() => bar(userId: '', userRole: ''));
      // Get.to(() => LoginPage(userId: ''));
      // Get.to(() => Adminviewpost(userId: '',));
      // Get.to(() => AdminChatPage(adminId: '', adminName: '', userId: '',));
      // Get.to(() => AdminBar(userId: '', userRole: '',));
      // Get.to(() => InterestsPage(userId: '',));
      // Get.to(() => VerifyPage(code: '', email: '', userId: '',));
      // Get.to(() => main2(userId: '',));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
              child: Container(
                width: 200, // Set the desired width
                height: 200, // Set the desired height
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Logo.png'),
                    fit: BoxFit.contain, // Adjust based on your preference
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:cytc/view/screen/Emergencies/MapView.dart'; // Adjust the import path as necessary

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: FirebaseOptions(
//         apiKey: "AIzaSyCOO9-sZ1L0KFisEpTgST8CCNAktbyzP4c",
//         appId: "1:225784897790:web:a95ff1c13d0ee2b95085af",
//         messagingSenderId: "225784897790",
//         projectId: "cytc-firebase",
//         storageBucket: "cytc-firebase.appspot.com", // Make sure to add the storage bucket here
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WelcomePage(),
//     );
//   }
// }

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Get.to(() => MapPage());
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color(0xFFf3c344), // Button color
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: Text(
//             'Open Map',
//             style: TextStyle(
//               color: Color(0xFF071533),
//               fontSize: 20.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // // ignore_for_file: prefer_const_constructors

// // import 'package:cytc/view/screen/bottomBarPages/buttonBar.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // // import 'screen/bottomBarPages/calender.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GetMaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: WelcomePage(),
// //     );
// //   }
// // }

// // class WelcomePage extends StatelessWidget {
// //   const WelcomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Center( // Center the image
// //             child: Container(
// //               width: 400, // Set the desired width
// //               height: 400, // Set the desired height
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: AssetImage('assets/Logo.png'),
// //                   fit: BoxFit.contain, // Adjust based on your preference
// //                 ),
// //                 borderRadius: BorderRadius.only(),
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 100),
// //           // Positioned(
// //           //   bottom: 0,
// //           //   left: 0,
// //           //   right: 0,
// //           //   child: Padding(
// //           //     padding: EdgeInsets.symmetric(vertical: 30),
// //           //     child: Center(
// //           //       child: ElevatedButton(
// //           //         onPressed: () {
// //           //           Navigator.push(
// //           //             context,
// //           //             MaterialPageRoute(builder: (context) => bar(userId: '123', userRole: '0',)),
// //           //           );
// //           //         },
// //           //         style: ElevatedButton.styleFrom(
// //           //           backgroundColor: Color(0xFFf3c344), // Button color
// //           //           shape: RoundedRectangleBorder(
// //           //             borderRadius: BorderRadius.circular(20),
// //           //           ),
// //           //         ),
// //           //         child: Text(
// //           //           'تسجيل الدخول',
// //           //           style: TextStyle(
// //           //             color: Color(0xFF071533),
// //           //             fontSize: 20.0,
// //           //           ),
// //           //         ),
// //           //       ),
// //           //     ),
// //           //   ),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }