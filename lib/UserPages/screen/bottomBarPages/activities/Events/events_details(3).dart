// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class EventDetails extends StatelessWidget {
//   final Map<String, dynamic> event;

//   const EventDetails({super.key, required this.event});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions:[  
//           IconButton(
//           alignment: Alignment.centerRight,
//           icon: Icon(Icons.close, color: Colors.grey),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'شارك معنا في انشطتنا',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF071533),
//                   fontFamily: 'Amiri',
//                 ),
//               ),
//               SizedBox(height: 20),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'اسم النشاط',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFFffe145),
//                           fontFamily: 'Amiri',
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         event['name'],
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF071533),
//                           fontFamily: 'Amiri',
//                         ),
//                       ),
//                       Divider(thickness: 1, height: 20),
//                       Text(
//                         event['description'],
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFF071533),
//                           fontFamily: 'Amiri',
//                         ),
//                       ),
//                       Divider(thickness: 1, height: 20),
//                       _buildInfoColumn('الحد الاقصى لعدد المشاركين',
//                           'فرداً ${event['maxParticipants']}'),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 children: [
//                   _buildStatCard('اعمار المشاركين في هذا النشاط', '15-25',
//                       'بين الاعمار التالية', Icons.person),
//                   _buildStatCard(
//                     'تاريخ بداية وانتهاء النشاط',
//                     '${_formatDate(event['startDate'])} - ${_formatDate(event['endDate'])}',
//                     'يوم',
//                     Icons.date_range,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   _showParticipationDialog(context);
//                   // Add functionality for the register button
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF071533),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.add),
//                     SizedBox(width: 10),
//                     Text(
//                       'سجل الآن',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontFamily: 'Amiri',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String _formatDate(String dateStr) {
//     final date = DateTime.parse(dateStr);
//     final formatter = DateFormat('yyyy-MM-dd');
//     return formatter.format(date);
//   }

//   Widget _buildInfoColumn(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             color: Color(0xFFffe145),
//             fontFamily: 'Amiri',
//           ),
//         ),
//         SizedBox(height: 5),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF071533),
//             fontFamily: 'Amiri',
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStatCard(
//       String title, String count, String unit, IconData icon) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(icon, color: Color(0xFFffe145), size: 30),
//             SizedBox(height: 10),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF071533),
//                 fontFamily: 'Amiri',
//               ),
//             ),
//             // SizedBox(height: 5),
//             Text(
//               count,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFffe145),
//                 fontFamily: 'Amiri',
//               ),
//             ),
//             // Text(
//             //   unit,
//             //   textAlign: TextAlign.right,
//             //   style: TextStyle(
//             //     fontSize: 16,
//             //     color: Color(0xFFffe145),
//             //     fontFamily: 'Amiri',
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void _showParticipationDialog(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'عند ضغطك على زر تأكيد التسجيل \n فأنت تقوم بتأكيد مشاركتك في هذا النشاط',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Color(0xFF071533),
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Amiri',
//                 ),
//               ),         
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle donate button press
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF071533),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: EdgeInsets.all(18),
//                 ),
//                 child: Text(
//                   'تأكيد التسجيل',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontFamily: 'Amiri',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventDetails extends StatelessWidget {
  final Map<String, dynamic> event;
  final String userId;

  const EventDetails({super.key, required this.event, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            alignment: Alignment.centerRight,
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'شارك معنا في انشطتنا',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'رقم النشاط',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFffe145),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        event['_id']
                            .toString(), // Corrected key to access event ID
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      Divider(thickness: 1, height: 20),
                      Text(
                        'اسم النشاط',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFffe145),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        event['name'],
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      Divider(thickness: 1, height: 20),
                      Text(
                        event['description'],
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      Divider(thickness: 1, height: 20),
                      _buildInfoColumn('الحد الاقصى لعدد المشاركين',
                          'فرداً ${event['maxParticipants']}'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildStatCard('اعمار المشاركين في هذا النشاط', '15-25',
                      'بين الاعمار التالية', Icons.person),
                  _buildStatCard(
                    'تاريخ بداية وانتهاء النشاط',
                    '${_formatDate(event['startDate'])} - ${_formatDate(event['endDate'])}',
                    'يوم',
                    Icons.date_range,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showParticipationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF071533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text(
                      'سجل الآن',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Amiri',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerForEvent(BuildContext context) async {
    final url = Uri.parse('http://localhost:9999/event-user/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'eventId': event['_id'],
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successfully registered
      Navigator.pop(context); // Close the dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم التسجيل بنجاح')),
      );
    } else {
      // Error registering
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل التسجيل')),
      );
    }
  }

  String _formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFffe145),
            fontFamily: 'Amiri',
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF071533),
            fontFamily: 'Amiri',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String count, String unit, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Color(0xFFffe145), size: 30),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF071533),
                fontFamily: 'Amiri',
              ),
            ),
            Text(
              count,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFFffe145),
                fontFamily: 'Amiri',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showParticipationDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'عند ضغطك على زر تأكيد التسجيل \n فأنت تقوم بتأكيد مشاركتك في هذا النشاط',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF071533),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  registerForEvent(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF071533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(18),
                ),
                child: Text(
                  'تأكيد التسجيل',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}