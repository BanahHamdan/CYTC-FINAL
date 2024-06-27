// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class BloodDonatorsInfo extends StatelessWidget {
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
//       home: BloodDonatorsInfoPage(),
//     );
//   }
// }

// class BloodDonatorsInfoPage extends StatefulWidget {
//   @override
//   _BloodDonatorsInfoPageState createState() => _BloodDonatorsInfoPageState();
// }

// class _BloodDonatorsInfoPageState extends State<BloodDonatorsInfoPage> {
//   final List<Donor> donors = [
//     Donor(name: 'أحمد', age: 30, bloodType: 'A+'),
//     Donor(name: 'محمد', age: 25, bloodType: 'O-'),
//     // Add more donors as needed
//   ];

//   void _acceptDonor(int index) {
//     setState(() {
//       donors[index].status = 'قبول';
//     });
//   }

//   void _rejectDonor(int index) {
//     setState(() {
//       donors[index].status = 'رفض';
//     });
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
//             title: Text(
//               'معلومات المتبرعين',
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontSize: 17,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             centerTitle: true,
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
//                 },
//                 children: [
//                   TableRow(
//                     decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'الحالة',
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
//                             'قبول ام رفض',
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
//                             'فصيلة دمه',
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
//                             'عمره',
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
//                             'اسم المتبرع',
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
//                   ...donors.map((donor) {
//                     return TableRow(
//                       children: [
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               donor.status ?? '',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                                 fontFamily: 'Amiri',
//                               ),
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
//                                     Icons.check,
//                                     size: 17,
//                                     color: Colors.green,
//                                   ),
//                                   onPressed: () => _acceptDonor(donors.indexOf(donor)),
//                                 ),
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.delete,
//                                     size: 17,
//                                     color: Colors.red,
//                                   ),
//                                   onPressed: () => _rejectDonor(donors.indexOf(donor)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               donor.bloodType,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                                 fontFamily: 'Amiri',
//                               ),
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               donor.age.toString(),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                                 fontFamily: 'Amiri',
//                               ),
//                             ),
//                           ),
//                         ),
//                         TableCell(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               donor.name,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                                 fontFamily: 'Amiri',
//                               ),
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

// class Donor {
//   final String name;
//   final int age;
//   final String bloodType;
//   String? status;

//   Donor({required this.name, required this.age, required this.bloodType});
// }


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BloodDonatorsInfo extends StatelessWidget {
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
      home: BloodDonatorsInfoPage(donationCaseId: '667bdf39ba112ea01c36eefb'),
    );
  }
}

class BloodDonatorsInfoPage extends StatefulWidget {
  final String donationCaseId;

  const BloodDonatorsInfoPage({Key? key, required this.donationCaseId})
      : super(key: key);

  @override
  _BloodDonatorsInfoPageState createState() => _BloodDonatorsInfoPageState();
}

class _BloodDonatorsInfoPageState extends State<BloodDonatorsInfoPage> {
  List<Donor> donors = [];

  @override
  void initState() {
    super.initState();
    print('initState called');
    _fetchDonors();
  }

  Future<void> _fetchDonors() async {
    try {
      print('Fetching donors...');
      final response = await http.get(Uri.parse(
          'http://localhost:9999/blooduser/users/${widget.donationCaseId}'));
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response body: ${response.body}');
        List<dynamic> donorList = json.decode(response.body);
        for (var donorData in donorList) {
          final userResponse = await http.get(Uri.parse(
              'http://localhost:9999/user/${donorData['userId']['_id']}'));

          print('User response status: ${userResponse.statusCode}');
          if (userResponse.statusCode == 200 ||
              userResponse.statusCode == 201) {
            final userData = json.decode(userResponse.body)['user'];
            setState(() {
              donors.add(Donor(
                id: userData['id'],
                name: userData['username'],
                age: DateTime.now().year -
                    DateTime.parse(userData['birthDate']).year,
                bloodType: userData['bloodType'],
                status: null,
              ));
            });
          } else {
            print('Failed to fetch user data');
          }
        }
      } else {
        print('Failed to fetch donors');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void _acceptDonor(int index) {
    setState(() {
      donors[index].status = 'قبول';
    });
  }

  void _rejectDonor(int index) {
    setState(() {
      donors[index].status = 'رفض';
    });
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
            title: Text(
              'معلومات المتبرعين',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   'رقم حالة التبرع: ${widget.donationCaseId}',
              //   style: TextStyle(
              //     fontFamily: 'Amiri',
              //     fontSize: 16,
              //     color: Color(0xFF071533),
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(height: 16.0),
              Table(
                border: TableBorder.all(color: Color(0xFF071533)),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
                    children: [
                      // TableCell(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(
                      //       'الحالة',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontFamily: 'Amiri',
                      //         fontWeight: FontWeight.bold,
                      //         color: Color(0xFF071533),
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // TableCell(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(
                      //       'قبول ام رفض',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontFamily: 'Amiri',
                      //         fontWeight: FontWeight.bold,
                      //         color: Color(0xFF071533),
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'فصيلة دمه',
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
                            'عمره',
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
                            'اسم المتبرع',
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
                  ...donors.map((donor) {
                    return TableRow(
                      children: [
                        // TableCell(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                            // child: Text(
                            //   donor.status ?? '',
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: Color(0xFF071533),
                            //     fontFamily: 'Amiri',
                            //   ),
                            // ),
                        //   ),
                        // ),
                        // TableCell(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Wrap(
                        //       alignment: WrapAlignment.center,
                        //       spacing: 4.0,
                        //       children: [
                        //         IconButton(
                        //           icon: Icon(
                        //             Icons.check,
                        //             size: 17,
                        //             color: Colors.green,
                        //           ),
                        //           onPressed: () =>
                        //               _acceptDonor(donors.indexOf(donor)),
                        //         ),
                        //         IconButton(
                        //           icon: Icon(
                        //             Icons.delete,
                        //             size: 17,
                        //             color: Colors.red,
                        //           ),
                        //           onPressed: () =>
                        //               _rejectDonor(donors.indexOf(donor)),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              donor.bloodType,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF071533),
                                fontFamily: 'Amiri',
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              donor.age.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF071533),
                                fontFamily: 'Amiri',
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              donor.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF071533),
                                fontFamily: 'Amiri',
                              ),
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

class Donor {
  final String id;
  final String name;
  final int age;
  final String bloodType;
  String? status;

  Donor({
    required this.id,
    required this.name,
    required this.age,
    required this.bloodType,
    this.status,
  });
}
