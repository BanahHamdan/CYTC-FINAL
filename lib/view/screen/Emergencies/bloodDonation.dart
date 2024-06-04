// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class BloodDonationPage extends StatefulWidget {
  @override
  _BloodDonationPageState createState() => _BloodDonationPageState();
}

class _BloodDonationPageState extends State<BloodDonationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _colorTween = _controller.drive(
      ColorTween(
        begin: Colors.transparent,
        end: Color(0xFFd54043),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showLastDonationDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تاريخ اخر تبرع بالدم',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF071533),
                          ),
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          'assets/calendar_icon.png', // Replace with the path to your image
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Color(0xFFd54043),
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            '5/3/2023', // Example date in Arabic
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 20,
              color: Color(0xFF071533),
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 350, // Adjust height as needed
              color: Color(0xFFffe145), // Yellow color    اعتمدي هاد اكيد
              child: Center(
                child: Image.asset(
                  'assets/bloodEmergency1.png', // Replace with your image path
                  width: 270, // Adjust the width as needed
                  height: 270, // Adjust the height as needed
                  fit: BoxFit.contain, // Adjust the fit as needed
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 8,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => bar(userId: null, userRole: null,)),
                  // );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 300),
              padding: EdgeInsets.only(top: 20), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 130),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ///
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Adjust the spacing between icon and text
                                Image.asset(
                                  'assets/emergency_icon.png', // Replace with the path to your image
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'بحاجة لوحدات دم بشكل طارئ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF071533),
                                    fontFamily: 'Amiri',
                                    shadows: [
                                      Shadow(
                                        blurRadius: 20.0,
                                        color: _colorTween.value!,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 7),
                                Image.asset(
                                  'assets/emergency_icon.png', // Replace with the path to your image
                                  width: 20,
                                  height: 20,
                                ),
                                // SizedBox(width: 5),
                                // Text(
                                //   '🚨', // Emergency icon
                                //   style: TextStyle(
                                //     fontSize: 24,
                                //     fontFamily:
                                //         'Segoe UI Emoji', // Specify a font that supports colored emojis
                                //   ),
                                // ),
                              ],
                            );
                          },
                        ),

                        ///
                        SizedBox(height: 20),
                        // FaIcon(
                        //   FontAwesomeIcons.tint,
                        //   size: 100,
                        //   color: Colors.red,
                        // ),
                        // SizedBox(height: 20),
                        // SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Padding(padding: EdgeInsets.only(right: 120)),
                                Text(
                                  'مستشفى النجاح ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Amiri',
                                    color: Color(0xFF071533),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  ':اسم المستشفى',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Amiri',
                                    color: Color(0xFF071533),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(right: 40)),
                                Text(
                                  'AB ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Amiri',
                                    color: Color(0xFF071533),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  ':فصيلة الدم المطلوبة',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Amiri',
                                    color: Color(0xFF071533),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'ملاحظة: يجب ان يكون قد مر على الاقل 3 شهور منذ اخر مرة قمت بالتبرع بالدم بها',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Amiri',
                              color: Color(0xFFd54043),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _showLastDonationDateDialog(context);
                          },
                          child: Text(
                            'اعرف تاريخ اخر مرة تبرعت بها بالدم',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Amiri',
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF071533),
                            padding: EdgeInsets.all(15),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//     return Scaffold(
//       body: Column(
//         children: [
//           // Top purple section
//           Container(
//             color: Color(0xFF7A4DFF), // Purple color
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//             child: Column(
//               children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             icon: Icon(Icons.close, color: Colors.white, size: 30),
//             onPressed: () {
//               // Close the page or navigate back
//             },
//           ),
//           Text(
//             '12:41',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ],
//       ),
//       SizedBox(height: 20),
//       Image.asset(
//         'assets/top_up.png',
//         width: 150,
//         height: 150,
//       ),
//       SizedBox(height: 20),
//       Text(
//         'إضافة أموال للحساب',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           fontFamily: 'Amiri',
//         ),
//       ),
//       SizedBox(height: 10),
//       Text(
//         'أضف الأموال إلى حسابك باستخدام أي من الطرق التالية',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//           fontFamily: 'Amiri',
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ],
//   ),
// ),
//           // Bottom white section
//         ],
//       ),
//     );
//   }
// }

// import 'package:cytc/view/screen/bottomBarPages/buttonBar.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class BloodDonationApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Emergency Blood Donation',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: BloodDonationPage(),
//     );
//   }
// }

// class BloodDonationPage extends StatefulWidget {
//   @override
//   _BloodDonationPageState createState() => _BloodDonationPageState();
// }

// class _BloodDonationPageState extends State<BloodDonationPage> {
//   String hospitalName = 'City Hospital';
//   String bloodType = 'A+';

//   void _updateDetails(String newHospital, String newBloodType) {
//     setState(() {
//       hospitalName = newHospital;
//       bloodType = newBloodType;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(105.0), // Set the height you want
//         child: ClipRRect(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFFf3c344),
//                   Color(0xFFffe145),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0xFF071533).withOpacity(0.3),
//                   spreadRadius: 2,
//                   blurRadius: 10,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 Icons.arrow_back_ios_new,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         bar(userId: null, userRole: null),
//                                   ),
//                                 );
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.menu,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {
//                                 // Add functionality for burger menu
//                               },
//                             ),
//                           ],
//                         ),
//                         Text(
//                           'حالات طارئة',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Amiri',
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 // Add functionality for notification icon
//                               },
//                               padding: EdgeInsets.zero,
//                               icon: Container(
//                                 padding: EdgeInsets.all(4),
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0xFF071533),
//                                 ),
//                                 child: Icon(
//                                   Icons.notifications,
//                                   color: Colors.white,
//                                   size: 18,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 5),
//                             GestureDetector(
//                               onTap: () {
//                                 // Add functionality to navigate to profile page
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 16.0),
//                                 child: Container(
//                                   width: 30,
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 2,
//                                     ),
//                                     image: DecorationImage(
//                                       image: AssetImage('assets/banah.jpg'),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Container(
//                       height: 30,
//                       margin: EdgeInsets.fromLTRB(120, 0, 120, 0),
//                       decoration: BoxDecoration(
//                         color:
//                             Color.fromARGB(255, 247, 250, 252).withOpacity(0.5),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: TextField(
//                         textAlign: TextAlign.right,
//                         cursorColor: Colors.white.withOpacity(0.9),
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(top: 0),
//                           hintText: '... ابحث',
//                           hintStyle: TextStyle(
//                             color: Colors.white.withOpacity(0.9),
//                             fontFamily: 'Amiri',
//                             fontSize: 15,
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               Icons.search,
//                               color: Colors.white.withOpacity(0.9),
//                               size: 18,
//                             ),
//                             onPressed: () {
//                               // Search functionality
//                             },
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: <Widget>[
//     Text(
//       '🚨 بحاجة لوحدات دم بشكل طارئ 🚨',
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFF071533),  //0xFFFFD700
//         fontFamily: 'Amiri',
//       ),
//       textAlign: TextAlign.center,
//     ),
//     SizedBox(height: 20),
//     FaIcon(
//       FontAwesomeIcons.tint,
//       size: 100,
//       color: Colors.red,
//     ),
//     SizedBox(height: 20),
//     Text(
//       'نحن نحتاج مساعدتك',
//       style: TextStyle(
//         fontSize: 22,
//         fontWeight: FontWeight.bold,
//         fontFamily: 'Amiri',
//         color: Color(0xFF071533),
//       ),
//       textAlign: TextAlign.center,
//     ),
//     SizedBox(height: 10),
//     Text(
//       'اسم المستشفى: 🏥 $hospitalName',
//       style: TextStyle(
//         fontSize: 20,
//         fontFamily: 'Amiri',
//         color: Color(0xFF071533),
//       ),
//       textAlign: TextAlign.center,
//     ),
//     SizedBox(height: 10),
//     Text(
//       'فصيلة الدم المطلوبة: ❤️ $bloodType',
//       style: TextStyle(
//         fontSize: 20,
//         fontFamily: 'Amiri',
//         color: Color(0xFF071533),
//       ),
//       textAlign: TextAlign.center,
//     ),
//     SizedBox(height: 30),
//     ElevatedButton.icon(
//       onPressed: () {
//         // _showUpdateDialog(context);
//       },
//       icon: FaIcon(FontAwesomeIcons.handHoldingHeart),
//       label: Text(
//         'تبرع الان',
//         style: TextStyle(fontSize: 18, fontFamily: 'Amiri',),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color(0xFF071533),
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//         textStyle: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//     SizedBox(height: 20),
//     Text(
//       'بتبرعك يمكن ان تنقذ حياة 💪',
//       style: TextStyle(
//         fontSize: 18,
//         fontStyle: FontStyle.italic,
//         fontFamily: 'Amiri',
//         color: Color(0xFF071533),
//       ),
//       textAlign: TextAlign.center,
//     ),
//     SizedBox(height: 10),
//     Text(
//       'شكرا لك لدعمك 😊',
//       style: TextStyle(
//         fontSize: 18,
//         fontStyle: FontStyle.italic,
//         fontFamily: 'Amiri',
//         color: Color(0xFF071533),
//       ),
//       textAlign: TextAlign.center,
//     ),
//   ],
// ),
//         ),
//       ),
//     );
//   }
// }
