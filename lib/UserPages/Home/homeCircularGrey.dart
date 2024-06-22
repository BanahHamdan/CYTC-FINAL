// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

// import 'package:cytc/UserPages/Home/locationMap.dart';
// import 'package:cytc/UserPages/screen/Emergencies/Paramedics.dart';
// import 'package:cytc/UserPages/screen/Emergencies/bloodDonation.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class HomeTestGrey extends StatelessWidget {
  
//   final String userId;
//   final String userRole;
//   const HomeTestGrey({Key? key, required this.userId, required this.userRole}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final String userId;
//     final String userRole;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeTest(userId: Widget.userId, userRole: Widget.userRole),
//     );
//   }
// }

// class HomeTest extends StatefulWidget {
//     final String userId;
//     final String userRole;
//   const HomeTestGrey({Key? key, required this.userId, required this.userRole}) : super(key: key);
//   @override
//   _HomeTestGreyState createState() => _HomeTestGreyState();
// }

// class _HomeTestGreyState extends State<HomeTest>
//     with SingleTickerProviderStateMixin {
//   TextEditingController textEditingController = TextEditingController();
//   bool isSearchBarVisible = false;
//   late AnimationController _animationController;
//   late Animation<double> _animation;



//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   void _toggleSearchBar() {
//     setState(() {
//       isSearchBarVisible = !isSearchBarVisible;
//       if (isSearchBarVisible) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           body: HomePage(userId: widget.userId, userRole: widget.userRole),
//         ),
//       ],
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   final String userId;
//   final String userRole;
//   const HomePage({Key? key, required this.userId, required userRole}) : super(key: key);
//   @override
//   _HomePageState createState() => _HomePageState();
  
// }

// class _HomePageState extends State<HomePage> {
//   bool showBloodDonation = true;
//   bool showSkillsNeeded = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfffafafa),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               height:
//                   240, // Adjust height as needed to accommodate image and text
//               color: Colors.white,
//               padding: EdgeInsets.only(
//                   top: 0.99, bottom: 40), // Adjust padding as needed
//               child: CarouselSlider(
//                 items: [
//                   // 1st Image of Slider with Text
//                   Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(6.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: DecorationImage(
//                             image: AssetImage("assets/homePage/slider10.jpg"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Text(
//                             "نشاط رقم 1",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Amiri',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // 2nd Image of Slider with Text
//                   Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(6.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: DecorationImage(
//                             image: AssetImage("assets/homePage/slider1.jpg"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Text(
//                             "نشاط رقم 2",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Amiri',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // 3rd Image of Slider with Text
//                   Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(6.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: DecorationImage(
//                             image: AssetImage("assets/homePage/slider8.jpg"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Text(
//                             "نشاط رقم 3",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Amiri',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // 4th Image of Slider with Text
//                   Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(6.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: DecorationImage(
//                             image: AssetImage("assets/homePage/slider6.jpg"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Text(
//                             "نشاط رقم 4",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Amiri',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // 5th Image of Slider with Text
//                   Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(6.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: DecorationImage(
//                             image: AssetImage("assets/homePage/slider7.jpg"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Text(
//                             "نشاط رقم 5",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Amiri',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//                 // Slider Container properties
//                 options: CarouselOptions(
//                   height: 240.0, // Adjusted height
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 0.9,
//                 ),
//               ),
//             ),

//             Container(
//               margin: EdgeInsets.only(top: 205),
//               padding: EdgeInsets.only(
//                   bottom: 0, top: 0), // Adjust padding as needed
//               decoration: BoxDecoration(
//                 color: Colors.white, //rounded container color
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30.0),
//                   topRight: Radius.circular(30.0),
//                 ),
//               ),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           // crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(right: 5),
//                                   child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       'حالات طارئة',
//                                       textAlign: TextAlign.right,
//                                       style: TextStyle(
//                                         fontSize: 17,
//                                         fontFamily: 'Amiri',
//                                         color: Color(0xFF071533),
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Image.asset(
//                                   'assets/gif/alert.gif', // Replace with your gif path
//                                   width: 40,
//                                   height: 40,
//                                 ),
//                               ],
//                             ),
//                             Row(
//   children: [
//     if (showSkillsNeeded)
//       Expanded(
//         child: _buildCategoryCard(
//           'بحاجة لمسعفين',
//           'assets/homePage/ambulance_icon.png',
//           () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ParamedicsPage(userId: widget.userId ,userRole: widget.userRole)),
//           ),
//         ),
//       ),
//     if (!showSkillsNeeded)
//       Expanded(child: SizedBox()), // Placeholder to maintain structure
//     if (showBloodDonation)
//       Expanded(
//         child: _buildCategoryCard(
//           'بحاجة لوحدات دم',
//           'assets/homePage/bloodBag_icon.png',
//           () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => BloodDonationPage(userId: widget.userId)),
//           ),
//         ),
//       ),
//     if (!showBloodDonation)
//       Expanded(child: SizedBox()), // Placeholder to maintain structure
//   ],
// ),

//                             SizedBox(
//                               height: 30,
//                             ),
//                             ///////////////
//                             Padding(
//                               padding: EdgeInsets.only(right: 15),
//                               child: Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   'متطوع الشهر المثالي',
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontFamily: 'Amiri',
//                                     color: Color(0xFF071533),
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             ///////////////
//                             Center(
//                               child: CustomVolunteerCard(
//                                 title: 'متطوع الشهر المثالي',
//                                 subtitle: 'بانه خالد حمدان',
//                                 imagePath:
//                                     'assets/banah.jpg', // Replace with your image asset
//                                 frontText:
//                                     'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد',
//                               ),
//                             ),

//                             SizedBox(
//                               height: 40,
//                             ),

//                             Padding(
//                               padding: EdgeInsets.only(right: 15),
//                               child: Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   'تعرف على مركزنا',
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontFamily: 'Amiri',
//                                     color: Color(0xFF071533),
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               width: 300,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color(0xFF071533).withOpacity(0.2),
//                                     spreadRadius: 1,
//                                     blurRadius: 6,
//                                     offset: Offset(
//                                         0, 3), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Text(
//                                           'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: 'Amiri',
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 17,
//                                         ),
//                                         // Image.asset(
//                                         //   'assets/Logo.png',
//                                         //   width: 30,
//                                         //   height: 30,
//                                         // ),
//                                       ],
//                                     ),
//                                     Text(
//                                       'مركز تدريب الشباب المجتمعي، هو مركز يهتم بتطوير الخ الخ الخ',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontFamily: 'Amiri',
//                                       ),
//                                     ),
//                                     SizedBox(height: 20),
//                                   ],
//                                 ),
//                                 //   ],
//                               ),
//                             ),
// ///////////////////////////////////////////////////////////////////////////
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Column(
//                               // mainAxisAlignment:
//                               //     MainAxisAlignment.end,
//                               children: [
//                                 Padding(
//                               padding: EdgeInsets.only(right: 15),
//                               child: Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   'اعرف موقع المركز وقم بزيارتنا',
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontFamily: 'Amiri',
//                                     color: Color(0xFF071533),
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                                 Image.asset(
//                                   'assets/gif/map.gif',
//                                   width: 150,
//                                   height: 150,
//                                 ),
//                                 Center(
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => MapPageHome(
//                                                 destination:
//                                                     LatLng(32.2238, 35.2613), userId: widget.userId,),
//                                           ),
//                                         );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.white,
//                                         foregroundColor: Color(0xFF071533),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         side: BorderSide(color: Colors.grey),
//                                       ),
//                                       child: Text(
//                                         'اذهب للخريطة',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontFamily: 'Amiri',
//                                         ),
//                                       ),
//                                     ),
//                                 ),
//                               ],
//                             ),
// ///////////////////////////////////////////////////////////////////////
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomVolunteerCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imagePath;
//   final String frontText;

//   CustomVolunteerCard({
//     required this.title,
//     required this.subtitle,
//     required this.imagePath,
//     required this.frontText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         FlipCard(
//           direction: FlipDirection.HORIZONTAL,
//           front: Container(
//             width: 300,
//             height: 125,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0xFF071533).withOpacity(0.2),
//                   spreadRadius: 1,
//                   blurRadius: 6,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 // SizedBox(height: 50),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       subtitle,
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         fontFamily: 'Amiri',
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   width: 130,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 2,
//                     ),
//                     image: DecorationImage(
//                       image: AssetImage(imagePath),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 // SizedBox(height: 20),
//               ],
//             ),
//           ),
//           back: Container(
//             width: 300,
//             height: 125,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0xFF071533).withOpacity(0.2),
//                   spreadRadius: 1,
//                   blurRadius: 6,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Center(
//               // child: Padding(
//               // padding: EdgeInsets.fromLTRB(8, 40, 8, 8),
//               child: Text(
//                 frontText,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   fontSize: 15,
//                 ),
//               ),
//               // ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Widget _buildCategoryCard(String title, String imagePath, Function onTap) {
//   return GestureDetector(
//     onTap: () => onTap(),
//     child: Card(
//       color: Color(0xFF071533), // Set the background color of the card
//       margin: EdgeInsets.all(8),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Container(
//         width: 110,
//         height: 100, // Adjust the height of the card as needed
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(imagePath, width: 45, height: 45), // Display the image
//             SizedBox(height: 10),
//             Text(title,
//                 style: TextStyle(
//                     fontSize: 16, color: Colors.white, fontFamily: 'Amiri')),
//           ],
//         ),
//       ),
//     ),
//   );
// }


// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:cytc/UserPages/Home/locationMap.dart';
import 'package:cytc/UserPages/screen/Emergencies/Paramedics.dart';
import 'package:cytc/UserPages/screen/Emergencies/bloodDonation.dart';
import 'package:flip_card/flip_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTestGrey extends StatelessWidget {
  final String userId;
  final String userRole;

  const HomeTestGrey({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeTest(userId: userId, userRole: userRole),
    );
  }
}

class HomeTest extends StatefulWidget {
  final String userId;
  final String userRole;

  const HomeTest({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  bool isSearchBarVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleSearchBar() {
    setState(() {
      isSearchBarVisible = !isSearchBarVisible;
      if (isSearchBarVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: HomePage(userId: widget.userId, userRole: widget.userRole),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  final String userId;
  final String userRole;

  const HomePage({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBloodDonation = true;
  bool showSkillsNeeded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 240, // Adjust height as needed to accommodate image and text
              color: Colors.white,
              padding: EdgeInsets.only(top: 0.99, bottom: 40), // Adjust padding as needed
              child: CarouselSlider(
                items: [
                  _buildSliderItem("assets/homePage/slider10.jpg", "نشاط رقم 1"),
                  _buildSliderItem("assets/homePage/slider1.jpg", "حفل تخريج طلاب دورة الاسعاف المتقدم"),
                  _buildSliderItem("assets/homePage/slider8.jpg", "نشاط رقم 3"),
                  _buildSliderItem("assets/homePage/slider6.jpg", "نشاط رقم 4"),
                  _buildSliderItem("assets/homePage/slider7.jpg", "مهرجان الربيع"),
                ],
                options: CarouselOptions(
                  height: 240.0, // Adjusted height
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 205),
              padding: EdgeInsets.only(bottom: 0, top: 0), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Colors.white, // Rounded container color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildEmergencySection(),
                          _buildEmergencyCards(),
                          SizedBox(height: 30),
                          _buildVolunteerOfMonth(),
                          SizedBox(height: 10),
                          _buildCustomVolunteerCard(),
                          SizedBox(height: 40),
                          _buildCenterInfo(),
                          SizedBox(height: 40),
                          _buildMapSection(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSliderItem(String imagePath, String text) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Amiri',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmergencySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'حالات طارئة',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/gif/alert.gif', // Replace with your gif path
          width: 40,
          height: 40,
        ),
      ],
    );
  }

  Widget _buildEmergencyCards() {
    return Row(
      children: [
        if (showSkillsNeeded)
          Expanded(
            child: _buildCategoryCard(
              'بحاجة لمسعفين',
              'assets/homePage/ambulance_icon.png',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParamedicsPage(userId: widget.userId, userRole: widget.userRole)),
              ),
            ),
          ),
        if (!showSkillsNeeded) Expanded(child: SizedBox()), // Placeholder to maintain structure
        if (showBloodDonation)
          Expanded(
            child: _buildCategoryCard(
              'بحاجة لوحدات دم',
              'assets/homePage/bloodBag_icon.png',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BloodDonationPage(userId: widget.userId, userRole: widget.userRole)),
              ),
            ),
          ),
        if (!showBloodDonation) Expanded(child: SizedBox()), // Placeholder to maintain structure
      ],
    );
  }

  Widget _buildVolunteerOfMonth() {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'متطوع الشهر المثالي',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Amiri',
            color: Color(0xFF071533),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomVolunteerCard() {
    return Center(
      child: CustomVolunteerCard(
        title: 'متطوع الشهر المثالي',
        subtitle: 'بانه خالد حمدان',
        imagePath: 'assets/banah.jpg', // Replace with your image asset
        frontText: 'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد',
      ),
    );
  }

  Widget _buildCenterInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'تعرف على مركزنا',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 300,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF071533).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(width: 17),
                  ],
                ),
                Text(
                  'مركز تدريب الشباب المجتمعي، هو مركز يهتم بتطوير الخ الخ الخ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Amiri',
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'اعرف موقع المركز وقم بزيارتنا',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/gif/map.gif',
          width: 150,
          height: 150,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPageHome(
                    destination: LatLng(32.2238, 35.2613),
                    userId: widget.userId, 
                    userRole: widget.userRole,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF071533),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.grey),
            ),
            child: Text(
              'اذهب للخريطة',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Amiri',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomVolunteerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String frontText;

  CustomVolunteerCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.frontText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: Container(
            width: 300,
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF071533).withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      subtitle,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Container(
                  width: 130,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          back: Container(
            width: 300,
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF071533).withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                frontText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildCategoryCard(String title, String imagePath, Function onTap) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Card(
      color: Color(0xFF071533), // Set the background color of the card
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 110,
        height: 100, // Adjust the height of the card as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 45, height: 45), // Display the image
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Amiri'),
            ),
          ],
        ),
      ),
    ),
  );
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
