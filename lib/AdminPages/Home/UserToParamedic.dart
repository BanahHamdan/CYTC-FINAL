// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class UserToParamedic extends StatefulWidget {
//   @override
//   _UserToParamedicState createState() => _UserToParamedicState();
// }

// class _UserToParamedicState extends State<UserToParamedic> {
//   List<Participant> participants = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchParticipants();
//   }

//   Future<void> fetchParticipants() async {
//     final response = await http.get(Uri.parse('http://localhost:9999/user/all'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         participants = (data as List)
//             .map((participant) => Participant.fromJson(participant))
//             .toList();
//       });
//     } else {
//       print('Failed to load participants');
//     }
//   }

//   Future<void> updateParticipantRole(int index, int role) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:9999/user/edit-role'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'_id': participants[index].id, 'role': role.toString()}),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['status']) {
//         setState(() {
//           participants[index].role = role;
//         });
//       } else {
//         print('Failed to update role in database');
//       }
//     } else {
//       print('Failed to update role');
//     }
//   }

//   int calculateAge(String birthDate) {
//     try {
//       DateTime birthDateTime = DateTime.parse(birthDate);
//       DateTime today = DateTime.now();
//       int age = today.year - birthDateTime.year;
//       if (today.month < birthDateTime.month ||
//           (today.month == birthDateTime.month && today.day < birthDateTime.day)) {
//         age--;
//       }
//       return age;
//     } catch (e) {
//       print('Invalid date format: $birthDate');
//       return 0; // Return a default value or handle it accordingly
//     }
//   }

//   Color getRoleColor(int role) {
//     switch (role) {
//       case 1:
//         return Colors.blue;
//       case 2:
//         return Colors.yellow;
//       case 3:
//         return Colors.red;
//       default:
//         return Colors.indigo;
//     }
//   }

//   String getRoleText(int role) {
//     switch (role) {
//       case 1:
//         return 'مسعف';
//       case 2:
//         return 'ادمن';
//       case 3:
//         return 'ادمن2';
//       default:
//         return 'مستخدم';
//     }
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
//           actions: [
//             IconButton(
//               icon: Icon(
//                 LineAwesomeIcons.angle_right_solid,
//                 color: Color(0xFF071533),
//                 size: 20,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Center(
//                           child: Text(
//                             'معلومات المشاركين',
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Color(0xFF071533)),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Table(
//                             columnWidths: {
//                               0: FlexColumnWidth(1),
//                               1: FlexColumnWidth(1),
//                               2: FlexColumnWidth(1),
//                               3: FlexColumnWidth(1),
//                               4: FlexColumnWidth(1),
//                               5: FlexColumnWidth(1),
//                               6: FlexColumnWidth(1),
//                               7: FlexColumnWidth(1.2),
//                               8: FlexColumnWidth(1.2),
//                             },
//                             children: [
//                               TableRow(
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFFe0e0e0),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(20),
//                                     topRight: Radius.circular(20),
//                                   ),
//                                 ),
//                                 children: [
//                                   _buildHeaderCell('تغيير الدور'),
//                                   _buildHeaderCell('دور المستخدم'),
//                                   _buildHeaderCell('العمر'),
//                                   _buildHeaderCell('فصيلة الدم'),
//                                   _buildHeaderCell('المدينة'),
//                                   _buildHeaderCell('رقم الهاتف'),
//                                   _buildHeaderCell('البريد الالكتروني'),
//                                   _buildHeaderCell('الاسم'),
//                                 ],
//                               ),
//                               ...participants.asMap().entries.map((entry) {
//                                 int index = entry.key;
//                                 Participant participant = entry.value;
//                                 return TableRow(
//                                   children: [
//                                     _buildRoleDropdown(index, participant.role),
//                                     _buildColoredTableCell(getRoleText(participant.role), getRoleColor(participant.role)),
//                                     _buildTableCell(calculateAge(participant.birthDate).toString()),
//                                     _buildTableCell(participant.bloodType),
//                                     _buildTableCell(participant.city),
//                                     _buildTableCell(participant.phoneNumber),
//                                     _buildTableCell(participant.email),
//                                     _buildTableCell(participant.name),
//                                   ],
//                                 );
//                               }).toList(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
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

//   TableCell _buildColoredTableCell(String text, Color color) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: 'Amiri',
//             color: color,
//             fontSize: 12,
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildRoleDropdown(int index, int currentRole) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: DropdownButton<int>(
//           value: currentRole,
//           style: TextStyle(
//             fontFamily: 'Amiri',
//             color: Color(0xFF071533),
//             fontSize: 12,
//           ),
//           dropdownColor: Colors.white,
//           icon: Icon(Icons.arrow_drop_down, color: Color(0xFF071533)),
//           isExpanded: true,
//           alignment: Alignment.centerRight,
//           items: [
//             DropdownMenuItem(
//               value: 0,
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Text('مستخدم'),
//               ),
//             ),
//             DropdownMenuItem(
//               value: 1,
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Text('مسعف'),
//               ),
//             ),
//             DropdownMenuItem(
//               value: 2,
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Text('ادمن'),
//               ),
//             ),
//             DropdownMenuItem(
//               value: 3,
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Text('ادمن2'),
//               ),
//             ),
//           ],
//           onChanged: (int? newValue) async {
//             if (newValue != null) {
//               await updateParticipantRole(index, newValue);
//               setState(() {
//                 participants[index].role = newValue;
//               });
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class Participant {
//   final String id;
//   final String name;
//   final String email;
//   final String phoneNumber;
//   final String city;
//   final String bloodType;
//   final String birthDate;
//   int role;

//   Participant({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.city,
//     required this.bloodType,
//     required this.birthDate,
//     this.role = 0,
//   });

//   factory Participant.fromJson(Map<String, dynamic> json) {
//     return Participant(
//       id: json['_id'],
//       name: json['username'],
//       email: json['email'],
//       phoneNumber: json['phoneNumber'],
//       city: json['city'],
//       bloodType: json['bloodType'],
//       birthDate: json['birthDate'] ?? '',
//       role: int.parse(json['role']),
//     );
//   }
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UserToParamedic extends StatefulWidget {
  @override
  _UserToParamedicState createState() => _UserToParamedicState();
}

class _UserToParamedicState extends State<UserToParamedic> {
  List<Participant> participants = [];

  @override
  void initState() {
    super.initState();
    fetchParticipants();
  }

  Future<void> fetchParticipants() async {
    final response = await http.get(Uri.parse('http://localhost:9999/user/all'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        participants = (data as List)
            .map((participant) => Participant.fromJson(participant))
            .toList();
      });
    } else {
      print('Failed to load participants');
    }
  }

  Future<void> updateParticipantRole(int index, int role) async {
    final response = await http.put(
      Uri.parse('http://localhost:9999/user/edit-role'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': participants[index].id, 'newRole': role.toString()}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status']) {
        setState(() {
          participants[index].role = role;
          participants[index].statusChanged = true;
        });
      } else {
        print('Failed to update role in database');
      }
    } else {
      print('Failed to update role');
    }
  }

  int calculateAge(String birthDate) {
    try {
      DateTime birthDateTime = DateTime.parse(birthDate);
      DateTime today = DateTime.now();
      int age = today.year - birthDateTime.year;
      if (today.month < birthDateTime.month ||
          (today.month == birthDateTime.month && today.day < birthDateTime.day)) {
        age--;
      }
      return age;
    } catch (e) {
      print('Invalid date format: $birthDate');
      return 0; // Return a default value or handle it accordingly
    }
  }

  Color getRoleColor(int role) {
    switch (role) {
      case 1:
        return Colors.blue;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.red;
      default:
        return Color(0xFF071533);
    }
  }

  String getRoleText(int role) {
    switch (role) {
      case 1:
        return 'مسعف';
      case 2:
        return 'ادمن';
      case 3:
        return 'مسؤول التبرع بالدم';
      default:
        return 'مستخدم';
    }
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
                              0: FlexColumnWidth(1.2),
                              1: FlexColumnWidth(1.2),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                              7: FlexColumnWidth(1),
                              8: FlexColumnWidth(1),
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
                                  _buildHeaderCell('تغيير'),
                                  _buildHeaderCell('تغيير الدور'),
                                  _buildHeaderCell('دور المستخدم'),
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
                                    _buildChangeCell(index),
                                    _buildRoleDropdown(index, participant.role),
                                    _buildColoredTableCell(getRoleText(participant.role), getRoleColor(participant.role)),
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

  TableCell _buildColoredTableCell(String text, Color color) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            color: color,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  TableCell _buildRoleDropdown(int index, int currentRole) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<int>(
          value: currentRole,
          style: TextStyle(
            fontFamily: 'Amiri',
            color: Color(0xFF071533),
            fontSize: 12,
          ),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down, color: Color(0xFF071533)),
          isExpanded: true,
          alignment: Alignment.centerRight,
          items: [
            DropdownMenuItem(
              value: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('مستخدم'),
              ),
            ),
            DropdownMenuItem(
              value: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('مسعف'),
              ),
            ),
            DropdownMenuItem(
              value: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('ادمن'),
              ),
            ),
            DropdownMenuItem(
              value: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('مسؤول التبرع بالدم'),
              ),
            ),
          ],
          onChanged: (int? newValue) async {
            if (newValue != null) {
              setState(() {
                participants[index].role = newValue;
                participants[index].statusChanged = false;
              });
            }
          },
        ),
      ),
    );
  }

  TableCell _buildChangeCell(int index) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: participants[index].statusChanged
            ? Text(
                'تم التغيير',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            : IconButton(
                icon: Icon(Icons.save, color: Color(0xFF071533)),
                onPressed: () async {
                  await updateParticipantRole(index, participants[index].role);
                },
              ),
      ),
    );
  }
}

class Participant {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String city;
  final String bloodType;
  final String birthDate;
  int role;
  bool statusChanged;

  Participant({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.bloodType,
    required this.birthDate,
    this.role = 0,
    this.statusChanged = false,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['_id'],
      name: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      bloodType: json['bloodType'],
      birthDate: json['birthDate'] ?? '',
      role: int.parse(json['role']),
    );
  }
}
