// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
      home: BloodDonatorsInfoPage(),
    );
  }
}

class BloodDonatorsInfoPage extends StatefulWidget {
  @override
  _BloodDonatorsInfoPageState createState() => _BloodDonatorsInfoPageState();
}

class _BloodDonatorsInfoPageState extends State<BloodDonatorsInfoPage> {
  final List<Donor> donors = [
    Donor(name: 'أحمد', age: 30, bloodType: 'A+'),
    Donor(name: 'محمد', age: 25, bloodType: 'O-'),
    // Add more donors as needed
  ];

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
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الحالة',
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
                            'قبول ام رفض',
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
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              donor.status ?? '',
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
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 4.0,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    size: 17,
                                    color: Colors.green,
                                  ),
                                  onPressed: () => _acceptDonor(donors.indexOf(donor)),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 17,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _rejectDonor(donors.indexOf(donor)),
                                ),
                              ],
                            ),
                          ),
                        ),
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
  final String name;
  final int age;
  final String bloodType;
  String? status;

  Donor({required this.name, required this.age, required this.bloodType});
}
