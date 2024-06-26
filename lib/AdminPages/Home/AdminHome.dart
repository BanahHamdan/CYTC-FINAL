// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

// import 'dart:convert';
// import 'package:cytc/AdminPages/Home/Emergencies/addBloodDonation.dart';
// import 'package:cytc/AdminPages/Home/Emergencies/addParamedics.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'VolunteerOfTheMonth.dart';
// /////////////////////////////
// import 'dart:convert';
// import 'package:cytc/AdminPages/Home/Emergencies/addBloodDonation.dart';
// import 'package:cytc/AdminPages/Home/Emergencies/addParamedics.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'VolunteerOfTheMonth.dart';

// class AdminHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF071533),
//         fontFamily: 'Amiri',
//         textTheme: TextTheme(),
//       ),
//       home: AdminHome(userId: '',
//       child: Text(''),),
//     );
//   }
// }

// class AdminHome extends StatefulWidget {
//   @override
//   _AdminHomePageState createState() => _AdminHomePageState();

//     final String userId;
//   final Widget child;

//   const AdminHome({Key? key, required this.userId, required this.child})
//       : super(key: key);
// }

// class _AdminHomePageState extends State<AdminHome> {
//   late List<charts.Series<PersonEvent, String>> _seriesData;
//   late List<charts.Series<EventParticipants, String>> _seriesEventData;
//   bool isLoading = true;
//   bool isParticipantsLoading = true;

//   List<Volunteer> adminVolunteers = [
//     Volunteer(
//       name: 'بانه خالد حمدان',
//       email: 'banah@example.com',
//       phoneNumber: '123-456-7890',
//       address: 'شارع النخيل',
//       bloodType: 'O+',
//       birthDate: '01/01/1990',
//       imageUrl: 'assets/banah.jpg',
//     ),
//     Volunteer(
//       name: 'Person 2',
//       email: 'person2@example.com',
//       phoneNumber: '987-654-3210',
//       address: 'شارع الزيتون',
//       bloodType: 'A-',
//       birthDate: '02/02/1985',
//       imageUrl: 'assets/images/person2.png',
//     ),
//     Volunteer(
//       name: 'Person 3',
//       email: 'person3@example.com',
//       phoneNumber: '555-555-5555',
//       address: 'شارع الورود',
//       bloodType: 'B+',
//       birthDate: '03/03/1980',
//       imageUrl: 'assets/images/person3.png',
//     ),
//   ];

//   Volunteer? selectedVolunteer;
//   bool isEditing1 = false;
//   bool isEditing2 = false;
//   TextEditingController controller1 =
//       TextEditingController(text: 'اسم المتطوع:');
//   TextEditingController controller2 = TextEditingController(
//       text:
//           'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية الشباب ومهاراتهم الخ الخ الخ');

//   void _saveEdit() {
//     setState(() {
//       isEditing1 = false;
//       isEditing2 = false;
//     });
//   }

//   Future<void> _fetchTopParticipants() async {
//     final response = await http
//         .get(Uri.parse('http://localhost:9999/event-user/top-participants'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['status']) {
//         List<PersonEvent> personData = [];

//         for (var participant in data['topParticipants']) {
//           final userId = participant['userId'];
//           final eventCount = participant['eventCount'];
//           final userResponse =
//               await http.get(Uri.parse('http://localhost:9999/user/$userId'));
//           // .get(Uri.parse('http://127.0.0.1:9999/user/${widget.userId}'));

//           if (userResponse.statusCode == 200) {
//             final userData = jsonDecode(userResponse.body);
//             if (userData['status']) {
//               final username = userData['user']['username'];
//               personData.add(PersonEvent(username, eventCount));
//             } else {
//               print('Error: Failed to get user data for userId: $userId');
//             }
//           } else {
//             print(
//                 'Error: Failed to fetch user data for userId: $userId, StatusCode: ${userResponse.statusCode}');
//           }
//         }

//                setState(() {
//           _seriesData = [
//             charts.Series(
//               domainFn: (PersonEvent personEvent, _) => personEvent.person,
//               measureFn: (PersonEvent personEvent, _) => personEvent.events,
//               id: 'Events',
//               data: personData,
//               fillPatternFn: (_, __) => charts.FillPatternType.solid,
//               fillColorFn: (PersonEvent personEvent, __) =>
//                   charts.ColorUtil.fromDartColor(Color(0xFFffe145),),
//             ),
//           ];
//           isParticipantsLoading = false;
//         });

//       } else {
//         print('Error: Failed to fetch top participants');
//       }
//     } else {
//       print(
//           'Error: Failed to fetch top participants, StatusCode: ${response.statusCode}');
//     }
//   }

//   Future<void> _fetchTopEvents() async {
//     final response = await http
//         .get(Uri.parse('http://localhost:9999/event-user/top-events'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['status']) {
//         final List<EventParticipants> eventData = (data['topEvents'] as List)
//             .map((event) =>
//                 EventParticipants(event['name'], event['participantCount']))
//             .toList();

//                 setState(() {
//           _seriesEventData = [
//             charts.Series(
//               domainFn: (EventParticipants eventParticipants, _) =>
//                   eventParticipants.event,
//               measureFn: (EventParticipants eventParticipants, _) =>
//                   eventParticipants.participants,
//               id: 'Participants',
//               data: eventData,
//               fillPatternFn: (_, __) => charts.FillPatternType.solid,
//               fillColorFn: (EventParticipants eventParticipants, __) =>
//                   charts.ColorUtil.fromDartColor(
//                       Color.fromRGBO(17, 36, 78, 0.576)),
//             ),
//           ];
//           isLoading = false;
//         });

//       } else {
//         print('Error: Failed to fetch top events');
//       }
//     } else {
//       print(
//           'Error: Failed to fetch top events, StatusCode: ${response.statusCode}');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _seriesData = <charts.Series<PersonEvent, String>>[];
//     _seriesEventData = <charts.Series<EventParticipants, String>>[];
//     _fetchTopParticipants();
//     _fetchTopEvents();
//   }

//   void _chooseVolunteerAutomatically() {
//     // Replace with your logic for automated selection
//     Volunteer automatedVolunteer = adminVolunteers[0]; // Example
//     setState(() {
//       selectedVolunteer = automatedVolunteer;
//     });
//   }

//   void _chooseVolunteerManually() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => VolunteerOfTheMonth(
//           onSelected: (volunteer) {
//             setState(() {
//               // selectedVolunteer = volunteer;
//             });
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfff8f9fa),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Row(
//               children: [
//                 Expanded(child: _buildCardMostActivePerson()),
//                 SizedBox(width: 12),
//                 Expanded(child: _buildCardPopularActivities()),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   'قم بادخال حالات الطوارئ  ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFffe145),
//                     fontFamily: 'Amiri',
//                   ),
//                 ),
//                 Image.asset(
//                   'assets/gif/alert.gif',
//                   height: 40,
//                   width: 40,
//                 )
//               ],
//             ),
//             Row(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start, // Align all cards at the top
//               children: [
//                 Expanded(child: _buildEditableCardVolunteerOfTheMonth()),
//                 SizedBox(width: 5),
//                 Expanded(child: _buildEditableCardCenterInfo()),
//                 SizedBox(width: 10),
//                 Expanded(child: _buildCardRequestRescuers()),
//                 SizedBox(width: 5),
//                 Expanded(child: _buildCardRequestBloodUnits()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCardMostActivePerson() {
//     return SizedBox(
//       width: 300, // Adjust the width as needed
//       height: 220, // Adjust the height as needed
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(11.25),
//         ),
//         child: Container(
//           padding: EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'اكثر الاشخاص تفاعلا معنا',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                 ),
//               ),
//               SizedBox(height: 8),
//               isParticipantsLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : SizedBox(
//                       height:
//                           150, // Adjust the height to make the chart smaller
//                       width: 350,
//                       child: charts.BarChart(
//                         _seriesData,
//                         animate: true,
//                         barGroupingType: charts.BarGroupingType.grouped,
//                         animationDuration: Duration(seconds: 5),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// Widget _buildCardPopularActivities() {
//   return SizedBox(
//     width: 500, // Increase the width to utilize empty space
//     height: 220, // Adjust the height as needed
//     child: Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(11.25),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               'الانشطة ذات الاقبال الاكبر',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//               color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : SizedBox(
//                     height: 150, // Adjust the height to make the chart smaller
//                     width: 480, // Adjust the width to fit within the card
//                     child: charts.BarChart(
//                       _seriesEventData,
//                       animate: true,
//                       barGroupingType: charts.BarGroupingType.grouped,
//                       animationDuration: Duration(seconds: 5),
//                       domainAxis: charts.OrdinalAxisSpec(
//                         renderSpec: charts.SmallTickRendererSpec(
//                           labelStyle: charts.TextStyleSpec(
//                             // color: Color(0xFF071533),
//                             fontFamily: 'Amiri',
//                             fontSize: 9, // Adjust the font size as needed
//                             color: charts.MaterialPalette.black,
//                           ),
//                           labelRotation: 0, // No rotation
//                           labelAnchor: charts.TickLabelAnchor.centered,
//                         ),
//                         tickProviderSpec: charts.StaticOrdinalTickProviderSpec(
//                           _seriesEventData.first.data.map((e) {
//                             String formattedLabel = e.event
//                                 .replaceAllMapped(
//                                   RegExp(r'(\S{8})'),
//                                   (match) => '${match[1]}\n',
//                                 )
//                                 .trim();
//                             return charts.TickSpec(formattedLabel);
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

//   // Widget _buildCardPopularActivities() {
//   //   return SizedBox(
//   //     width: 500, // Increase the width to utilize empty space
//   //     height: 220, // Adjust the height as needed
//   //     child: Card(
//   //       shape: RoundedRectangleBorder(
//   //         borderRadius: BorderRadius.circular(11.25),
//   //       ),
//   //       child: Container(
//   //         padding: EdgeInsets.all(10.0),
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.end,
//   //           children: [
//   //             Text(
//   //               'الانشطة ذات الاقبال الاكبر',
//   //               textAlign: TextAlign.center,
//   //               style: TextStyle(
//   //                 color: Color(0xFF071533),
//   //                 fontSize: 15,
//   //                 fontWeight: FontWeight.bold,
//   //               ),
//   //             ),
//   //             SizedBox(height: 8),
//   //             isLoading
//   //                 ? Center(child: CircularProgressIndicator())
//   //                 : SizedBox(
//   //                     height:
//   //                         150, // Adjust the height to make the chart smaller
//   //                     width: 480, // Adjust the width to fit within the card
//   //                     child: charts.BarChart(
//   //                       _seriesEventData,
//   //                       animate: true,
//   //                       barGroupingType: charts.BarGroupingType.grouped,
//   //                       animationDuration: Duration(seconds: 5),
//   //                       domainAxis: charts.OrdinalAxisSpec(
//   //                         renderSpec: charts.SmallTickRendererSpec(
//   //                           labelRotation: 45,
//   //                           labelStyle: charts.TextStyleSpec(
//   //                             fontSize: 10, // Adjust the font size as needed
//   //                             color: charts.MaterialPalette.black,
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _buildEditableCardVolunteerOfTheMonth() {
//     return SizedBox(
//       width: 100, // Adjust the width as needed
//       height: 360, // Adjust the height as needed
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(
//           height: 360,
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'قم باختيار متطوع الشهر المثالي',
//                 style: TextStyle(
//                   color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Divider(color: Colors.grey),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'طريقة الاختيار',
//                 style: TextStyle(
//                   color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               TextButton(
//                 onPressed: _chooseVolunteerAutomatically,
//                 child: Text('بشكل اوتوماتيكي',
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: Color(0xFFE94444),
//         fontFamily: 'Amiri',
//                       decoration: TextDecoration.underline,
//                     )),
//               ),
//               TextButton(
//                 onPressed: _chooseVolunteerManually,
//                 child: Text('بشكل يدوي',
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: Color(0xFFE94444),
//         fontFamily: 'Amiri',
//                       decoration: TextDecoration.underline,
//                     )),
//               ),
//               if (selectedVolunteer != null) ...[
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text('متطوع الشهر المثالي الحالي',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                                 fontFamily: 'Amiri',
//                               )),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(
//                                 15.0), // Adjust the radius as needed
//                             child: Image.asset(
//                               selectedVolunteer!.imageUrl,
//                               height: 70,
//                               width: 70,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 3,
//                           ),
//                           Text(selectedVolunteer!.name,
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 color: Color(0xFF071533),
//                                 fontFamily: 'Amiri',
//                               )),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _saveEdit,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white, // Background color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         side: BorderSide(color: Color(0xFF071533), width: 1.0),
//                       ),
//                     ),
//                     child: Text(
//                       'تأكيد',
//                       style: TextStyle(fontSize: 10, color: Color(0xFF071533),
//         fontFamily: 'Amiri',),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildEditableCardCenterInfo() {
//     return SizedBox(
//       width: 100, // Adjust the width as needed
//       height: 360, // Adjust the height as needed
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(
//           height: 360,
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'تعريف عن المركز',
//                 style: TextStyle(
//                   color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Divider(color: Colors.grey),
//               SizedBox(height: 6),
//               isEditing2
//                   ? TextField(
//                       controller: controller2,
//                       textAlign: TextAlign.right,
//                       maxLines: null,
//                       style: TextStyle(color: Color(0xFF071533),
//         fontFamily: 'Amiri', fontSize: 10),
//                       cursorColor: Color(0xFFffe145),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Color(0xFFffe145), width: 1.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     )
//                   : Text(
//                       controller2.text,
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                       ),
//                     ),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _saveEdit,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF071533),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         side: BorderSide(color: Color(0xFF071533), width: 1.0),
//                       ),
//                     ),
//                     child: Text('حفظ',
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Colors.white,
//         fontFamily: 'Amiri',
//                         )),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isEditing2 = true;
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white, // Background color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         side: BorderSide(color: Color(0xFF071533), width: 1.0),
//                       ),
//                     ),
//                     child: Text('تعديل',
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                         )),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCardRequestRescuers() {
//     return SizedBox(
//       width: 80, // Adjust the width as needed
//       height: 150, // Adjust the height as needed
//       child: InkWell(
//         onTap: () { 
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ParamedicsRequests()
//               ),
//           );
//         },
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(11.25),
//           ),
//           child: Container(
//             height: 75,
//             padding: EdgeInsets.all(12.0),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'طلب مسعفين',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Image.asset(
//                     'assets/adminPage/ambulance.png',
//                     width: 80,
//                     height: 80,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCardRequestBloodUnits() {
//     return SizedBox(
//       width: 80, // Adjust the width as needed
//       height: 150, // Adjust the height as needed
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => BloodRequests()),
//           );
//         },
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(11.25),
//           ),
//           child: Container(
//             alignment: Alignment.topCenter,
//             height: 75,
//             padding: EdgeInsets.all(12.0),
//             child: Center(
//               child: Column(
//                 children: [
//                   Text(
//                     'طلب وحدات دم',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Color(0xFF071533),
//         fontFamily: 'Amiri',
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Image.asset(
//                     'assets/adminPage/bloodAdd.png',
//                     width: 70,
//                     height: 70,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PersonEvent {
//   String person;
//   int events;
//   PersonEvent(this.person, this.events);
// }

// class EventParticipants {
//   String event;
//   int participants;

//   EventParticipants(this.event, this.participants);
// }

// class Volunteer {
//   final String name;
//   final String email;
//   final String phoneNumber;
//   final String address;
//   final String bloodType;
//   final String birthDate;
//   final String imageUrl;
//   bool isSelected;

//   Volunteer({
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.address,
//     required this.bloodType,
//     required this.birthDate,
//     required this.imageUrl,
//     this.isSelected = false,
//   });
// }


// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:convert';
import 'package:cytc/AdminPages/Home/Emergencies/addBloodDonation.dart';
import 'package:cytc/AdminPages/Home/Emergencies/addParamedics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'VolunteerOfTheMonth.dart';
/////////////////////////////
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'VolunteerOfTheMonth.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(),
      ),
      home: AdminHome(
        userId: '',
        child: Text(''),
      ),
    );
  }
}

class AdminHome extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();

  final String userId;
  final Widget child;

  const AdminHome({Key? key, required this.userId, required this.child})
      : super(key: key);
}

class _AdminHomePageState extends State<AdminHome> {
  late List<charts.Series<PersonEvent, String>> _seriesData;
  late List<charts.Series<EventParticipants, String>> _seriesEventData;
  bool isLoading = true;
  bool isParticipantsLoading = true;

  List<Volunteer> adminVolunteers = [
    Volunteer(
      name: 'بانه خالد حمدان',
      email: 'banah@example.com',
      phoneNumber: '123-456-7890',
      address: 'شارع النخيل',
      bloodType: 'O+',
      birthDate: '01/01/1990',
      imageUrl: 'assets/banah.jpg',
      id: '1',
    ),
    Volunteer(
      name: 'Person 2',
      email: 'person2@example.com',
      phoneNumber: '987-654-3210',
      address: 'شارع الزيتون',
      bloodType: 'A-',
      birthDate: '02/02/1985',
      imageUrl: 'assets/images/person2.png',
      id: '2',
    ),
    Volunteer(
      name: 'Person 3',
      email: 'person3@example.com',
      phoneNumber: '555-555-5555',
      address: 'شارع الورود',
      bloodType: 'B+',
      birthDate: '03/03/1980',
      imageUrl: 'assets/images/person3.png',
      id: '3',
    ),
  ];

  Volunteer? selectedVolunteer;
  bool isEditing1 = false;
  bool isEditing2 = false;
  TextEditingController controller1 =
      TextEditingController(text: 'اسم المتطوع:');
  TextEditingController controller2 = TextEditingController(
      text:
          'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية الشباب ومهاراتهم الخ الخ الخ');

  void _saveEdit() async {
    if (selectedVolunteer != null) {
      final now = DateTime.now();
      final month =
          '${now.month.toString().padLeft(2, '0')}'; // Formats month as "YYYY-MM"

      final url = Uri.parse('http://localhost:9999/volunteer/add');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'userId': selectedVolunteer!
              .id, // Assuming 'id' field exists in your Volunteer model
          'username': selectedVolunteer!.name,
          'userImageUrl': selectedVolunteer!.imageUrl,
          'month': month,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle successful response
        final responseData = jsonDecode(response.body);
        if (responseData['status']) {
          // Show a success message or update your UI
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Volunteer added successfully')),
          );
        } else {
          // Handle error response
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Failed to add volunteer: ${responseData['message']}')),
          );
        }
      } else {
        // Handle error in request
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred while adding volunteer')),
        );
      }
    }
  }

  Future<void> _fetchTopParticipants() async {
    final response = await http
        .get(Uri.parse('http://localhost:9999/event-user/top-participants'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status']) {
        List<PersonEvent> personData = [];

        for (var participant in data['topParticipants']) {
          final userId = participant['userId'];
          final eventCount = participant['eventCount'];
          final userResponse =
              await http.get(Uri.parse('http://localhost:9999/user/$userId'));
          // .get(Uri.parse('http://127.0.0.1:9999/user/${widget.userId}'));

          if (userResponse.statusCode == 200) {
            final userData = jsonDecode(userResponse.body);
            if (userData['status']) {
              final username = userData['user']['username'];
              personData.add(PersonEvent(username, eventCount));
            } else {
              print('Error: Failed to get user data for userId: $userId');
            }
          } else {
            print(
                'Error: Failed to fetch user data for userId: $userId, StatusCode: ${userResponse.statusCode}');
          }
        }

        setState(() {
          _seriesData = [
            charts.Series(
              domainFn: (PersonEvent personEvent, _) => personEvent.person,
              measureFn: (PersonEvent personEvent, _) => personEvent.events,
              id: 'Events',
              data: personData,
              fillPatternFn: (_, __) => charts.FillPatternType.solid,
              fillColorFn: (PersonEvent personEvent, __) =>
                  charts.ColorUtil.fromDartColor(
                Color(0xFFffe145),
              ),
            ),
          ];
          isParticipantsLoading = false;
        });
      } else {
        print('Error: Failed to fetch top participants');
      }
    } else {
      print(
          'Error: Failed to fetch top participants, StatusCode: ${response.statusCode}');
    }
  }

  Future<void> _fetchTopEvents() async {
    final response = await http
        .get(Uri.parse('http://localhost:9999/event-user/top-events'));
    print('t0p events ');
    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status']) {
        final List<EventParticipants> eventData = (data['topEvents'] as List)
            .map((event) =>
                EventParticipants(event['name'], event['participantCount']))
            .toList();

        setState(() {
          _seriesEventData = [
            charts.Series(
              domainFn: (EventParticipants eventParticipants, _) =>
                  eventParticipants.event,
              measureFn: (EventParticipants eventParticipants, _) =>
                  eventParticipants.participants,
              id: 'Participants',
              data: eventData,
              fillPatternFn: (_, __) => charts.FillPatternType.solid,
              fillColorFn: (EventParticipants eventParticipants, __) =>
                  charts.ColorUtil.fromDartColor(
                      Color.fromRGBO(17, 36, 78, 0.576)),
            ),
          ];
          isLoading = false;
        });
      } else {
        print('Error: Failed to fetch top events');
      }
    } else {
      print(
          'Error: Failed to fetch top events, StatusCode: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _seriesData = <charts.Series<PersonEvent, String>>[];
    _seriesEventData = <charts.Series<EventParticipants, String>>[];
    _fetchTopParticipants();
    _fetchTopEvents();
  }

  void _chooseVolunteerAutomatically() async {
    final topParticipantUrl =
        Uri.parse('http://localhost:9999/event-user/top-one');
    try {
      final topParticipantResponse = await http.get(topParticipantUrl);
      if (topParticipantResponse.statusCode == 200) {
        final topParticipantData = jsonDecode(topParticipantResponse.body);
        if (topParticipantData['status'] &&
            topParticipantData['topParticipants'].isNotEmpty) {
          final userId = topParticipantData['topParticipants'][0]['userId'];

          final userDetailsUrl =
              Uri.parse('http://localhost:9999/user/$userId');
          final userDetailsResponse = await http.get(userDetailsUrl);
          if (userDetailsResponse.statusCode == 200) {
            final userData = jsonDecode(userDetailsResponse.body);
            if (userData['status']) {
              final user = userData['user'];
              setState(() {
                selectedVolunteer = Volunteer(
                  name: user['username'],
                  email: user['email'],
                  phoneNumber: user['phoneNumber'],
                  address:
                      user['city'], // Assuming city is used as address here
                  bloodType: user['bloodType'],
                  birthDate:
                      user['birthDate'].substring(0, 10), // Format the date
                  imageUrl: user['imageUrl'],
                  id: user['id'],
                );
              });
            }
          } else {
            print('Failed to fetch user details');
          }
        } else {
          print('No active participants found');
        }
      } else {
        print('Failed to fetch top participant');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  void _chooseVolunteerManually() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VolunteerOfTheMonth(
          onSelected: (volunteer) {
            setState(() {
              // selectedVolunteer = volunteer;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(child: _buildCardMostActivePerson()),
                SizedBox(width: 12),
                Expanded(child: _buildCardPopularActivities()),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'قم بادخال حالات الطوارئ  ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFffe145),
                    fontFamily: 'Amiri',
                  ),
                ),
                Image.asset(
                  'assets/gif/alert.gif',
                  height: 40,
                  width: 40,
                )
              ],
            ),
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align all cards at the top
              children: [
                Expanded(child: _buildEditableCardVolunteerOfTheMonth()),
                SizedBox(width: 5),
                Expanded(child: _buildEditableCardCenterInfo()),
                SizedBox(width: 10),
                Expanded(child: _buildCardRequestRescuers()),
                SizedBox(width: 5),
                Expanded(child: _buildCardRequestBloodUnits()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardMostActivePerson() {
    return SizedBox(
      width: 300, // Adjust the width as needed
      height: 220, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.25),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'اكثر الاشخاص تفاعلا معنا',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                ),
              ),
              SizedBox(height: 8),
              isParticipantsLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height:
                          150, // Adjust the height to make the chart smaller
                      width: 350,
                      child: charts.BarChart(
                        _seriesData,
                        animate: true,
                        barGroupingType: charts.BarGroupingType.grouped,
                        animationDuration: Duration(seconds: 5),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardPopularActivities() {
    return SizedBox(
      width: 500, // Increase the width to utilize empty space
      height: 220, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.25),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الانشطة ذات الاقبال الاكبر',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height:
                          150, // Adjust the height to make the chart smaller
                      width: 480, // Adjust the width to fit within the card
                      child: charts.BarChart(
                        _seriesEventData,
                        animate: true,
                        barGroupingType: charts.BarGroupingType.grouped,
                        animationDuration: Duration(seconds: 5),
                        domainAxis: charts.OrdinalAxisSpec(
                          renderSpec: charts.SmallTickRendererSpec(
                            labelStyle: charts.TextStyleSpec(
                              // color: Color(0xFF071533),
                              fontFamily: 'Amiri',
                              fontSize: 9, // Adjust the font size as needed
                              color: charts.MaterialPalette.black,
                            ),
                            labelRotation: 0, // No rotation
                            labelAnchor: charts.TickLabelAnchor.centered,
                          ),
                          tickProviderSpec:
                              charts.StaticOrdinalTickProviderSpec(
                            _seriesEventData.first.data.map((e) {
                              String formattedLabel = e.event
                                  .replaceAllMapped(
                                    RegExp(r'(\S{8})'),
                                    (match) => '${match[1]}\n',
                                  )
                                  .trim();
                              return charts.TickSpec(formattedLabel);
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableCardVolunteerOfTheMonth() {
    return SizedBox(
      width: 100, // Adjust the width as needed
      height: 360, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 360,
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'قم باختيار متطوع الشهر المثالي',
                style: TextStyle(
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(
                height: 10,
              ),
              Text(
                'طريقة الاختيار',
                style: TextStyle(
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: _chooseVolunteerAutomatically,
                child: Text('بشكل اوتوماتيكي',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE94444),
                      fontFamily: 'Amiri',
                      decoration: TextDecoration.underline,
                    )),
              ),
              TextButton(
                onPressed: _chooseVolunteerManually,
                child: Text('بشكل يدوي',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE94444),
                      fontFamily: 'Amiri',
                      decoration: TextDecoration.underline,
                    )),
              ),
              if (selectedVolunteer != null) ...[
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('متطوع الشهر المثالي الحالي',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF071533),
                                fontFamily: 'Amiri',
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                15.0), // Adjust the radius as needed
                            child: Image.network(
                              selectedVolunteer!.imageUrl,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(selectedVolunteer!.name,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF071533),
                                fontFamily: 'Amiri',
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: _saveEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF071533), width: 1.0),
                      ),
                    ),
                    child: Text(
                      'تأكيد',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableCardCenterInfo() {
    return SizedBox(
      width: 100, // Adjust the width as needed
      height: 360, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 360,
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'تعريف عن المركز',
                style: TextStyle(
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 6),
              isEditing2
                  ? TextField(
                      controller: controller2,
                      textAlign: TextAlign.right,
                      maxLines: null,
                      style: TextStyle(
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                          fontSize: 10),
                      cursorColor: Color(0xFFffe145),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFffe145), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    )
                  : Text(
                      controller2.text,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                      ),
                    ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _saveEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF071533),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF071533), width: 1.0),
                      ),
                    ),
                    child: Text('حفظ',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontFamily: 'Amiri',
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing2 = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF071533), width: 1.0),
                      ),
                    ),
                    child: Text('تعديل',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardRequestRescuers() {
    return SizedBox(
      width: 80, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ParamedicsRequests()),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.25),
          ),
          child: Container(
            height: 75,
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'طلب مسعفين',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF071533),
                      fontFamily: 'Amiri',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/adminPage/ambulance.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardRequestBloodUnits() {
    return SizedBox(
      width: 80, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BloodRequests()),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.25),
          ),
          child: Container(
            alignment: Alignment.topCenter,
            height: 75,
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'طلب وحدات دم',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF071533),
                      fontFamily: 'Amiri',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    'assets/adminPage/bloodAdd.png',
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PersonEvent {
  String person;
  int events;
  PersonEvent(this.person, this.events);
}

class EventParticipants {
  String event;
  int participants;

  EventParticipants(this.event, this.participants);
}

class Volunteer {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String bloodType;
  final String birthDate;
  final String imageUrl;
  final String id; // Added id field
  bool isSelected;

  Volunteer({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.bloodType,
    required this.birthDate,
    required this.imageUrl,
    required this.id, // Added id field
    this.isSelected = false,
  });
}