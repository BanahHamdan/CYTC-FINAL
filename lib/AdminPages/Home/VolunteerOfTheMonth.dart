// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class VolunteerOfTheMonth extends StatelessWidget {
//   final List<Volunteer> volunteers;
//   final Function(Volunteer) onSelected;

//   VolunteerOfTheMonth({required this.volunteers, required this.onSelected});

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
//       home: VolunteerOfTheMonthPage(
//           volunteers: volunteers, onSelected: onSelected),
//     );
//   }
// }

// class VolunteerOfTheMonthPage extends StatefulWidget {
//   final List<Volunteer> volunteers;
//   final Function(Volunteer) onSelected;

//   VolunteerOfTheMonthPage({required this.volunteers, required this.onSelected});

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
//             actions:[ 
//               Align(
//                 alignment: Alignment.centerRight,
//              child: Text(
//               'قم باختيار متطوع الشهر المثالي',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontSize: 20,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//               ),
//               SizedBox(width: 15,),
//             ],
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
//                   0: FlexColumnWidth(0.5),
//                   1: FlexColumnWidth(1),
//                   2: FlexColumnWidth(1),
//                   3: FlexColumnWidth(1),
//                   4: FlexColumnWidth(1),
//                   5: FlexColumnWidth(1),
//                   6: FlexColumnWidth(1),
//                 },
//                 children: [
//                   TableRow(
//                     decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
//                     children: [
//                       _buildHeaderCell(''),
//                       _buildHeaderCell('تاريخ الميلاد'),
//                       _buildHeaderCell('فصيلة الدم'),
//                       _buildHeaderCell('رقم الهاتف'),
//                       _buildHeaderCell('مكان السكن'),
//                       _buildHeaderCell('البريد الالكتروني'),
//                       _buildHeaderCell('اسم المستخدم'),
//                     ],
//                   ),
//                   ...widget.volunteers.map((volunteer) {
//                     int index = widget.volunteers.indexOf(volunteer);
//                     return TableRow(
//                       children: [
//                         _buildTableCell(volunteer.birthDate),
//                         _buildTableCell(volunteer.address),
//                         _buildTableCell(volunteer.phoneNumber),
//                         _buildTableCell(volunteer.email),
//                         _buildTableCell(volunteer.name),
//                         _buildTableCell(volunteer.bloodType),
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
//                       Navigator.pop(context);
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

//   Volunteer({
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.address,
//     required this.bloodType,
//     required this.birthDate,
//   });
// }


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class VolunteerOfTheMonth extends StatelessWidget {
  final Function(Volunteer) onSelected;

  VolunteerOfTheMonth({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    List<Volunteer> volunteers = [
      Volunteer(
        name: 'John Doe',
        email: 'john.doe@example.com',
        phoneNumber: '123-456-7890',
        address: '123 Elm Street',
        bloodType: 'O+',
        birthDate: '01/01/1990',
        imageUrl: 'assets/john_doe.jpg',
      ),
      Volunteer(
        name: 'Jane Smith',
        email: 'jane.smith@example.com',
        phoneNumber: '987-654-3210',
        address: '456 Oak Avenue',
        bloodType: 'A-',
        birthDate: '02/02/1985',
        imageUrl: 'assets/jane_smith.jpg',
      ),
      // Add more static volunteers as needed
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color(0xFF071533)),
        ),
      ),
      home: VolunteerOfTheMonthPage(
          volunteers: volunteers, onSelected: onSelected),
    );
  }
}

class VolunteerOfTheMonthPage extends StatefulWidget {
  final List<Volunteer> volunteers;
  final Function(Volunteer) onSelected;

  VolunteerOfTheMonthPage({required this.volunteers, required this.onSelected});

  @override
  _VolunteerOfTheMonthPageState createState() =>
      _VolunteerOfTheMonthPageState();
}

class _VolunteerOfTheMonthPageState extends State<VolunteerOfTheMonthPage> {
  int? selectedVolunteerIndex;

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
              Align(
                alignment: Alignment.centerRight,
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
              SizedBox(width: 15),
            ],
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
                  ...widget.volunteers.map((volunteer) {
                    int index = widget.volunteers.indexOf(volunteer);
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
                  onPressed: () {
                    if (selectedVolunteerIndex != null) {
                      widget.onSelected(
                          widget.volunteers[selectedVolunteerIndex!]);
                      Navigator.pop(context, widget.volunteers[selectedVolunteerIndex!]);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF071533), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded edges
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
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String bloodType;
  final String birthDate;
  final String imageUrl;

  Volunteer({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.bloodType,
    required this.birthDate,
    required this.imageUrl,
  });
}
