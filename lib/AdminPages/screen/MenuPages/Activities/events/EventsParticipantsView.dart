// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';

// class ParticipantsInfoPage extends StatefulWidget {
//   @override
//   _ParticipantsInfoPageState createState() => _ParticipantsInfoPageState();
// }

// class _ParticipantsInfoPageState extends State<ParticipantsInfoPage> {
//   List<Participant> participants = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchParticipants();
//   }

//   Future<void> fetchParticipants() async {
//     // Replace with your actual API endpoint
//     final response = await http.get(Uri.parse('http://localhost:9999/participants'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         participants = (data['participants'] as List)
//             .map((participant) => Participant.fromJson(participant))
//             .toList();
//       });
//     } else {
//       print('Failed to load participants');
//     }
//   }

//   int calculateAge(String birthDate) {
//     DateTime birthDateTime = DateTime.parse(birthDate);
//     DateTime today = DateTime.now();
//     int age = today.year - birthDateTime.year;
//     if (today.month < birthDateTime.month ||
//         (today.month == birthDateTime.month && today.day < birthDateTime.day)) {
//       age--;
//     }
//     return age;
//   }

//   void updateParticipantStatus(int index, bool isAccepted) {
//     setState(() {
//       participants[index].status = isAccepted ? 'مقبول' : 'مرفوض';
//     });
//   }

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
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Color(0xFF071533),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Center(
//                   child: Text(
//                     'معلومات المشاركين',
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF071533),
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF071533)),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Table(
//                     columnWidths: {
//                       0: FlexColumnWidth(1),
//                       1: FlexColumnWidth(1.2),
//                       2: FlexColumnWidth(1.2),
//                       3: FlexColumnWidth(1),
//                       4: FlexColumnWidth(1),
//                       5: FlexColumnWidth(1),
//                       6: FlexColumnWidth(1.5),
//                       7: FlexColumnWidth(1),
//                       8: FlexColumnWidth(1),
//                       9: FlexColumnWidth(1),
//                     },
//                     children: [
//                       TableRow(
//                         decoration: BoxDecoration(
//                           color: Color(0xFFe0e0e0),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20),
//                           ),
//                         ),
//                         children: [
//                           _buildHeaderCell('الاسم'),
//                           _buildHeaderCell('البريد الالكتروني'),
//                           _buildHeaderCell('رقم الهاتف'),
//                           _buildHeaderCell('المدينة'),
//                           _buildHeaderCell('فصيلة الدم'),
//                           _buildHeaderCell('العمر'),
//                           _buildHeaderCell('تحديد المسعفين'),
//                           _buildHeaderCell('قبول ام حذف'),
//                           _buildHeaderCell('الحالة'),
//                         ],
//                       ),
//                       ...participants.asMap().entries.map((entry) {
//                         int index = entry.key;
//                         Participant participant = entry.value;
//                         return TableRow(
//                           children: [
//                             _buildTableCell(participant.name),
//                             _buildTableCell(participant.email),
//                             _buildTableCell(participant.phoneNumber),
//                             _buildTableCell(participant.city),
//                             _buildTableCell(participant.bloodType),
//                             _buildTableCell(calculateAge(participant.birthDate).toString()),
//                             _buildTableCell(participant.role == 1 ? 'مسعف' : ''),
//                             _buildActionButtons(index),
//                             _buildTableCell(participant.status),
//                           ],
//                         );
//                       }).toList(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildHeaderCell(String text) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: 'Amiri',
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF071533),
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildTableCell(String text) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: 'Amiri',
//             color: Color(0xFF071533),
//             fontSize: 12,
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildActionButtons(int index) {
//     return TableCell(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.check,
//               color: Colors.green,
//             ),
//             onPressed: () => updateParticipantStatus(index, true),
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.delete,
//               color: Colors.red,
//             ),
//             onPressed: () => updateParticipantStatus(index, false),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Participant {
//   final String name;
//   final String email;
//   final String phoneNumber;
//   final String city;
//   final String bloodType;
//   final String birthDate;
//   final int role;
//   String status;

//   Participant({
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.city,
//     required this.bloodType,
//     required this.birthDate,
//     required this.role,
//     this.status = '',
//   });

//   factory Participant.fromJson(Map<String, dynamic> json) {
//     return Participant(
//       name: json['name'],
//       email: json['email'],
//       phoneNumber: json['phoneNumber'],
//       city: json['city'],
//       bloodType: json['bloodType'],
//       birthDate: json['birthDate'],
//       role: json['role'],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ParticipantsInfoPage extends StatefulWidget {
  @override
  _ParticipantsInfoPageState createState() => _ParticipantsInfoPageState();
}

class _ParticipantsInfoPageState extends State<ParticipantsInfoPage> {
  List<Participant> participants = [
    Participant(
      name: 'راما عصام مفيد عوكل',
      email: 'rama@example.com',
      phoneNumber: '123-456-7890',
      city: 'نابلس',
      bloodType: 'O+',
      birthDate: '1995-01-01',
      role: 0,
      status: 'مقبول',
    ),
  ];

  @override
  void initState() {
    super.initState();
    fetchParticipants();
  }

  Future<void> fetchParticipants() async {
    // Replace with your actual API endpoint
    final response = await http.get(Uri.parse('http://localhost:9999/participants'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        participants.addAll((data['participants'] as List)
            .map((participant) => Participant.fromJson(participant))
            .toList());
      });
    } else {
      print('Failed to load participants');
    }
  }

  int calculateAge(String birthDate) {
    DateTime birthDateTime = DateTime.parse(birthDate);
    DateTime today = DateTime.now();
    int age = today.year - birthDateTime.year;
    if (today.month < birthDateTime.month ||
        (today.month == birthDateTime.month && today.day < birthDateTime.day)) {
      age--;
    }
    return age;
  }

  void updateParticipantStatus(int index, bool isAccepted) {
    setState(() {
      participants[index].status = isAccepted ? 'مقبول' : 'مرفوض';
    });
  }

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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                LineAwesomeIcons.angle_right_solid,
                color: Color(0xFF071533),
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            'معلومات المشاركين',
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF071533)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                              7: FlexColumnWidth(1.2),
                              8: FlexColumnWidth(1.2),
                              9: FlexColumnWidth(1.5),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xFFe0e0e0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                children: [
                                  _buildHeaderCell('الحالة'),
                                  _buildHeaderCell('قبول ام حذف'),
                                  _buildHeaderCell('تحديد المسعفين'),
                                  _buildHeaderCell('العمر'),
                                  _buildHeaderCell('فصيلة الدم'),
                                  _buildHeaderCell('المدينة'),
                                  _buildHeaderCell('رقم الهاتف'),
                                  _buildHeaderCell('البريد الالكتروني'),
                                  _buildHeaderCell('الاسم'),
                                ],
                              ),
                              ...participants.asMap().entries.map((entry) {
                                int index = entry.key;
                                Participant participant = entry.value;
                                return TableRow(
                                  children: [
                                    _buildTableCell(participant.status),
                                    _buildActionButtons(index),
                                    _buildTableCell(participant.role == 1 ? 'مسعف' : ''),
                                    _buildTableCell(calculateAge(participant.birthDate).toString()),
                                    _buildTableCell(participant.bloodType),
                                    _buildTableCell(participant.city),
                                    _buildTableCell(participant.phoneNumber),
                                    _buildTableCell(participant.email),
                                    _buildTableCell(participant.name),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableCell _buildHeaderCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontWeight: FontWeight.bold,
            color: Color(0xFF071533),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  TableCell _buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            color: Color(0xFF071533),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  TableCell _buildActionButtons(int index) {
    return TableCell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.green,
            ),
            onPressed: () => updateParticipantStatus(index, true),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => updateParticipantStatus(index, false),
          ),
        ],
      ),
    );
  }
}

class Participant {
  final String name;
  final String email;
  final String phoneNumber;
  final String city;
  final String bloodType;
  final String birthDate;
  final int role;
  String status;

  Participant({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.bloodType,
    required this.birthDate,
    required this.role,
    this.status = '',
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      bloodType: json['bloodType'],
      birthDate: json['birthDate'],
      role: json['role'],
    );
  }
}
