// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, library_private_types_in_public_api, use_key_in_widget_constructors
// import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool isReportsSelected = false;
//   bool isSettingsSelected = false;

//   String phoneNumber = '1234567890';
//   String location = 'نابلس';
//   String bloodType = 'AB+';
//   String profileImagePath = 'assets/banah.jpg';

//   final ImagePicker _picker = ImagePicker();
//   final String correctCode =
//       "123456"; // Example code, replace with actual logic

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, //0xFFF9F7F2
//       appBar: AppBar(
//         backgroundColor: Color(0xFF071533).withOpacity(0.1), // Baby blue
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(
//               LineAwesomeIcons.angle_right_solid,
//               color: Color(0xFF071533),
//               size: 20,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//         leading: Builder(
//           builder: (context) {
//             return IconButton(
//               icon: Icon(
//                 Icons.menu,
//                 color: Color(0xFF071533),
//                 size: 20,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       drawer: _buildDrawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 ClipPath(
//                   clipper: BackgroundClipper(),
//                   child: Container(
//                     height: 170,
//                     color: Color(0xFF071533).withOpacity(0.1), // Baby blue
//                   ),
//                 ),
//                 // Positioned(
//                 //   top: 20,
//                 //   left: 16,
//                 //   child: Row(
//                 //     children: [
//                 //       IconButton(
//                 //         icon: Icon(Icons.arrow_back_ios_new,
//                 //             color: Color(0xFF071533), size: 20,),
//                 //         onPressed: () {
//                 //           Navigator.pop(context);
//                 //         },
//                 //       ),
//                 //       Builder(
//                 //         builder: (context) {
//                 //           return IconButton(
//                 //             icon: Icon(Icons.menu, color: Color(0xFF071533), size: 20,),
//                 //             onPressed: () {
//                 //               Scaffold.of(context).openDrawer();
//                 //             },
//                 //           );
//                 //         },
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 Positioned(
//                   top: 70,
//                   left: 0,
//                   right: 0,
//                   child: Column(
//                     children: [
//                       Stack(
//                         alignment: Alignment.bottomRight,
//                         children: [
//                           CircleAvatar(
//                             radius: 50,
//                             backgroundImage: AssetImage(profileImagePath),
//                           ),
//                           Positioned(
//                             right: 0,
//                             bottom: 0,
//                             child: GestureDetector(
//                               onTap: _pickProfileImage,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0xFF071533).withOpacity(0.1),
//                                 ),
//                                 padding: EdgeInsets.all(4),
//                                 child: Icon(
//                                   Icons.edit,
//                                   color: Colors.grey,
//                                   size: 20,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'بانه خالد موسى حمدان',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF071533),
//                           fontFamily: 'Amiri',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 80),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 30.0),
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 10,
//                           spreadRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isReportsSelected = true;
//                               isSettingsSelected = false;
//                             });
//                           },
//                           child: _buildTab('انجازاتي', isReportsSelected),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isReportsSelected = false;
//                               isSettingsSelected = false;
//                             });
//                           },
//                           child: _buildTab('معلوماتي',
//                               !isReportsSelected && !isSettingsSelected),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isSettingsSelected = true;
//                               isReportsSelected = false;
//                             });
//                           },
//                           child: _buildTab('حسابي', isSettingsSelected),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   AnimatedSwitcher(
//                     duration: Duration(milliseconds: 300),
//                     child: isReportsSelected
//                         ? _buildReportsContent()
//                         : isSettingsSelected
//                             ? _buildSettingsContent()
//                             : _buildInfoContent(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 40, bottom: 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'بانه خالد حمدان',
//                         style: TextStyle(
//                             color: Color(0xFF071533),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             fontFamily: 'Amiri'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 16.0),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProfilePage()));
//                     },
//                     child: CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage(
//                           'assets/banah.jpg'), // Replace with your image path
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => bar(
//                           userId: '',
//                           userRole: '',
//                         ))),
//             title: Text('الرئيسية',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(Icons.home, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         universityTrainingPage())), // Add onTap functionality
//             title: Text('تقديم طلب تدريب للخريجين',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.graduation_cap_solid,
//                 color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         SuggestionsPage())), // Add onTap functionality
//             title: Text('شاركنا باقتراحاتك وافكارك',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing:
//                 Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         LoginPage())), // Add onTap functionality for logout
//             title: Text('تسجيل خروج',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTab(String label, bool isSelected) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               color: isSelected ? Color(0xFFffe145) : Colors.grey,
//               fontFamily: 'Amiri',
//             ),
//           ),
//           if (isSelected)
//             Container(
//               height: 2,
//               width: 40,
//               color: Color(0xFFffe145),
//               margin: EdgeInsets.only(top: 5),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildReportsContent() {
//     return Column(
//       key: ValueKey('تقاريري'),
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(25),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 spreadRadius: 5,
//               ),
//             ],
//           ),
//           padding: EdgeInsets.all(18),
//           child: Table(
//             border: TableBorder.all(color: Colors.grey),
//             defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//             columnWidths: {
//               // 0: FractionColumnWidth(0.19),
//               0: FractionColumnWidth(0.2),
//               1: FractionColumnWidth(0.3),
//               2: FractionColumnWidth(0.3),
//               // 4: FractionColumnWidth(0.14),
//               3: FractionColumnWidth(0.2),
//             },
//             children: [
//               TableRow(
//                 decoration: BoxDecoration(
//                   color: Color(0xFF071533).withOpacity(0.1),
//                 ),
//                 children: [
//                   // _buildTableCell('استمرارية النشاط', true),
//                   _buildTableCell('عدد الساعات'),
//                   _buildTableCell('تاريخ النهاية'),
//                   _buildTableCell('تاريخ البداية'),
//                   // _buildTableCell('التصنيف'),
//                   _buildTableCell('اسم النشاط'),
//                 ],
//               ),
//               TableRow(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 children: [
//                   // _buildStatusCell('مستمر', true),
//                   _buildTableCell('50'),
//                   _buildTableCell('2023-12-31'),
//                   _buildTableCell('2023-01-01'),
//                   // _buildTableCell('تعليم'),
//                   _buildTableCell('نشاط 1'),
//                 ],
//               ),
//               TableRow(
//                 decoration: BoxDecoration(
//                   color: Color(0xFF071533).withOpacity(0.1),
//                 ),
//                 children: [
//                   // _buildStatusCell('منتهي', false),
//                   _buildTableCell('30'),
//                   _buildTableCell('2023-06-30'),
//                   _buildTableCell('2023-02-01'),
//                   // _buildTableCell('رياضة'),
//                   _buildTableCell('نشاط 2'),
//                 ],
//               ),
//               TableRow(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 children: [
//                   // _buildStatusCell('مستمر', true),
//                   _buildTableCell('20'),
//                   _buildTableCell('2023-11-30'),
//                   _buildTableCell('2023-03-01'),
//                   // _buildTableCell('صحة'),
//                   _buildTableCell('نشاط 3'),
//                 ],
//               ),
//               TableRow(
//                 decoration: BoxDecoration(
//                   color: Color(0xFF071533).withOpacity(0.1),
//                 ),
//                 children: [
//                   // _buildStatusCell('منتهي', false),
//                   _buildTableCell('40'),
//                   _buildTableCell('2023-08-31'),
//                   _buildTableCell('2023-04-01'),
//                   // _buildTableCell('ثقافة'),
//                   _buildTableCell('نشاط 4'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTableCell(String text, [bool isHeader = false]) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 10,
//           fontFamily: 'Amiri',
//         ),
//       ),
//     );
//   }

//   Widget _buildStatusCell(String text, bool isOngoing) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 12,
//           fontFamily: 'Amiri',
//           color: isOngoing ? Colors.green : Color(0xFF071533),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoContent() {
//     return Column(
//       key: ValueKey('معلوماتي'),
//       children: [
//         _buildInfoCard(
//             'البريد الإلكتروني', 'banah.hamdan@gmail.com', Icons.email, false),
//         _buildInfoCard('رقم الهاتف', phoneNumber, Icons.phone, true),
//         _buildInfoCard(
//             'تاريخ الميلاد', '2001/10/06', Icons.calendar_today, false),
//         _buildInfoCard('مكان السكن', location, Icons.location_city, true),
//         _buildInfoCard('فصيلة الدم', bloodType, Icons.bloodtype, true),
//         _buildInfoCard(
//             'تاريخ آخر تبرع بالدم', '2024/03/09', Icons.date_range, false),
//       ],
//     );
//   }

//   Widget _buildSettingsContent() {
//     return Column(
//       key: ValueKey('إعدادات الحساب'),
//       children: [
//         ListTile(
//           title: Text(
//             'تسجيل الخروج',
//             style: TextStyle(
//                 fontSize: 16, fontFamily: 'Amiri', color: Color(0xFF071533)),
//             textAlign: TextAlign.right,
//           ),
//           trailing: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xFF071533)
//                   .withOpacity(0.1), // Same color as the app bar
//             ),
//             child: Icon(Icons.logout, color: Color(0xFF071533), size: 20),
//           ),
//           onTap: _logout,
//         ),
//         Divider(color: Colors.grey[300]),
//         ListTile(
//           title: Text(
//             'إلغاء الحساب',
//             style: TextStyle(
//                 fontSize: 16, fontFamily: 'Amiri', color: Color(0xFF071533)),
//             textAlign: TextAlign.right,
//           ),
//           trailing: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xFF071533)
//                   .withOpacity(0.1), // Same color as the app bar
//             ),
//             child: Icon(Icons.delete, color: Color(0xFF071533), size: 20),
//           ),
//           onTap: _showDeleteAccountDialog,
//         ),
//         Divider(color: Colors.grey[300]),
//       ],
//     );
//   }

//   Widget _buildArticleCard(String imagePath, String title, String readTime) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         elevation: 2,
//         child: ListTile(
//           contentPadding: EdgeInsets.all(10),
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(
//               imagePath,
//               width: 60,
//               height: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           title: Text(
//             title,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Amiri',
//               color: Color(0xFF071533),
//             ),
//           ),
//           subtitle: Row(
//             children: [
//               Icon(Icons.favorite_border, size: 16, color: Colors.grey),
//               SizedBox(width: 5),
//               Text(
//                 readTime,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontFamily: 'Amiri',
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//           trailing: Icon(Icons.more_vert, color: Colors.grey),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard(
//       String title, String value, IconData icon, bool isEditable) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               if (isEditable)
//                 GestureDetector(
//                   onTap: () {
//                     _showEditDialog(title, value);
//                   },
//                   child: Icon(Icons.edit, color: Colors.grey),
//                 ),
//               if (isEditable) SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   value,
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: 'Amiri',
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 title,
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Amiri',
//                 ),
//               ),
//               SizedBox(width: 10),
//               Container(
//                 width: 30,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFF071533)
//                       .withOpacity(0.1), // Same color as the app bar
//                 ),
//                 child: Icon(icon, color: Color(0xFF071533), size: 20),
//               ),
//             ],
//           ),
//         ),
//         Divider(color: Colors.grey[300]),
//       ],
//     );
//   }

//   void _showEditDialog(String title, String currentValue) {
//     TextEditingController controller =
//         TextEditingController(text: currentValue);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           titlePadding: EdgeInsets.only(top: 10, left: 10, right: 10),
//           title: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Text(
//                   'تعديل $title',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(fontFamily: 'Amiri'),
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ),
//             ],
//           ),
//           content: TextField(
//             controller: controller,
//             textAlign: TextAlign.right,
//             cursorColor: Color(0xFFffe145),
//             decoration: InputDecoration(
//               hintText: "أدخل القيمة الجديدة",
//               hintTextDirection: TextDirection.rtl,
//               hintStyle: TextStyle(fontFamily: 'Amiri'),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFFffe145)),
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   if (title == 'رقم الهاتف') {
//                     phoneNumber = controller.text;
//                   } else if (title == 'مكان السكن') {
//                     location = controller.text;
//                   } else if (title == 'فصيلة الدم') {
//                     bloodType = controller.text;
//                   }
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('حفظ',
//                   style:
//                       TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145))),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showDeleteAccountDialog() {
//     TextEditingController codeController = TextEditingController();
//     bool isError = false;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               titlePadding: EdgeInsets.only(top: 10, left: 10, right: 10),
//               title: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Text(
//                       'إلغاء الحساب',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(fontFamily: 'Amiri'),
//                     ),
//                   ),
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     child: IconButton(
//                       icon: Icon(Icons.close),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'أدخل الكود الذي تم إرساله إلى بريدك الإلكتروني',
//                     textAlign: TextAlign.right,
//                     style: TextStyle(fontFamily: 'Amiri'),
//                   ),
//                   TextField(
//                     controller: codeController,
//                     textAlign: TextAlign.right,
//                     cursorColor: Color(0xFFffe145),
//                     decoration: InputDecoration(
//                       hintText: "أدخل الكود",
//                       hintStyle: TextStyle(fontFamily: 'Amiri'),
//                       hintTextDirection: TextDirection.rtl,
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xFFffe145)),
//                       ),
//                       errorText:
//                           isError ? "الكود غير صحيح. حاول مرة أخرى" : null,
//                       errorStyle: TextStyle(fontFamily: 'Amiri'),
//                     ),
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     if (codeController.text == correctCode) {
//                       // Perform account deletion and navigate to login page
//                       Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(builder: (context) => LoginPage()));
//                     } else {
//                       setState(() {
//                         isError = true;
//                       });
//                     }
//                   },
//                   child: Text('حذف',
//                       style: TextStyle(
//                           fontFamily: 'Amiri', color: Color(0xFFffe145))),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   void _logout() {
//     // Perform logout and navigate to login page
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 LoginPage())); // Add onTap functionality for logout
//   }

//   void _pickProfileImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         profileImagePath = pickedFile.path;
//       });
//     }
//   }
// }

// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.6);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height * 0.6,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }


import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:cytc/linkapi.dart';

class ProfilePage extends StatefulWidget {
  final String userId;

  const ProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isReportsSelected = false;
  bool isSettingsSelected = false;

  String phoneNumber = '1234567890';
  String location = 'نابلس';
  String bloodType = 'AB+';
  String profileImagePath = 'assets/banah.jpg';
  DateTime birthDate = DateTime.now();
  String email = '';
  String username = ''; // New field for username

  final ImagePicker _picker = ImagePicker();
  final String correctCode = "123456";

  List events = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchUserEvents();
  }

  Future<void> fetchUserData() async {
    final response =
        await http.get(Uri.parse('${LinkApi.user}/${widget.userId}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status']) {
        setState(() {
          phoneNumber = data['user']['phoneNumber'];
          location = data['user']['city'];
          bloodType = data['user']['bloodType'];
          birthDate = DateTime.parse(data['user']['birthDate']);
          email = data['user']['email'];
          username = data['user']['username']; // Fetch username
        });
      } else {
        // Handle the case where the API returns a failure status
      }
    } else {
      // Handle the case where the API call fails
    }
  }

  Future<void> fetchUserEvents() async {
    final response = await http.get(
        Uri.parse('http://localhost:9999/event-user/events/${widget.userId}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status']) {
        setState(() {
          events = data['events'];
        });
      } else {
        // Handle the case where the API returns a failure status
      }
    } else {
      // Handle the case where the API call fails
    }
  }

  Future<void> editUserData(String field, String newValue) async {
    final url = '${LinkApi.editUser}/${widget.userId}';
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      field: newValue,
    });

    print('Sending PUT request to $url with body: $body and headers: $headers');

    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      if (data['status']) {
        fetchUserData(); // Fetch updated user data
      } else {
        print('Failed to update user information: ${data['message']}');
      }
    } else {
      print('Failed to update user information');
    }
  }

  Future<void> _unsubscribeEvent(String eventId) async {
    final url = 'http://localhost:9999/event-user/remove';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'eventId': eventId, 'userId': widget.userId});

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      if (data['status']) {
        fetchUserEvents(); // Fetch updated events
      } else {
        print('Failed to unsubscribe from the event: ${data['message']}');
      }
    } else {
      print('Failed to unsubscribe from the event');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: BackgroundClipper(),
                  child: Container(
                    height: 200,
                    color: Color(0xFFEBF5FF),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xFF071533),
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Color(0xFF071533),
                              size: 20,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(profileImagePath),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: _pickProfileImage,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFEBF5FF),
                                ),
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        username, // Display the fetched username
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isReportsSelected = true;
                              isSettingsSelected = false;
                            });
                          },
                          child: _buildTab('تقاريري', isReportsSelected),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isReportsSelected = false;
                              isSettingsSelected = false;
                            });
                          },
                          child: _buildTab('معلوماتي',
                              !isReportsSelected && !isSettingsSelected),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSettingsSelected = true;
                              isReportsSelected = false;
                            });
                          },
                          child: _buildTab('حسابي', isSettingsSelected),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: isReportsSelected
                        ? _buildReportsContent()
                        : isSettingsSelected
                            ? _buildSettingsContent()
                            : _buildInfoContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFEBF5FF),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'القائمة',
                  style: TextStyle(
                    color: Color(0xFF071533),
                    fontSize: 25,
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeTestGrey(userId: widget.userId)));
              },
              title: Row(
                children: [
                  Spacer(),
                  Text('الرئيسية', textAlign: TextAlign.right),
                  SizedBox(width: 10),
                  Icon(Icons.home, color: Color(0xFFffe145)),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(userId: widget.userId)));
              },
              title: Row(
                children: [
                  Spacer(),
                  Text('الملف الشخصي', textAlign: TextAlign.right),
                  SizedBox(width: 10),
                  Icon(Icons.account_circle, color: Color(0xFFffe145)),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                // Handle logout
              },
              title: Row(
                children: [
                  Spacer(),
                  Text('تسجيل خروج', textAlign: TextAlign.right),
                  SizedBox(width: 10),
                  Icon(Icons.logout, color: Color(0xFFffe145)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Color(0xFFffe145) : Colors.grey,
              fontFamily: 'Amiri',
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 40,
              color: Color(0xFFffe145),
              margin: EdgeInsets.only(top: 5),
            ),
        ],
      ),
    );
  }

  Widget _buildReportsContent() {
    return Column(
      key: ValueKey('تقاريري'),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.all(18),
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FractionColumnWidth(0.13),
              1: FractionColumnWidth(0.12),
              2: FractionColumnWidth(0.12),
              3: FractionColumnWidth(0.12),
              4: FractionColumnWidth(0.12),
              5: FractionColumnWidth(0.12),
              6: FractionColumnWidth(0.15),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Color(0xFFEBF5FF),
                ),
                children: [
                  _buildTableCell('إلغاء الاشتراك', true),
                  _buildTableCell('استمرارية النشاط', true),
                  _buildTableCell('عدد الساعات'),
                  _buildTableCell('تاريخ النهاية'),
                  _buildTableCell('تاريخ البداية'),
                  _buildTableCell('التصنيف'),
                  _buildTableCell('اسم النشاط'),
                ],
              ),
              for (var event in events)
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  children: [
                    _buildUnsubscribeCell(event),
                    _buildStatusCell(
                        DateTime.parse(event['eventId']['endDate'])
                                .isAfter(DateTime.now())
                            ? 'مستمر'
                            : 'منتهي',
                        DateTime.parse(event['eventId']['endDate'])
                            .isAfter(DateTime.now())),
                    _buildTableCell((DateTime.parse(event['eventId']['endDate'])
                            .difference(
                                DateTime.parse(event['eventId']['startDate'])))
                        .inHours
                        .toString()),
                    _buildTableCell(
                        event['eventId']['endDate'].substring(0, 10)),
                    _buildTableCell(
                        event['eventId']['startDate'].substring(0, 10)),
                    _buildTableCell(event['eventId']['interests']),
                    _buildTableCell(event['eventId']['name']),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUnsubscribeCell(event) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _showUnsubscribeDialog(event['eventId']['_id']),
        child: Text(
          'إلغاء الاشتراك',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Amiri',
          ),
        ),
      ),
    );
  }

  void _showUnsubscribeDialog(String eventId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'هل انت متاكد انك تريد سحب الاشتراك من هذا النشاط؟',
            textAlign: TextAlign.right,
            style: TextStyle(fontFamily: 'Amiri'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('لا', style: TextStyle(fontFamily: 'Amiri')),
            ),
            TextButton(
              onPressed: () {
                _unsubscribeEvent(eventId);
                Navigator.of(context).pop();
              },
              child: Text('نعم', style: TextStyle(fontFamily: 'Amiri')),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTableCell(String text, [bool isHeader = false]) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Amiri',
        ),
      ),
    );
  }

  Widget _buildStatusCell(String text, bool isOngoing) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Amiri',
          color: isOngoing ? Colors.green : Color(0xFF071533),
        ),
      ),
    );
  }

  Widget _buildInfoContent() {
    return Column(
      key: ValueKey('معلوماتي'),
      children: [
        _buildInfoCard('البريد الإلكتروني', email, Icons.email, false),
        _buildInfoCard('رقم الهاتف', phoneNumber, Icons.phone, true),
        _buildInfoCard(
            'تاريخ الميلاد',
            '${birthDate.year}/${birthDate.month}/${birthDate.day}',
            Icons.calendar_today,
            false),
        _buildInfoCard('مكان السكن', location, Icons.location_city, true),
        _buildInfoCard('فصيلة الدم', bloodType, Icons.bloodtype, true),
        _buildInfoCard(
            'تاريخ آخر تبرع بالدم', '2024/03/09', Icons.date_range, false),
      ],
    );
  }

  Widget _buildInfoCard(
      String title, String value, IconData icon, bool isEditable) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isEditable)
                GestureDetector(
                  onTap: () {
                    _showEditDialog(title, value);
                  },
                  child: Icon(Icons.edit, color: Colors.grey),
                ),
              if (isEditable) SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEBF5FF),
                ),
                child: Icon(icon, color: Color(0xFF071533), size: 20),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[300]),
      ],
    );
  }

  Widget _buildSettingsContent() {
    return Column(
      key: ValueKey('إعدادات الحساب'),
      children: [
        ListTile(
          title: Text(
            'تسجيل الخروج',
            style: TextStyle(
                fontSize: 16, fontFamily: 'Amiri', color: Color(0xFF071533)),
            textAlign: TextAlign.right,
          ),
          trailing: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEBF5FF),
            ),
            child: Icon(Icons.logout, color: Color(0xFF071533), size: 20),
          ),
          onTap: _logout,
        ),
        Divider(color: Colors.grey[300]),
        ListTile(
          title: Text(
            'إلغاء الحساب',
            style: TextStyle(
                fontSize: 16, fontFamily: 'Amiri', color: Color(0xFF071533)),
            textAlign: TextAlign.right,
          ),
          trailing: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEBF5FF),
            ),
            child: Icon(Icons.delete, color: Color(0xFF071533), size: 20),
          ),
          onTap: _showDeleteAccountDialog,
        ),
        Divider(color: Colors.grey[300]),
      ],
    );
  }

  void _showEditDialog(String title, String currentValue) {
    TextEditingController controller =
        TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titlePadding: EdgeInsets.only(top: 10, left: 10, right: 10),
          title: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'تعديل $title',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontFamily: 'Amiri'),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          content: TextField(
            controller: controller,
            textAlign: TextAlign.right,
            cursorColor: Color(0xFFffe145),
            decoration: InputDecoration(
              hintText: "أدخل القيمة الجديدة",
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(fontFamily: 'Amiri'),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFffe145)),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (title == 'رقم الهاتف') {
                    editUserData('phoneNumber', controller.text);
                  } else if (title == 'مكان السكن') {
                    editUserData('city', controller.text);
                  } else if (title == 'فصيلة الدم') {
                    editUserData('bloodType', controller.text);
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('حفظ',
                  style:
                      TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145))),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog() {
    TextEditingController codeController = TextEditingController();
    bool isError = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              titlePadding: EdgeInsets.only(top: 10, left: 10, right: 10),
              title: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'إلغاء الحساب',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: 'Amiri'),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'أدخل الكود الذي تم إرساله إلى بريدك الإلكتروني',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontFamily: 'Amiri'),
                  ),
                  TextField(
                    controller: codeController,
                    textAlign: TextAlign.right,
                    cursorColor: Color(0xFFffe145),
                    decoration: InputDecoration(
                      hintText: "أدخل الكود",
                      hintStyle: TextStyle(fontFamily: 'Amiri'),
                      hintTextDirection: TextDirection.rtl,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFffe145)),
                      ),
                      errorText:
                          isError ? "الكود غير صحيح. حاول مرة أخرى" : null,
                      errorStyle: TextStyle(fontFamily: 'Amiri'),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (codeController.text == correctCode) {
                      // Perform account deletion and navigate to login page
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId,)));
                    } else {
                      setState(() {
                        isError = true;
                      });
                    }
                  },
                  child: Text('حذف',
                      style: TextStyle(
                          fontFamily: 'Amiri', color: Color(0xFFffe145))),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _logout() {
    // Perform logout and navigate to login page
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId,)));
  }

  void _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImagePath = pickedFile.path;
      });
    }
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}