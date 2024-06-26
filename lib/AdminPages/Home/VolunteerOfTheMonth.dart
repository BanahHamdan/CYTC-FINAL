// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class VolunteerOfTheMonth extends StatelessWidget {
//   final Function(Volunteer) onSelected;

//   VolunteerOfTheMonth({required this.onSelected});

//   @override
//   Widget build(BuildContext context) {
//     List<Volunteer> volunteers = [
//       Volunteer(
//         name: 'John Doe',
//         email: 'john.doe@example.com',
//         phoneNumber: '123-456-7890',
//         address: '123 Elm Street',
//         bloodType: 'O+',
//         birthDate: '01/01/1990',
//         imageUrl: 'assets/john_doe.jpg',
//       ),
//       Volunteer(
//         name: 'Jane Smith',
//         email: 'jane.smith@example.com',
//         phoneNumber: '987-654-3210',
//         address: '456 Oak Avenue',
//         bloodType: 'A-',
//         birthDate: '02/02/1985',
//         imageUrl: 'assets/jane_smith.jpg',
//       ),
//       // Add more static volunteers as needed
//     ];

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF071533),
//         fontFamily: 'Amiri',
//         textTheme: TextTheme(
//           bodyText2: TextStyle(color: Color(0xFF071533)),
//         ),
//       ),
//       home: VolunteerOfTheMonthPage(
//           volunteers: volunteers, onSelected: onSelected,),
//     );
//   }
// }

// class VolunteerOfTheMonthPage extends StatefulWidget {
//   final List<Volunteer> volunteers;
//   final Function(Volunteer) onSelected;
//   VolunteerOfTheMonthPage({required this.volunteers, required this.onSelected,});

//   @override
//   _VolunteerOfTheMonthPageState createState() =>
//       _VolunteerOfTheMonthPageState();
// }

// class _VolunteerOfTheMonthPageState extends State<VolunteerOfTheMonthPage> {
//   int? selectedVolunteerIndex;

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
//               IconButton(
//                   icon: Icon(
//                     LineAwesomeIcons.angle_right_solid,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onPressed: () {
                    // Navigator.push(
                    //     context, 
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminBar(userId: '', userRole:'')
                    //       )
                    //       );
//                   } // Show dialog directly
//                   ),
//             ],
//             title: Center(
//               child:Text(
//               'قم باختيار متطوع الشهر المثالي',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontSize: 20,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
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
//                   6: FlexColumnWidth(0.5),
//                 },
//                 children: [
//                   TableRow(
//                     decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
//                     children: [
//                       _buildHeaderCell('تاريخ الميلاد'),
//                       _buildHeaderCell('فصيلة الدم'),
//                       _buildHeaderCell('رقم الهاتف'),
//                       _buildHeaderCell('مكان السكن'),
//                       _buildHeaderCell('البريد الالكتروني'),
//                       _buildHeaderCell('اسم المستخدم'),
//                       _buildHeaderCell(''),
//                     ],
//                   ),
//                   ...widget.volunteers.map((volunteer) {
//                     int index = widget.volunteers.indexOf(volunteer);
//                     return TableRow(
//                       children: [
//                         _buildTableCell(volunteer.birthDate),
//                         _buildTableCell(volunteer.bloodType),
//                         _buildTableCell(volunteer.phoneNumber),
//                         _buildTableCell(volunteer.address),
//                         _buildTableCell(volunteer.email),
//                         _buildTableCell(volunteer.name),
//                         _buildCheckBox(index),
//                       ],
//                     );
//                   }).toList(),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (selectedVolunteerIndex != null) {
//                       widget.onSelected(
//                           widget.volunteers[selectedVolunteerIndex!]);
//                       Navigator.pop(
//                           context, widget.volunteers[selectedVolunteerIndex!]);
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF071533), // Background color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15), // Rounded edges
//                     ),
//                   ),
//                   child: Text(
//                     'اختيار',
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       fontSize: 14,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
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

//   TableCell _buildCheckBox(int index) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Checkbox(
//           value: selectedVolunteerIndex == index,
//           onChanged: (bool? value) {
//             setState(() {
//               selectedVolunteerIndex = value! ? index : null;
//             });
//           },
//           activeColor: Color(0xFF071533),
//         ),
//       ),
//     );
//   }
// }

// class Volunteer {
//   final String name;
//   final String email;
//   final String phoneNumber;
//   final String address;
//   final String bloodType;
//   final String birthDate;
//   final String imageUrl;

//   Volunteer({
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.address,
//     required this.bloodType,
//     required this.birthDate,
//     required this.imageUrl,
//   });
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VolunteerOfTheMonth extends StatelessWidget {
  final Function(Volunteer) onSelected;

  VolunteerOfTheMonth({required this.onSelected});

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
      home: VolunteerOfTheMonthPage(onSelected: onSelected),
    );
  }
}

class VolunteerOfTheMonthPage extends StatefulWidget {
  final Function(Volunteer) onSelected;

  VolunteerOfTheMonthPage({required this.onSelected});

  @override
  _VolunteerOfTheMonthPageState createState() =>
      _VolunteerOfTheMonthPageState();
}

class _VolunteerOfTheMonthPageState extends State<VolunteerOfTheMonthPage> {
  int? selectedVolunteerIndex;
  List<Volunteer> volunteers = [];

  @override
  void initState() {
    super.initState();
    fetchVolunteers();
  }

  Future<void> fetchVolunteers() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/user/all'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        volunteers = data.map((json) => Volunteer.fromJson(json)).toList();
        print('Volunteers fetched: ${volunteers.length}'); // Debug print
      });
    } else {
      print('Failed to load volunteers: ${response.statusCode}');
      throw Exception('Failed to load volunteers');
    }
  }

  Future<void> deleteCurrentVolunteer(String month) async {
    final response = await http.delete(
      Uri.parse('http://localhost:9999/volunteer/delete/$month'),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Volunteer deleted successfully');
    } else {
      print('Failed to delete volunteer: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to delete volunteer');
    }
  }

  Future<void> submitVolunteer(Volunteer volunteer) async {
    final currentMonth = DateFormat('MM').format(DateTime.now());

    try {
      // Delete the current volunteer of the month
      await deleteCurrentVolunteer(currentMonth);

      // Add the new volunteer of the month
      final response = await http.post(
        Uri.parse('http://localhost:9999/volunteer/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'userId': volunteer.id,
          'username': volunteer.name,
          'userImageUrl': volunteer.imageUrl ?? '',
          'month': currentMonth,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Volunteer submitted successfully');
        showVolunteerSelectedDialog(volunteer);
      } else {
        print('Failed to submit volunteer: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to submit volunteer');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error in submitting volunteer of the month');
    }
  }

  void showVolunteerSelectedDialog(Volunteer volunteer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تم اختيار المتطوع'),
          content: Text('${volunteer.name} هو متطوع الشهر الحالي'),
          actions: [
            TextButton(
              child: Text('موافق'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                widget.onSelected(volunteer);
                Navigator.pop(context, volunteer); // Close the current screen
              },
            ),
          ],
        );
      },
    );
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
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => AdminBar(userId: '', userRole:'')
                          )
                          );
                },
              ),
            ],
            title: Center(
              child: Text(
                'قم باختيار متطوع الشهر المثالي',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (volunteers.isEmpty)
                Center(
                    child:
                        CircularProgressIndicator()), // Show a loading indicator while fetching data
              if (volunteers.isNotEmpty)
                Table(
                  border: TableBorder.all(color: Color(0xFF071533)),
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                    5: FlexColumnWidth(1),
                    6: FlexColumnWidth(0.5),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
                      children: [
                        _buildHeaderCell('تاريخ الميلاد'),
                        _buildHeaderCell('فصيلة الدم'),
                        _buildHeaderCell('رقم الهاتف'),
                        _buildHeaderCell('مكان السكن'),
                        _buildHeaderCell('البريد الالكتروني'),
                        _buildHeaderCell('اسم المستخدم'),
                        _buildHeaderCell(''),
                      ],
                    ),
                    ...volunteers.map((volunteer) {
                      int index = volunteers.indexOf(volunteer);
                      return TableRow(
                        children: [
                          _buildTableCell(volunteer.birthDate),
                          _buildTableCell(volunteer.bloodType),
                          _buildTableCell(volunteer.phoneNumber),
                          _buildTableCell(volunteer.address),
                          _buildTableCell(volunteer.email),
                          _buildTableCell(volunteer.name),
                          _buildCheckBox(index),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    if (selectedVolunteerIndex != null) {
                      final selectedVolunteer =
                          volunteers[selectedVolunteerIndex!];
                      print(
                          'Selected Volunteer: $selectedVolunteer'); // Detailed print
                      await submitVolunteer(selectedVolunteer);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF071533),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'اختيار',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 14,
                      color: Colors.white,
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

  TableCell _buildCheckBox(int index) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Checkbox(
          value: selectedVolunteerIndex == index,
          onChanged: (bool? value) {
            setState(() {
              selectedVolunteerIndex = value! ? index : null;
            });
          },
          activeColor: Color(0xFF071533),
        ),
      ),
    );
  }
}

class Volunteer {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String bloodType;
  final String birthDate;
  final String? imageUrl;

  Volunteer({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.bloodType,
    required this.birthDate,
    this.imageUrl,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      id: json['_id'] ?? '',
      name: json['username'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      address: json['city'] ?? '',
      bloodType: json['bloodType'] ?? '',
      birthDate: json.containsKey('birthDate')
          ? DateFormat('yyyy-MM-dd').format(DateTime.parse(json['birthDate']))
          : '',
      imageUrl: json['imageUrl'],
    );
  }

  @override
  String toString() {
    return 'Volunteer{id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, address: $address, bloodType: $bloodType, birthDate: $birthDate, imageUrl: $imageUrl}';
  }
}
