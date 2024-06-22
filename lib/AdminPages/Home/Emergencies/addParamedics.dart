// // // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

// // import 'package:cytc/UserPages/screen/Emergencies/chooseeLocation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class ParamedicsRequests extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primaryColor: Color(0xFF071533),
// //         fontFamily: 'Amiri',
// //         textTheme: TextTheme(
// //           bodyText2: TextStyle(color: Color(0xFF071533)),
// //         ),
// //       ),
// //       home: ParamedicsRequestsPage(),
// //     );
// //   }
// // }

// // class ParamedicsRequestsPage extends StatefulWidget {
// //   @override
// //   _ParamedicsRequestsPageState createState() => _ParamedicsRequestsPageState();
// // }

// // class _ParamedicsRequestsPageState extends State<ParamedicsRequestsPage> {
// //   final List<RescueRequest> rescueRequests = [];
// //   final _formKey = GlobalKey<FormState>();

// //   String? _location;
// //   String? _dangerLevel;
// //   LatLng? _chosenLocation;
// //   bool _locationChosen = false;
// //   Map<int, bool> savedRequests = {};

// //   TextEditingController _locationController = TextEditingController();
// //   TextEditingController _dangerLevelController = TextEditingController();
// //   TextEditingController _userLocationController = TextEditingController();

// //   void _addRescueRequest() {
// //     setState(() {
// //       rescueRequests.add(
// //         RescueRequest(
// //           announcementDate: DateTime.now(),
// //           announcementTime: TimeOfDay.now(),
// //           location: _location!,
// //           userLocation: _userLocationController.text,
// //           dangerLevel: _dangerLevel!,
// //           paramedics: 0, // Set paramedics to 0 as user cannot input this
// //           chosenLocation: _chosenLocation!,
// //         ),
// //       );
// //     });
// //   }

// //   void _editRescueRequest(int index) {
// //     setState(() {
// //       rescueRequests[index] = RescueRequest(
// //         announcementDate: rescueRequests[index].announcementDate,
// //         announcementTime: rescueRequests[index].announcementTime,
// //         location: _location!,
// //         userLocation: _userLocationController.text,
// //         dangerLevel: _dangerLevel!,
// //         paramedics: 0,
// //         chosenLocation: _chosenLocation!,
// //       );
// //     });
// //   }

// //   void _deleteRescueRequest(int index) {
// //     setState(() {
// //       rescueRequests.removeAt(index);
// //     });
// //   }

// //   Future<void> _navigateAndSelectLocation(BuildContext context) async {
// //     final result = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) =>
// //             ChooseLocationPage(userId: 'user_id', userRole: 'admin'),
// //       ),
// //     );

// //     if (result != null && result is LatLng) {
// //       setState(() {
// //         _chosenLocation = result;
// //         _location = '${result.latitude}, ${result.longitude}';
// //         _locationController.text = _location!;
// //         _locationChosen = true;
// //       });
// //     }
// //   }

// //   void _showAddEditDialog({RescueRequest? request, int? index}) {
// //     if (request != null) {
// //       _locationController.text = request.location;
// //       _userLocationController.text = request.userLocation;
// //       _dangerLevelController.text = request.dangerLevel;
// //       _chosenLocation = request.chosenLocation;
// //       _locationChosen = true;
// //     } else {
// //       _locationController.clear();
// //       _userLocationController.clear();
// //       _dangerLevelController.clear();
// //       _chosenLocation = null;
// //       _locationChosen = false;
// //     }
// //    showDialog(
// //   context: context,
// //   builder: (context) {
// //     return AlertDialog(
// //       title: Text(
// //         request == null ? 'قم باضافة حالة طوارئ جديدة' : 'قم بتعديل حالة الطوارئ',
// //         textAlign: TextAlign.right,
// //         style: TextStyle(fontSize: 15, fontFamily: 'Amiri', color: Color(0xFF071533), fontWeight: FontWeight.bold),
// //       ),
// //       content: Form(
// //         key: _formKey,
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           crossAxisAlignment: CrossAxisAlignment.end,
// //           children: [
// //             TextFormField(
// //               controller: _userLocationController,
// //               decoration: InputDecoration(
// //                 hintText: 'ادخل اسم المكان',
// //                 hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
// //                 focusedBorder: UnderlineInputBorder(
// //                   borderSide: BorderSide(color: Color(0xFFffe145)),
// //                 ),
// //               ),
// //               cursorColor: Color(0xFFffe145),
// //               textAlign: TextAlign.right,
// //               style: TextStyle(fontSize: 12, fontFamily: 'Amiri', color: Color(0xFF071533)),
// //               validator: (value) => value!.isEmpty ? 'قم بتحديد اسم الموقع' : null,
// //               onChanged: (value) => _location = value,
// //             ),
// //             SizedBox(height: 12),
// //             TextFormField(
// //               controller: _locationController,
// //               decoration: InputDecoration(
// //                 hintText: 'احداثيات الموقع على الخارطة',
// //                 hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
// //                 focusedBorder: UnderlineInputBorder(
// //                   borderSide: BorderSide(color: Color(0xFFffe145)),
// //                 ),
// //               ),
// //               cursorColor: Color(0xFFffe145),
// //               textAlign: TextAlign.right,
// //               style: TextStyle(fontSize: 12, fontFamily: 'Amiri', color: Color(0xFF071533)),
// //               readOnly: true,
// //             ),
// //             SizedBox(height: 12),
// //             DropdownButtonFormField<String>(
// //               value: _dangerLevel,
// //               decoration: InputDecoration(
// //                 hintText: 'مستوى الخطورة',
// //                 hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
// //                 focusedBorder: UnderlineInputBorder(
// //                   borderSide: BorderSide(color: Color(0xFFffe145)),
// //                 ),
// //               ),
// //               style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
// //               items: [
// //                 DropdownMenuItem(
// //                   value: 'خطر جدا',
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.end,
// //                     children: [
// //                       Text('خطر جدا', style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri')),
// //                     ],
// //                   ),
// //                 ),
// //                 DropdownMenuItem(
// //                   value: 'متوسط',
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.end,
// //                     children: [
// //                       Text('متوسط', style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri')),
// //                     ],
// //                   ),
// //                 ),
// //                 DropdownMenuItem(
// //                   value: 'خطورة منخفضة',
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.end,
// //                     children: [
// //                       Text('خطورة منخفضة', style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri')),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //               onChanged: (value) {
// //                 setState(() {
// //                   _dangerLevel = value;
// //                 });
// //               },
// //               validator: (value) => value == null ? 'قم باختيار درجة الخطورة' : null,
// //               iconSize: 24,
// //               isExpanded: true,
// //             ),
// //             SizedBox(height: 15),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               children: [
// //                 TextButton(
// //                   onPressed: () => _navigateAndSelectLocation(context),
// //                   child: Row(
// //                     children: [
// //                       if (_locationChosen) Icon(Icons.check, color: Colors.green),
// //                       Text(
// //                         'قم بتحديد الموقع على الخارطة',
// //                         textAlign: TextAlign.right,
// //                         style: TextStyle(
// //                           color: Color(0xFFffe145),
// //                           decoration: TextDecoration.underline,
// //                           fontFamily: 'Amiri',
// //                           fontSize: 12,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //       actions: [
// //         ElevatedButton(
// //           onPressed: () => Navigator.pop(context),
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: Colors.white, // Background color
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(15), // Rounded edges
// //             ),
// //           ),
// //           child: Text(
// //             'رجوع',
// //             style: TextStyle(
// //               fontFamily: 'Amiri',
// //               fontSize: 12,
// //               color: Colors.red,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //         ElevatedButton(
// //           onPressed: () {
// //             if (_formKey.currentState!.validate()) {
// //               if (index == null) {
// //                 _addRescueRequest();
// //               } else {
// //                 _editRescueRequest(index);
// //               }
// //               Navigator.pop(context);
// //             }
// //           },
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: Colors.white, // Background color
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(15), // Rounded edges
// //               side: BorderSide(color: Color(0xFF071533)),
// //             ),
// //           ),
// //           child: Text(
// //             'حفظ',
// //             style: TextStyle(
// //               fontFamily: 'Amiri',
// //               color: Color(0xFF071533),
// //               fontSize: 12,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   },
// // );

// //   }

// //   bool canEditOrDelete(DateTime announcementDate, TimeOfDay announcementTime) {
// //     final now = DateTime.now();
// //     final announcementDateTime = DateTime(
// //       announcementDate.year,
// //       announcementDate.month,
// //       announcementDate.day,
// //       announcementTime.hour,
// //       announcementTime.minute,
// //     );
// //     return now.difference(announcementDateTime).inHours < 1;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(kToolbarHeight),
// //         child: ClipRRect(
// //           borderRadius: BorderRadius.only(
// //             bottomLeft: Radius.circular(20.0),
// //             bottomRight: Radius.circular(20.0),
// //           ),
// //           child: AppBar(
// //             backgroundColor: Color(0xFF071533),
// //             actions: [
// //               Center(
// //                 child: Text(
// //                   '(اضافة حالة طوارئ جديدة (طلب مسعفين',
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     fontFamily: 'Amiri',
// //                     fontSize: 17,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(width: 10),
// //             ],
// //             leading: IconButton(
// //               icon: Icon(
// //                 Icons.add,
// //                 color: Colors.white,
// //                 size: 25,
// //               ),
// //               onPressed: () => _showAddEditDialog(), // Show dialog directly
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               Table(
// //                 border: TableBorder.all(color: Color(0xFF071533)),
// //                 columnWidths: {
// //                   0: FlexColumnWidth(1),
// //                   1: FlexColumnWidth(1),
// //                   2: FlexColumnWidth(1),
// //                   3: FlexColumnWidth(1),
// //                   4: FlexColumnWidth(1),
// //                   5: FlexColumnWidth(1),
// //                   6: FlexColumnWidth(1),
// //                   7: FlexColumnWidth(1),
// //                 },
// //                 children: [
// //                   TableRow(
// //                     decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
// //                     children: [
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'الظهور عند المستخدم',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'تعديل',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'عدد المسعفين',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'مستوى الخطورة',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'الاحداثيات على الخريطة',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'الموقع',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'الوقت',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       TableCell(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(
// //                             'تاريخ الاضافة',
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontFamily: 'Amiri',
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF071533),
// //                               fontSize: 14,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   ...rescueRequests.map((request) {
// //                     final canEdit = canEditOrDelete(
// //                         request.announcementDate, request.announcementTime);
// //                     return TableRow(
// //                       children: [
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               savedRequests.containsKey(request.hashCode) &&
// //                                       savedRequests[request.hashCode]!
// //                                   ?  'تم اظهاره للمستخدم'
// //                                   : '',
// //                               textAlign: TextAlign.center,
// //                             ),
// //                           ),
// //                         ),
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Wrap(
// //                               alignment: WrapAlignment.center,
// //                               spacing: 4.0,
// //                               children: [
// //                                 IconButton(
// //                                   icon: Icon(
// //                                     Icons.edit,
// //                                     size: 17,
// //                                   ),
// //                                   onPressed: canEdit
// //                                       ? () => _showAddEditDialog(
// //                                           request: request,
// //                                           index:
// //                                               rescueRequests.indexOf(request))
// //                                       : null,
// //                                   color: canEdit ? Colors.blue : Colors.grey,
// //                                 ),
// //                                 IconButton(
// //                                   icon: Icon(
// //                                     Icons.delete,
// //                                     size: 17,
// //                                   ),
// //                                   onPressed: canEdit
// //                                       ? () => _deleteRescueRequest(
// //                                           rescueRequests.indexOf(request))
// //                                       : null,
// //                                   color: canEdit ? Colors.red : Colors.grey,
// //                                 ),
// //                                 if (!savedRequests
// //                                         .containsKey(request.hashCode) ||
// //                                     !savedRequests[request.hashCode]!)
// //                                   IconButton(
// //                                     icon: Icon(
// //                                       Icons.save,
// //                                       size: 17,
// //                                     ),
// //                                     onPressed: () {
// //                                       setState(() {
// //                                         savedRequests[request.hashCode] = true;
// //                                       });
// //                                     },
// //                                   ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               request.dangerLevel,
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Color(0xFF071533),
// //                                   fontFamily: 'Amiri'),
// //                             ),
// //                           ),
// //                         ),
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               request.announcementTime.format(context),
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Color(0xFF071533),
// //                                   fontFamily: 'Amiri'),
// //                             ),
// //                           ),
// //                         ),
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               DateFormat.yMMMd()
// //                                   .format(request.announcementDate),
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Color(0xFF071533),
// //                                   fontFamily: 'Amiri'),
// //                             ),
// //                           ),
// //                         ),
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               request.paramedics.toString(),
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Color(0xFF071533),
// //                                   fontFamily: 'Amiri'),
// //                             ),
// //                           ),
// //                         ),
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               '${request.chosenLocation.latitude}, ${request.chosenLocation.longitude}',
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Color(0xFF071533),
// //                                   fontFamily: 'Amiri'),
// //                             ),
// //                           ),
// //                         ),
// //                         TableCell(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               request.userLocation,
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Color(0xFF071533),
// //                                   fontFamily: 'Amiri'),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     );
// //                   }).toList(),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class RescueRequest {
// //   final String location;
// //   final String userLocation;
// //   final int paramedics;
// //   final DateTime announcementDate;
// //   final TimeOfDay announcementTime;
// //   final String dangerLevel;
// //   final LatLng chosenLocation;

// //   RescueRequest({
// //     required this.location,
// //     required this.userLocation,
// //     required this.paramedics,
// //     required this.announcementDate,
// //     required this.announcementTime,
// //     required this.dangerLevel,
// //     required this.chosenLocation,
// //   });
// // }

// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:cytc/UserPages/screen/Emergencies/chooseeLocation.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ParamedicsRequests extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF071533),
//         fontFamily: 'Amiri',
//         textTheme: TextTheme(
//           bodyText2: TextStyle(color: Color(0xFF071533)),
//         ),
//       ),
//       home: ParamedicsRequestsPage(),
//     );
//   }
// }

// class ParamedicsRequestsPage extends StatefulWidget {
//   @override
//   _ParamedicsRequestsPageState createState() => _ParamedicsRequestsPageState();
// }

// class _ParamedicsRequestsPageState extends State<ParamedicsRequestsPage> {
//   final List<RescueRequest> rescueRequests = [];
//   final _formKey = GlobalKey<FormState>();

//   String? _location;
//   String? _dangerLevel;
//   LatLng? _chosenLocation;
//   bool _locationChosen = false;
//   Map<int, bool> savedRequests = {};

//   TextEditingController _locationController = TextEditingController();
//   TextEditingController _dangerLevelController = TextEditingController();
//   TextEditingController _userLocationController = TextEditingController();

//   void _addRescueRequest() {
//     setState(() {
//       rescueRequests.add(
//         RescueRequest(
//           announcementDate: DateTime.now(),
//           announcementTime: TimeOfDay.now(),
//           location: _location!,
//           userLocation: _userLocationController.text,
//           dangerLevel: _dangerLevel!,
//           paramedics: 0, // Set paramedics to 0 as user cannot input this
//           chosenLocation: _chosenLocation!,
//         ),
//       );
//     });
//   }

//   void _editRescueRequest(int index) {
//     setState(() {
//       rescueRequests[index] = RescueRequest(
//         announcementDate: rescueRequests[index].announcementDate,
//         announcementTime: rescueRequests[index].announcementTime,
//         location: _location!,
//         userLocation: _userLocationController.text,
//         dangerLevel: _dangerLevel!,
//         paramedics: 0,
//         chosenLocation: _chosenLocation!,
//       );
//     });
//   }

//   void _deleteRescueRequest(int index) {
//     setState(() {
//       rescueRequests.removeAt(index);
//     });
//   }

//   Future<void> _navigateAndSelectLocation(BuildContext context) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             ChooseLocationPage(userId: 'user_id', userRole: 'admin'),
//       ),
//     );

//     if (result != null && result is LatLng) {
//       setState(() {
//         _chosenLocation = result;
//         _location = '${result.latitude}, ${result.longitude}';
//         _locationController.text = _location!;
//         _locationChosen = true;
//       });
//     }
//   }

//   void _showAddEditDialog({RescueRequest? request, int? index}) {
//     if (request != null) {
//       _locationController.text = request.location;
//       _userLocationController.text = request.userLocation;
//       _dangerLevelController.text = request.dangerLevel;
//       _chosenLocation = request.chosenLocation;
//       _locationChosen = true;
//     } else {
//       _locationController.clear();
//       _userLocationController.clear();
//       _dangerLevelController.clear();
//       _chosenLocation = null;
//       _locationChosen = false;
//     }
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             request == null ? 'قم باضافة حالة طوارئ جديدة' : 'قم بتعديل حالة الطوارئ',
//             textAlign: TextAlign.right,
//             style: TextStyle(fontSize: 15, fontFamily: 'Amiri', color: Color(0xFF071533), fontWeight: FontWeight.bold),
//           ),
//           content: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 TextFormField(
//                   controller: _userLocationController,
//                   decoration: InputDecoration(
//                     hintText: 'ادخل اسم المكان',
//                     hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFFffe145)),
//                     ),
//                   ),
//                   cursorColor: Color(0xFFffe145),
//                   textAlign: TextAlign.right,
//                   style: TextStyle(fontSize: 12, fontFamily: 'Amiri', color: Color(0xFF071533)),
//                   validator: (value) => value!.isEmpty ? 'قم بتحديد اسم الموقع' : null,
//                   onChanged: (value) => _location = value,
//                 ),
//                 SizedBox(height: 12),
//                 TextFormField(
//                   controller: _locationController,
//                   decoration: InputDecoration(
//                     hintText: 'احداثيات الموقع على الخارطة',
//                     hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFFffe145)),
//                     ),
//                   ),
//                   cursorColor: Color(0xFFffe145),
//                   textAlign: TextAlign.right,
//                   style: TextStyle(fontSize: 12, fontFamily: 'Amiri', color: Color(0xFF071533)),
//                   readOnly: true,
//                 ),
//                 SizedBox(height: 12),
//                 DropdownButtonFormField<String>(
//                   value: _dangerLevel,
//                   decoration: InputDecoration(
//                     hintText: 'مستوى الخطورة',
//                     hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFFffe145)),
//                     ),
//                   ),
//                   style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
//                   items: [
//                     DropdownMenuItem(
//                       value: 'خطر جدا',
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text('خطر جدا', style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri')),
//                         ],
//                       ),
//                     ),
//                     DropdownMenuItem(
//                       value: 'متوسط',
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text('متوسط', style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri')),
//                         ],
//                       ),
//                     ),
//                     DropdownMenuItem(
//                       value: 'خطورة منخفضة',
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text('خطورة منخفضة', style: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri')),
//                         ],
//                       ),
//                     ),
//                   ],
//                   onChanged: (value) {
//                     setState(() {
//                       _dangerLevel = value;
//                     });
//                   },
//                   validator: (value) => value == null ? 'قم باختيار درجة الخطورة' : null,
//                   iconSize: 24,
//                   isExpanded: true,
//                 ),
//                 SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () => _navigateAndSelectLocation(context),
//                       child: Row(
//                         children: [
//                           if (_locationChosen) Icon(Icons.check, color: Colors.green),
//                           Text(
//                             'قم بتحديد الموقع على الخارطة',
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                               color: Color(0xFFffe145),
//                               decoration: TextDecoration.underline,
//                               fontFamily: 'Amiri',
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             // ElevatedButton(
//               // onPressed: () => Navigator.pop(context),
//               // style: ElevatedButton.styleFrom(
//               //   backgroundColor: Colors.white, // Background color
//               //   shape: RoundedRectangleBorder(
//               //     borderRadius: BorderRadius.circular(15), // Rounded edges
//               //   ),
//               // ),
//              TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text(
//                 'رجوع',
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   fontSize: 12,
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   if (index == null) {
//                     _addRescueRequest();
//                   } else {
//                     _editRescueRequest(index);
//                   }
//                   Navigator.pop(context);
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white, // Background color
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15), // Rounded edges
//                   side: BorderSide(color: Color(0xFF071533)),
//                 ),
//               ),
//               child: Text(
//                 'حفظ',
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   bool canEditOrDelete(DateTime announcementDate, TimeOfDay announcementTime) {
//     final now = DateTime.now();
//     final announcementDateTime = DateTime(
//       announcementDate.year,
//       announcementDate.month,
//       announcementDate.day,
//       announcementTime.hour,
//       announcementTime.minute,
//     );
//     return now.difference(announcementDateTime).inHours < 1;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(20.0),
//             bottomRight: Radius.circular(20.0),
//           ),
//           child: AppBar(
//             backgroundColor: Color(0xFF071533),
//             actions: [
//               Center(
//                 child: Text(
//                   '(اضافة حالة طوارئ جديدة (طلب مسعفين',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 17,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//             ],
//             leading: IconButton(
//               icon: Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 25,
//               ),
//               onPressed: () => _showAddEditDialog(), // Show dialog directly
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Table(
//                 border: TableBorder.all(color: Color(0xFF071533)),
//                 columnWidths: {
//                   0: FlexColumnWidth(1),
//                   1: FlexColumnWidth(1),
//                   2: FlexColumnWidth(1),
//                   3: FlexColumnWidth(1),
//                   4: FlexColumnWidth(1),
//                   5: FlexColumnWidth(1),
//                   6: FlexColumnWidth(1),
//                   7: FlexColumnWidth(1),
//                 },
//                 children: [
//                   TableRow(
//                     decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'الظهور عند المستخدم',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'تعديل',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'عدد المسعفين',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'مستوى الخطورة',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'الاحداثيات على الخريطة',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'الموقع',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'الوقت',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'تاريخ الاضافة',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   ...rescueRequests.map((request) {
//                     final canEdit = canEditOrDelete(
//                         request.announcementDate, request.announcementTime);
//                     return TableRow(
//                       children: [
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               savedRequests.containsKey(request.hashCode) &&
//                                       savedRequests[request.hashCode]!
//                                   ? 'تم اظهاره للمستخدم'
//                                   : '',
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Wrap(
//                               alignment: WrapAlignment.center,
//                               spacing: 4.0,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.edit,
//                                     size: 17,
//                                     color: Color(0xFFffe145),
//                                   ),
//                                   onPressed: canEdit
//                                       ? () => _showAddEditDialog(
//                                           request: request,
//                                           index:
//                                               rescueRequests.indexOf(request))
//                                       : null,
//                                   color: canEdit ? Colors.blue : Colors.grey,
//                                 ),
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.delete,
//                                     size: 17,
//                                   ),
//                                   onPressed: canEdit
//                                       ? () => _deleteRescueRequest(
//                                           rescueRequests.indexOf(request))
//                                       : null,
//                                   color: canEdit ? Colors.red : Colors.grey,
//                                 ),
//                                 if (!savedRequests
//                                         .containsKey(request.hashCode) ||
//                                     !savedRequests[request.hashCode]!)
//                                   IconButton(
//                                     icon: Icon(
//                                       Icons.save,
//                                       size: 17,
//                                       color: Colors.blue,
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         savedRequests[request.hashCode] = true;
//                                       });
//                                     },
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               request.paramedics.toString(),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF071533),
//                                   fontFamily: 'Amiri'),
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               request.dangerLevel,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF071533),
//                                   fontFamily: 'Amiri'),
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               '${request.chosenLocation.latitude}, ${request.chosenLocation.longitude}',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF071533),
//                                   fontFamily: 'Amiri'),
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               request.userLocation,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF071533),
//                                   fontFamily: 'Amiri'),
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               request.announcementTime.format(context),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF071533),
//                                   fontFamily: 'Amiri'),
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               DateFormat.yMMMd()
//                                   .format(request.announcementDate),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF071533),
//                                   fontFamily: 'Amiri'),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RescueRequest {
//   final String location;
//   final String userLocation;
//   final int paramedics;
//   final DateTime announcementDate;
//   final TimeOfDay announcementTime;
//   final String dangerLevel;
//   final LatLng chosenLocation;

//   RescueRequest({
//     required this.location,
//     required this.userLocation,
//     required this.paramedics,
//     required this.announcementDate,
//     required this.announcementTime,
//     required this.dangerLevel,
//     required this.chosenLocation,
//   });
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cytc/UserPages/screen/Emergencies/chooseeLocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParamedicsRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color(0xFF071533)),
        ),
      ),
      home: ParamedicsRequestsPage(),
    );
  }
}

class ParamedicsRequestsPage extends StatefulWidget {
  @override
  _ParamedicsRequestsPageState createState() => _ParamedicsRequestsPageState();
}

class _ParamedicsRequestsPageState extends State<ParamedicsRequestsPage> {
  final List<RescueRequest> rescueRequests = [];
  final _formKey = GlobalKey<FormState>();

  String? _location;
  LatLng? _chosenLocation;
  bool _locationChosen = false;
  Map<int, bool> savedRequests = {};

  TextEditingController _locationController = TextEditingController();
  TextEditingController _userLocationController = TextEditingController();

  void _addRescueRequest() {
    setState(() {
      rescueRequests.add(
        RescueRequest(
          announcementDate: DateTime.now(),
          announcementTime: TimeOfDay.now(),
          location: _location!,
          userLocation: _userLocationController.text,
          chosenLocation: _chosenLocation!,
        ),
      );
    });
  }

  void _editRescueRequest(int index) {
    setState(() {
      rescueRequests[index] = RescueRequest(
        announcementDate: rescueRequests[index].announcementDate,
        announcementTime: rescueRequests[index].announcementTime,
        location: _location!,
        userLocation: _userLocationController.text,
        chosenLocation: _chosenLocation!,
      );
    });
  }

  void _deleteRescueRequest(int index) {
    setState(() {
      rescueRequests.removeAt(index);
    });
  }

  Future<void> _navigateAndSelectLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ChooseLocationPage(userId: 'user_id', userRole: 'admin'),
      ),
    );

    if (result != null && result is LatLng) {
      setState(() {
        _chosenLocation = result;
        _location = '${result.latitude}, ${result.longitude}';
        _locationController.text = _location!;
        _locationChosen = true;
      });
    }
  }

  void _showAddEditDialog({RescueRequest? request, int? index}) {
    if (request != null) {
      _locationController.text = request.location;
      _userLocationController.text = request.userLocation;
      _chosenLocation = request.chosenLocation;
      _locationChosen = true;
    } else {
      _locationController.clear();
      _userLocationController.clear();
      _chosenLocation = null;
      _locationChosen = false;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            request == null ? 'قم باضافة حالة طوارئ جديدة' : 'قم بتعديل حالة الطوارئ',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 15, fontFamily: 'Amiri', color: Color(0xFF071533), fontWeight: FontWeight.bold),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _userLocationController,
                  decoration: InputDecoration(
                    hintText: 'ادخل اسم المكان',
                    hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFffe145)),
                    ),
                  ),
                  cursorColor: Color(0xFFffe145),
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, fontFamily: 'Amiri', color: Color(0xFF071533)),
                  validator: (value) => value!.isEmpty ? 'قم بتحديد اسم الموقع' : null,
                  onChanged: (value) => _location = value,
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'احداثيات الموقع على الخارطة',
                    hintStyle: TextStyle(color: Color(0xFF071533), fontSize: 12, fontFamily: 'Amiri'),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFffe145)),
                    ),
                  ),
                  cursorColor: Color(0xFFffe145),
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, fontFamily: 'Amiri', color: Color(0xFF071533)),
                  readOnly: true,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => _navigateAndSelectLocation(context),
                      child: Row(
                        children: [
                          if (_locationChosen) Icon(Icons.check, color: Colors.green),
                          Text(
                            'قم بتحديد الموقع على الخارطة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFffe145),
                              decoration: TextDecoration.underline,
                              fontFamily: 'Amiri',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'رجوع',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 12,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (index == null) {
                    _addRescueRequest();
                  } else {
                    _editRescueRequest(index);
                  }
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded edges
                  side: BorderSide(color: Color(0xFF071533)),
                ),
              ),
              child: Text(
                'حفظ',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool canEditOrDelete(DateTime announcementDate, TimeOfDay announcementTime) {
    final now = DateTime.now();
    final announcementDateTime = DateTime(
      announcementDate.year,
      announcementDate.month,
      announcementDate.day,
      announcementTime.hour,
      announcementTime.minute,
    );
    return now.difference(announcementDateTime).inHours < 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: AppBar(
            backgroundColor: Color(0xFF071533),
            actions: [
              Center(
                child: Text(
                  '(اضافة حالة طوارئ جديدة (طلب مسعفين',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () => _showAddEditDialog(), // Show dialog directly
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Table(
                border: TableBorder.all(color: Color(0xFF071533)),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الظهور عند المستخدم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'تعديل',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الاحداثيات على الخريطة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الموقع',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الوقت',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'تاريخ الاضافة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...rescueRequests.map((request) {
                    final canEdit = canEditOrDelete(
                        request.announcementDate, request.announcementTime);
                    return TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              savedRequests.containsKey(request.hashCode) &&
                                      savedRequests[request.hashCode]!
                                  ? 'تم اظهاره للمستخدم'
                                  : '',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 4.0,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 17,
                                    color: Color(0xFFffe145),
                                  ),
                                  onPressed: canEdit
                                      ? () => _showAddEditDialog(
                                          request: request,
                                          index:
                                              rescueRequests.indexOf(request))
                                      : null,
                                  color: canEdit ? Colors.blue : Colors.grey,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 17,
                                  ),
                                  onPressed: canEdit
                                      ? () => _deleteRescueRequest(
                                          rescueRequests.indexOf(request))
                                      : null,
                                  color: canEdit ? Colors.red : Colors.grey,
                                ),
                                if (!savedRequests
                                        .containsKey(request.hashCode) ||
                                    !savedRequests[request.hashCode]!)
                                  IconButton(
                                    icon: Icon(
                                      Icons.save,
                                      size: 17,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        savedRequests[request.hashCode] = true;
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${request.chosenLocation.latitude}, ${request.chosenLocation.longitude}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              request.userLocation,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              request.announcementTime.format(context),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              DateFormat.yMMMd()
                                  .format(request.announcementDate),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RescueRequest {
  final String location;
  final String userLocation;
  final DateTime announcementDate;
  final TimeOfDay announcementTime;
  final LatLng chosenLocation;

  RescueRequest({
    required this.location,
    required this.userLocation,
    required this.announcementDate,
    required this.announcementTime,
    required this.chosenLocation,
  });
}
