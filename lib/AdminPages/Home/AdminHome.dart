// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

// import 'package:cytc/UserPages/Home/locationMap.dart';
// import 'package:cytc/UserPages/screen/Emergencies/Paramedics.dart';
// import 'package:cytc/UserPages/screen/Emergencies/bloodDonation.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class AdminHomePage extends StatelessWidget {

//   final String userId;
//   const AdminHomePage({Key? key, required this.userId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AdminHome(),
//     );
//   }
// }

// class AdminHome extends StatefulWidget {
//   @override
//   _AdminHomePageState createState() => _AdminHomePageState();
// }

// class _AdminHomePageState extends State<AdminHome>
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
//           body: HomePage(),
//         ),
//       ],
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool showBloodDonation = true;
//   bool showSkillsNeeded = true;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Color(0xfffafafa),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               height: screenHeight * 0.3, // Adjust height as needed
//               color: Colors.white,
//               padding: EdgeInsets.only(top: 0.99, bottom: 40),

//             ),
//             Container(
//               margin: EdgeInsets.only(top: screenHeight * 0.25),
//               padding: EdgeInsets.only(bottom: 0, top: 0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30.0),
//                   topRight: Radius.circular(30.0),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(right: 5),
//                                 child: Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     'حالات طارئة',
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontFamily: 'Amiri',
//                                       color: Color(0xFF071533),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Image.asset(
//                                 'assets/gif/alert.gif', // Replace with your gif path
//                                 width: 40,
//                                 height: 40,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               if (showSkillsNeeded)
//                                 Expanded(
//                                   child: _buildCategoryCard(
//                                     'بحاجة لمسعفين',
//                                     'assets/homePage/ambulance_icon.png',
//                                     () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => ParamedicsPage()),
//                                     ),
//                                   ),
//                                 ),
//                               if (!showSkillsNeeded)
//                                 Expanded(child: SizedBox()), // Placeholder to maintain structure
//                               if (showBloodDonation)
//                                 Expanded(
//                                   child: _buildCategoryCard(
//                                     'بحاجة لوحدات دم',
//                                     'assets/homePage/bloodBag_icon.png',
//                                     () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => BloodDonationPage()),
//                                     ),
//                                   ),
//                                 ),
//                               if (!showBloodDonation)
//                                 Expanded(child: SizedBox()), // Placeholder to maintain structure
//                             ],
//                           ),
//                           SizedBox(height: 30),
//                           Padding(
//                             padding: EdgeInsets.only(right: 15),
//                             child: Align(
//                               alignment: Alignment.topRight,
//                               child: Text(
//                                 'متطوع الشهر المثالي',
//                                 textAlign: TextAlign.right,
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontFamily: 'Amiri',
//                                   color: Color(0xFF071533),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Center(
//                             child: CustomVolunteerCard(
//                               title: 'متطوع الشهر المثالي',
//                               subtitle: 'بانه خالد حمدان',
//                               imagePath: 'assets/banah.jpg',
//                               frontText: 'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد',
//                             ),
//                           ),
//                           SizedBox(height: 40),
//                           Padding(
//                             padding: EdgeInsets.only(right: 15),
//                             child: Align(
//                               alignment: Alignment.topRight,
//                               child: Text(
//                                 'تعرف على مركزنا',
//                                 textAlign: TextAlign.right,
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontFamily: 'Amiri',
//                                   color: Color(0xFF071533),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//                             width: screenWidth * 0.8,
//                             height: screenHeight * 0.1,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0xFF071533).withOpacity(0.2),
//                                   spreadRadius: 1,
//                                   blurRadius: 6,
//                                   offset: Offset(0, 3), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             child: Center(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: 'Amiri',
//                                         ),
//                                       ),
//                                       SizedBox(width: 17),
//                                     ],
//                                   ),
//                                   Text(
//                                     'مركز تدريب الشباب المجتمعي، هو مركز يهتم بتطوير الخ الخ الخ',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontFamily: 'Amiri',
//                                     ),
//                                   ),
//                                   SizedBox(height: 20),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 40),
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(right: 15),
//                                 child: Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     'اعرف موقع المركز وقم بزيارتنا',
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontFamily: 'Amiri',
//                                       color: Color(0xFF071533),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Image.asset(
//                                 'assets/gif/map.gif',
//                                 width: screenWidth * 0.4,
//                                 height: screenHeight * 0.2,
//                               ),
//                               Center(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => MapPageHome(
//                                             destination: LatLng(32.2238, 35.2613)),
//                                       ),
//                                     );
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white,
//                                     foregroundColor: Color(0xFF071533),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     side: BorderSide(color: Colors.grey),
//                                   ),
//                                   child: Text(
//                                     'اذهب للخريطة',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontFamily: 'Amiri',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
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
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         FlipCard(
//           direction: FlipDirection.HORIZONTAL,
//           front: Container(
//             width: screenWidth * 0.8,
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
//                 SizedBox(width: 15),
//                 Container(
//                   width: 130,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.white, width: 2),
//                     image: DecorationImage(
//                       image: AssetImage(imagePath),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//               ],
//             ),
//           ),
//           back: Container(
//             width: screenWidth * 0.8,
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
//               child: Text(
//                 frontText,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   fontSize: 15,
//                 ),
//               ),
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
//       color: Color(0xFF071533),
//       margin: EdgeInsets.all(8),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Container(
//         width: 110,
//         height: 100,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(imagePath, width: 45, height: 45),
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

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  final String userId;

  const AdminHomePage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      home: AdminHome(),
    );
  }
}

class AdminHome extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHome> {
  bool isEditing1 = false;
  bool isEditing2 = false;
  TextEditingController controller1 = TextEditingController(text: 'اسم المتطوع:');
  TextEditingController controller2 = TextEditingController(text: 'المركز هو');

  void _saveEdit() {
    setState(() {
      isEditing1 = false;
      isEditing2 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildCardMostNeededArea()),
                SizedBox(width: 16),
                Expanded(child: _buildCardPopularActivities()),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildEditableCardVolunteerOfTheMonth()),
                SizedBox(width: 16),
                Expanded(child: _buildEditableCardCenterInfo()),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'قم بادخال حالات الطوارئ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildCardRequestRescuers()),
                SizedBox(width: 16),
                Expanded(child: _buildCardRequestBloodUnits()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardMostNeededArea() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 150,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'اكثر منطقة تحتاج لمسعفين بها',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardPopularActivities() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 150,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'الانشطة ذات الاقبال الاكبر',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableCardVolunteerOfTheMonth() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'متطوع الشهر',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            isEditing1
                ? TextField(
                    controller: controller1,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
                : Text(
                    controller1.text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _saveEdit,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Background color
                  ),
                  child: Text('حفظ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing1 = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color
                  ),
                  child: Text('تعديل'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableCardCenterInfo() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تعريف عن المركز',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            isEditing2
                ? TextField(
                    controller: controller2,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
                : Text(
                    controller2.text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _saveEdit,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Background color
                  ),
                  child: Text('حفظ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing2 = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color
                  ),
                  child: Text('تعديل'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardRequestRescuers() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'طلب مسعفين',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardRequestBloodUnits() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'طلب وحدات دم',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
