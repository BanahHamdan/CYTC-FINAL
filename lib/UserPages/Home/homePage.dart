// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sort_child_properties_last
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// // import 'package:flutter/material.dart';

// import 'package:cytc/UserPages/screen/Emergencies/Paramedics.dart';
// import 'package:cytc/UserPages/screen/Emergencies/bloodDonation.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Campaigns/Campaigns_list(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Events/events_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Festivals/Fest_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:flutter/material.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/material.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Events/events_main(1).dart';

// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// class homePage extends StatefulWidget {
//   final userId;
//   final userRole;
//   @override
//   _homePageState createState() => _homePageState();

//   const homePage({
//     Key? key,
//     required this.userId,
//     required this.userRole,
//   }) : super(key: key);
// }

// ///////////////text with icon in the emergensies//////////////////
// Widget buildTextWithIcon(
//     {required String text, IconData? icon, required BuildContext context}) {
//   return GestureDetector(
//     onTap: () {
//       // Navigate to the desired page
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => homePage(
//                   userId: null,
//                   userRole: null,
//                 )),
//       );
//     },
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end, // Align icon and text
//       children: [
//         Text(
//           text,
//           style: TextStyle(
//             color: Color(0xFF071533),
//             fontSize: 17,
//           ),
//         ),
//         SizedBox(width: 8), // Add some spacing between icon and text
//         Icon(
//           icon,
//           color: Color(0xFF52a895), // Icon color
//           size: 24, // Icon size
//         ),
//       ],
//     ),
//   );
// }

// //////////////////////ل اول وحدة///////////////////////
// class CategoryBoxFirst extends StatelessWidget {
//   final String categoryName;
//   final String imagePath;
//   final VoidCallback onTap;

//   const CategoryBoxFirst({
//     super.key,
//     required this.categoryName,
//     required this.imagePath,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10.0),
//         // width: 180,
//         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//         decoration: BoxDecoration(
//           border: Border.all(color: Color(0xFF071533)),
//           borderRadius: BorderRadius.circular(25.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 imagePath,
//                 height: 130,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 5),
//             Directionality(
//               textDirection:
//                   TextDirection.rtl, // Set text direction to right-to-left
//               child: Text(
//                 categoryName,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ////////////////////////////للاربعة اللي تحت/////////////////////////////
// class CategoryBox extends StatelessWidget {
//   final String categoryName;
//   final String imagePath;
//   final VoidCallback onTap;

//   const CategoryBox({
//     super.key,
//     required this.categoryName,
//     required this.imagePath,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10.0),
//         width: 180, // Adjust the width as needed
//         decoration: BoxDecoration(
//           border: Border.all(color: Color(0xFF071533)),
//           borderRadius: BorderRadius.circular(25.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 imagePath,
//                 height: 130, // Adjust the height as needed
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: Text(
//                 categoryName,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ////////////////////////////////////////////////////
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Location Details'),
// //         ),
// //         body: LocationDetails(),
// //       ),
// //     );
// //   }
// // }

// class _homePageState extends State<homePage> with TickerProviderStateMixin {
//   // int _currentPageIndex = 0;
//   int selectTab = 0; // Set default selected tab to homePage
//   late Widget selectPageView;

//   @override
//   void initState() {
//     super.initState();
//     selectPageView = homePage(
//       userId: null,
//       userRole: null,
//     );
//   }

//   bool showSecondText = false;
//   final List<bool> _isOpen = [false, false];
// // Define a TextEditingController to control the text field
//   TextEditingController textEditingController = TextEditingController();
//   bool isSearchBarVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     /////////////////////////////////////////
//     final _drawerItems = [
//       ListTile(
//         title: Text('Our Programs'),
//         onTap: () => print('Our Programs'),
//       ),
//       ListTile(
//         title: Text('Donation Opportunities'),
//         onTap: () => print('Donation Opportunities'),
//       ),
//       ListTile(
//         title: Text('Endowment'),
//         onTap: () => print('Endowment'),
//       ),
//       ListTile(
//         title: Text('Home'),
//         onTap: () => print('Home'),
//       ),
//     ];
//     ////////////////////////////////////////
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           children: _drawerItems,
//         ),
//       ),
//       body: SingleChildScrollView(
//         //  child: AspectRatio(   ///
//         // aspectRatio: 16 / 9, ///
//         child: Stack(
//           // crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
// ///////////////////////Image container////////////////////////
//             Container(
//               height: 270, // Adjust height as needed
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/mainYellow.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
// // icons //
//             // Positioned(
//             //   top: 27,
//             //   left: 20,
//             //   child: IconButton(
//             //     icon: Icon(Icons.menu, color: Colors.white),
//             //     onPressed: () {
//             //       // Add your onPressed logic here
//             //     },
//             //   ),
//             // ),

//             Positioned(
//               top: 35,
//               right: 5,
//               child: GestureDetector(
//                 onTap: () {
//                   // Add functionality to navigate to profile page
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(right: 20),
//                   width: 35, // Adjust the width as needed
//                   height: 35, // Adjust the height as needed
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white, width: 2),
//                     image: DecorationImage(
//                       image: AssetImage('assets/banah.jpg'),
//                       // fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 28,
//               right: 60,
//               child: IconButton(
//                 onPressed: () {
//                   // Add functionality for notification icon
//                 },
//                 padding:
//                     EdgeInsets.zero, // Remove padding around the icon button
//                 icon: Container(
//                   padding: EdgeInsets.all(4),
//                   // decoration: BoxDecoration(
//                   //   color:
//                   //       Color(0xFFEC8F5E), // Notification icon background color
//                   //   shape: BoxShape.circle,
//                   // ),
//                   child: Icon(
//                     Icons.notifications, // Notification icon
//                     color: Colors.white, // Notification icon color
//                     // size: 17,
//                   ),
//                 ),
//               ),
//             ),
//             // Second icon at the top right corner
//             Positioned(
//               top: 30,
//               right: 90,
//               child: Visibility(
//                 visible: !isSearchBarVisible,
//                 child: IconButton(
//                   icon: Icon(Icons.search, color: Colors.white),
//                   onPressed: () {
//                     setState(() {
//                       isSearchBarVisible = !isSearchBarVisible;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             // Positioned(
//             //   top: 20,
//             //   right: 20,
//             Visibility(
//               visible:
//                   isSearchBarVisible, // Control the visibility of the search bar
//               child: Expanded(
//                 child: Container(
//                   height: 35,
//                   margin: EdgeInsets.fromLTRB(100, 35, 100, 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: TextField(
//                     textAlign: TextAlign.right,
//                     controller:
//                         textEditingController, // Assign the TextEditingController to the TextField
//                     cursorColor:
//                         Color(0xFF071533), // Customize the color of the cursor
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.only(top: 0),
//                       hintText: '...ابحث',
//                       hintStyle: TextStyle(
//                           color: Colors
//                               .grey), // Customize the color of the hint text
//                       prefixIcon: Icon(Icons.search,
//                           color: Color(0xFF071533)), // Search icon
//                       border: InputBorder.none,
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.clear,
//                             color: Color(0xFF071533),
//                             size: 20), // Clear icon to clear the search text
//                         onPressed: () {
//                           setState(() {
//                             // Clear the search text and hide the search bar
//                             isSearchBarVisible = false;
//                             // Clear the text field
//                             // You need to define the TextEditingController for this
//                             // textEditingController.clear();
//                           });
//                         },
//                       ),
//                     ),
//                     // Define a TextEditingController to control the text field
//                     // controller: textEditingController,
//                     // Add more properties as needed
//                     // Add an onTap callback to the search icon to perform a search action
//                     onTap: () {
//                       // Perform search action here
//                       // You can access the search query using the TextEditingController
//                       // For example:
//                       // String searchQuery = textEditingController.text;
//                       // Perform search using the searchQuery
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             // ),

// ////////////////////////////////////////////////////////////
//             Container(
//               margin: EdgeInsets.only(top: 230),
//               // EdgeInsets.symmetric(
//               //     vertical: 230), // Adjust margins as needed
//               // padding: EdgeInsets.only(top: 100, bottom: 10, left: 0, right: 0),
//               padding: EdgeInsets.only(bottom: 0), // Adjust padding as needed
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50.0),
//                   topRight: Radius.circular(50.0),
//                 ),
//               ),
//               // child: SingleChildScrollView(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
// //////////////////////////اعلانات هامة/////////////////////
//                     // Container with 'حالات طارئة' text and icon
//                     // Container(
//                     //   margin: EdgeInsets.fromLTRB(220, 20, 25, 10),
//                     //   decoration: BoxDecoration(
//                     //     color: Color(0xFF52a895),
//                     //     borderRadius: BorderRadius.circular(50),
//                     //   ),
//                     //   child: Row(
//                     //     textDirection: TextDirection.rtl,
//                     //     mainAxisAlignment: MainAxisAlignment
//                     //         .spaceBetween, // Align icon and text
//                     //     children: [
//                     //       Row(// Added Row to contain text and icon
//                     //           children: [
//                     //         Text(
//                     //           '  حالات طارئة ',
//                     //           style: TextStyle(
//                     //             color: Colors.white,
//                     //             fontWeight: FontWeight.bold,
//                     //             fontSize: 20,
//                     //           ),
//                     //         ),
//                     //         Padding(
//                     //           padding: const EdgeInsets.fromLTRB(
//                     //               0, 0, 10, 0), // Add padding for the icon
//                     //           child: Icon(
//                     //             Icons.warning, // Icon for emergency cases
//                     //             color: Colors.white,
//                     //           ),
//                     //         ),
//                     //       ]),
//                     //       SizedBox(
//                     //           width:
//                     //               10), // Add some space between the text and the next widget
//                     //     ],
//                     //   ),
//                     // ),
//                     // // Container with emergency texts and icons
//                     // Container(
//                     //   margin: EdgeInsets.fromLTRB(0, 0, 35, 25),
//                     //   child: Column(
//                     //     crossAxisAlignment: CrossAxisAlignment.end,
//                     //     children: [
//                     // buildTextWithIcon(
//                     //   text: 'مطلوب وحدات دم بشكل عاجل',
//                     //   icon: Icons.bloodtype_outlined, // Blood icon
//                     //   context: context,
//                     // ),
//                     //       buildTextWithIcon(
//                     //         text: 'مطلوب مسعفين بشكل طارئ',
//                     //         icon: Icons
//                     //             .medical_services_outlined, // Medical services icon
//                     //         context: context,
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),

// ///////////////////////////////////////////////////////
//                     SizedBox(height: 25),
// /////////////////////////volunteer of the month///////////////
//                     Column(
//                       children: [
//                         // Volunteer of the Month
//                         FlipCard(
//                           direction: FlipDirection.HORIZONTAL,
//                           front: Container(
//                             child: Center(
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     'متطوع الشهر المثالي',
//                                     style: TextStyle(
//                                       color: Color(0xFF071533),
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 0), // Spacer
//                                   Container(
//                                     width: 100,
//                                     height: 100,
//                                     padding:
//                                         EdgeInsets.all(5.0), // Add padding here
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Color(0xFF071533), width: 2),
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(50),
//                                       child: Image.asset(
//                                         'assets/banah.jpg',
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5), // Spacer
//                                   // Container(
//                                   //   margin:
//                                   //       EdgeInsets.fromLTRB(120, 0, 120, 20),
//                                   //   decoration: BoxDecoration(
//                                   //     color: Color(0xFFff9c0d),
//                                   //     borderRadius: BorderRadius.circular(50),
//                                   //   ),
//                                   Center(
//                                     child: Text(
//                                       // 'بانه حمدان',
//                                       widget.userId,
//                                       style: TextStyle(
//                                           color: Color(0xFF071533),
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     // ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           back: Container(
//                             // child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//                               child: Text(
//                                 textAlign: TextAlign.center,
//                                 'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر. يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد ',
//                                 style: TextStyle(
//                                   color: Color(0xFF071533),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
// ///////////////////////////////////////////////////////////////
//                     SizedBox(height: 40),
// ///////////////////////////حالات طارئة/////////////////////////
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                       child: Container(
//                         width: 120,
//                         height: 150, // Increased height to accommodate text
//                         decoration: BoxDecoration(
//                           border:
//                               Border.all(color: Color(0xFFf3c344), width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               left: 50, // Adjust position as needed
//                               top: 8,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ParamedicsPage(userRole: widget.userRole, userId: widget.userId,)));
//                                 },
//                                 child: Column(
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(20),
//                                       child: Image.asset(
//                                         'assets/banah.jpg',
//                                         width: 120,
//                                         height: 100,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                         height:
//                                             8), // Add some space between image and text
//                                     Text(
//                                       'مطلوب مسعفين', // Add text under the first image
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               right: 50, // Adjust position as needed
//                               top: 8,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               BloodDonationPage(userId: widget.userId)));
//                                 },
//                                 child: Column(
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(20),
//                                       child: Image.asset(
//                                         'assets/banah.jpg',
//                                         width: 120,
//                                         height: 100,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                         height:
//                                             8), // Add some space between image and text
//                                     Text(
//                                       'مطلوب وحدات دم', // Add text under the second image
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

// ///////////////////////////////////////////////////////////////
//                     SizedBox(height: 20),
// ////////////////////////////من نحن////////////////////////////

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         CategoryBoxFirst(
//                           categoryName:
//                               'شارك معنا وانضم الى عائلتنا                       ',
//                           imagePath: 'assets/homePage/slider1.jpg',
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => EventsPage(),
//                               ),
//                             );
//                             // print('Category 1 clicked');
//                           },
//                         ),
//                         // وحدة وحدة وكبار
//                         // CategoryBox(
//                         //   categoryName: 'حملات التبرع بالدم',
//                         //   imagePath: 'assets/homePage/blood1.jpg',
//                         //   onTap: () {
//                         //     // Add navigation functionality
//                         //     print('Category 2 clicked');
//                         //   },
//                         // ),
//                         // CategoryBox(
//                         //   categoryName: 'المهرجانات',
//                         //   imagePath: 'assets/homePage/fest2.jpg',
//                         //   onTap: () {
//                         //     // Add navigation functionality
//                         //     print('Category 3 clicked');
//                         //   },
//                         // ),
//                         // CategoryBox(
//                         //   categoryName: 'شاركنا اقتراحاتك وافكارك',
//                         //   imagePath: 'assets/homePage/joinus3.jpg',
//                         //   onTap: () {
//                         //     // Add navigation functionality
//                         //     print('Category 4 clicked');
//                         //   },
//                         // ),
//                         // CategoryBox(
//                         //   categoryName: 'تقديم طلب تدريب للخريجين',
//                         //   imagePath: 'assets/homePage/grad.jpg',
//                         //   onTap: () {
//                         //     // Add navigation functionality
//                         //     print('Category 5 clicked');
//                         //   },
//                         // ),
//                       ],
//                     ),
//                     Padding(
//                         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: ListBody(
//                           // padding: EdgeInsets.all(20.0),
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 CategoryBox(
//                                   categoryName: 'تعرف على حملات التبرع بالدم',
//                                   imagePath: 'assets/homePage/blood1.jpg',
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => CampaignPage(userId: widget.userId)),
//                                     );
//                                   },
//                                 ),
//                                 CategoryBox(
//                                   categoryName: 'المهرجانات',
//                                   imagePath: 'assets/homePage/fest2.jpg',
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               FestivalsPage()),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10), // Spacer between rows
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 CategoryBox(
//                                   categoryName: 'شاركنا اقتراحاتك وافكارك',
//                                   imagePath: 'assets/homePage/joinus3.jpg',
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               SuggestionsPage(userId: widget.userId)),
//                                     );
//                                   },
//                                 ),
//                                 CategoryBox(
//                                   categoryName: 'تقديم طلب تدريب للخريجين',
//                                   imagePath: 'assets/homePage/grad.jpg',
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               universityTrainingPage(userId: widget.userId)),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )),
//                     SizedBox(height: 50),
// ////////////////////////////////////////////////////////////////////
//                     // Padding(
//                     //   padding: EdgeInsets.fromLTRB(
//                     //       5, 0, 5, 0), // Add space around the border
//                     ClipRRect(
//                       // borderRadius:
//                       // BorderRadius.circular(10.0), // Circular edges
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white, // Green background color
//                           border: Border(
//                             top: BorderSide(color: Colors.black, width: 1.5),
//                             // left: BorderSide(color: Colors.black, width: 1.5),
//                             // right:
//                             //     BorderSide(color: Colors.black, width: 1.5),
//                           ),
//                         ),
//                         // color: Colors.white, // Green background color
//                         padding: EdgeInsets.all(20.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             Container(
//                               // color: Colors.white,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       'مركز تدريب الشباب المجتمعي',
//                                       style: TextStyle(
//                                         color: Color(0xFF071533),
//                                         fontSize: 24.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5, left: 10),
//                                     // width: 296,
//                                     // height: 170,
//                                     width: 80,
//                                     height: 90,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           color: Colors.white, width: 2),
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/Logo.png'),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // SizedBox(height: 0.0),
//                             Center(
//                               child: Text(
//                                 "مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم",
//                                 style: TextStyle(
//                                   color: Color(0xFF071533),
//                                   fontSize: 16.0,
//                                 ),
//                                 textDirection: TextDirection.rtl,
//                               ),
//                             ),
//                             SizedBox(height: 5.0),
//                             // SizedBox(
//                             //   height: 100, // Adjust the height as needed
//                             //   child: GoogleMap(
//                             //     initialCameraPosition: CameraPosition(
//                             //       target: LatLng(37.7749, -122.4194),
//                             //       zoom: 12,
//                             //     ),
//                             //     markers: {
//                             //       Marker(
//                             //         markerId: MarkerId('location'),
//                             //         position: LatLng(37.7749, -122.4194),
//                             //         infoWindow: InfoWindow(
//                             //           title: 'Location',
//                             //         ),
//                             //       ),
//                             //     },
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // ),
// ////////////////////////////////////////////////////////////////////
//                     // Padding(
//                     //   padding: EdgeInsets.fromLTRB(
//                     //       5, 0, 5, 0), // Add space around the border
//                     Container(
//                       color: Color(0xFFf3c344),
//                       padding: EdgeInsets.all(10.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.facebook,
//                                 color: Colors.white), // Burger menu icon
//                             onPressed: () {
//                               launch('https://www.facebook.com/cytc.nablus');
//                             },
//                           ),
//                           Container(
//                             // margin: EdgeInsets.only(right: 20),
//                             // width: 296,
//                             // height: 170,
//                             width: 35, // Adjust the width as needed
//                             height: 35, // Adjust the height as needed
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               // border: Border.all(color: Colors.white, width: 2),
//                               image: DecorationImage(
//                                 image: AssetImage('assets/Logo.png'),
//                                 // fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.phone,
//                                 color: Colors.white), // Burger menu icon
//                             onPressed: () {
//                               // Add functionality for burger menu
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     // ),
// ////////////////////////////////////////////////////////////////////

//                     // //////
//                     // Padding(
//                     //   padding: EdgeInsets.only(
//                     //       right: 20,
//                     //       top: 0,
//                     //       left: 20,
//                     //       bottom: 0), // Adjust padding as needed
//                     //   child: ClipRRect(
//                     //     borderRadius: BorderRadius.circular(20.0),
//                     //     child: Container(
//                     //       // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                     //       decoration: BoxDecoration(
//                     //         border: Border(
//                     //           top: BorderSide(
//                     //               color: Color(0xFFFF0063), width: 2.0),
//                     //           // left: BorderSide(color: Colors.white, width: 2.0),
//                     //           // right:
//                     //           //     BorderSide(color: Colors.white, width: 2.0),
//                     //           bottom: BorderSide(
//                     //               color: Color(0xFFFF0063), width: 2.0),
//                     //         ),
//                     //       ),
//                     //       child: Directionality(
//                     //         textDirection: TextDirection.rtl,
//                     //         child: ExpansionPanelList(
//                     //           animationDuration: Duration(seconds: 1),
//                     //           dividerColor: Colors.green,
//                     //           elevation: 1,
//                     //           expandedHeaderPadding: EdgeInsets.all(8),
//                     //           children: [
//                     //             ExpansionPanel(
//                     //               headerBuilder: (context, isOpen) {
//                     //                 return ListTile(
//                     //                   title: Text(
//                     //                     "",
//                     //                     style: TextStyle(
//                     //                         color: Color(
//                     //                             0xFFFF0063), // Change font color
//                     //                         fontSize: 20.0, // Change font size
//                     //                         fontWeight: FontWeight.bold),
//                     //                   ),
//                     //                 );
//                     //               },
//                     //               body: Padding(
//                     //                 padding: EdgeInsets.symmetric(
//                     //                     horizontal: 16.0, vertical: 8.0),
//                     //                 child: Text(
//                     //                   "مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم",
//                     //                   style: TextStyle(
//                     //                     color: Color(0xFFFF0063),
//                     //                     fontSize: 17.0,
//                     //                   ),
//                     //                 ),
//                     //               ),
//                     //               isExpanded: _isOpen[0],
//                     //               canTapOnHeader: true,
//                     //             ),
//                     //           ],
//                     //           expansionCallback: (panelIndex, isOpen) {
//                     //             setState(() {
//                     //               _isOpen[panelIndex] = !isOpen;
//                     //             });
//                     //           },
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                   ]),
//             )
//             // ),
//             // ),
//           ],
//         ),
//       ),
//       // ),
//     );
//   }
// }
