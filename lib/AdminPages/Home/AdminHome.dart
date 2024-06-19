// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class AdminHomePage extends StatelessWidget {
// final String userId;
//  final Widget child;
// const AdminHomePage({Key? key, required this.userId, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF071533),
//         fontFamily: 'Amiri',
//         textTheme: TextTheme(
//             // : TextStyle(color: Colors.black),
//             ),
//       ),
//       home: AdminHome(),
//     );
//   }
// }

// class AdminHome extends StatefulWidget {
//   @override
//   _AdminHomePageState createState() => _AdminHomePageState();
// }

// class _AdminHomePageState extends State<AdminHome> {

// ///////////////////////////////////////////
//   late List<charts.Series<PersonEvent, String>> _seriesData;

//   _generateData() {
//     var data = [
//       PersonEvent('Person 1', 10),
//       PersonEvent('Person 2', 15),
//       PersonEvent('Person 3', 20),
//       PersonEvent('Person 4', 25),
//       PersonEvent('Person 5', 30),
//     ];

//     _seriesData.add(
//       charts.Series(
//         domainFn: (PersonEvent personEvent, _) => personEvent.person,
//         measureFn: (PersonEvent personEvent, _) => personEvent.events,
//         id: 'Events',
//         data: data,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (PersonEvent personEvent, _) => charts.ColorUtil.fromDartColor(Color(0xFFffe145)),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _seriesData = <charts.Series<PersonEvent, String>>[];
//     _generateData();
//   }
//   /////////////////////////////////////////

//   bool isEditing1 = false;
//   bool isEditing2 = false;
//   TextEditingController controller1 =
//       TextEditingController(text: 'اسم المتطوع:');
//   TextEditingController controller2 = TextEditingController(text: 'المركز هو');

//   void _saveEdit() {
//     setState(() {
//       isEditing1 = false;
//       isEditing2 = false;
//     });
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
//             Text(
//               'قم بادخال حالات الطوارئ  ',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFffe145),
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(child: _buildEditableCardVolunteerOfTheMonth()),
//                 SizedBox(width: 5),
//                 Expanded(child: _buildEditableCardCenterInfo()),

//                 SizedBox(width: 10),

//                 Expanded(child: _buildCardRequestRescuers()),
//                 SizedBox(width: 5),
//                 Expanded(child: _buildCardRequestBloodUnits()),
//                 // Text(
//                 //   'قم بادخال حالات الطوارئ',
//                 //   style: TextStyle(
//                 //     fontSize: 12,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCardMostActivePerson() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(11.25),
//       ),
//       child: Container(
//         height: 112.5,
//         padding: EdgeInsets.all(12.0),
//         child: Center(
//           child: Text(
//             'اكثر الاشخاص تفاعلا معنا',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCardPopularActivities() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(11.25),
//       ),
//       child: Container(
//         height: 112.5,
//         padding: EdgeInsets.all(12.0),
//         child: Center(
//           child: Text(
//             'الانشطة ذات الاقبال الاكبر',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildEditableCardVolunteerOfTheMonth() {
//     return SizedBox(
//       width: 100, // Adjust the width as needed
//       height: 200, // Adjust the height as needed
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'متطوع الشهر',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 6),
//               isEditing1
//                   ? TextField(
//                       controller: controller1,
//                       maxLines: null,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                     )
//                   : Text(
//                       controller1.text,
//                       style: TextStyle(
//                         fontSize: 10,
//                       ),
//                     ),
//               SizedBox(height: 6),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _saveEdit,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green, // Background color
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     ),
//                     child: Text('حفظ', style: TextStyle(fontSize: 10)),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isEditing1 = true;
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue, // Background color
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     ),
//                     child: Text('تعديل', style: TextStyle(fontSize: 10)),
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
//       height: 200, // Adjust the height as needed
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(
//           height: 100,
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'تعريف عن المركز',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 6),
//               isEditing2
//                   ? TextField(
//                       controller: controller2,
//                       maxLines: null,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                     )
//                   : Text(
//                       controller2.text,
//                       style: TextStyle(
//                         fontSize: 10,
//                       ),
//                     ),
//               SizedBox(height: 6),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _saveEdit,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green, // Background color
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     ),
//                     child: Text('حفظ', style: TextStyle(fontSize: 10)),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isEditing2 = true;
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue, // Background color
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     ),
//                     child: Text('تعديل', style: TextStyle(fontSize: 10)),
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
//       width: 100, // Adjust the width as needed
//       height: 200, // Adjust the height as needed
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(11.25),
//         ),
//         child: Container(
//           height: 75,
//           padding: EdgeInsets.all(12.0),
//           child: Center(
//             child: Text(
//               'طلب مسعفين',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCardRequestBloodUnits() {
//     return SizedBox(
//       width: 100, // Adjust the width as needed
//       height: 200, // Adjust the height as needed
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(11.25),
//         ),
//         child: Container(
//           height: 75,
//           padding: EdgeInsets.all(12.0),
//           child: Center(
//             child: Text(
//               'طلب وحدات دم',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
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

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:cytc/AdminPages/Home/Emergencies/addBloodDonation.dart';
import 'package:cytc/AdminPages/Home/Emergencies/addParamedics.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Volunteer {
  final String name;
  final String imageUrl;
  bool isSelected;

  Volunteer(this.name, this.imageUrl, {this.isSelected = false});
}

class AdminHomePage extends StatelessWidget {
  final String userId;
  final Widget child;

  const AdminHomePage({Key? key, required this.userId, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(
            // : TextStyle(color: Colors.black),
            ),
      ),
      home: AdminHome(),
    );
  }
}

class AdminHome extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHome> {
  late List<charts.Series<PersonEvent, String>> _seriesData;
  late List<charts.Series<EventParticipants, String>> _seriesEventData;

  List<Volunteer> volunteers = [
    Volunteer('بانه خالد حمدان', 'assets/banah.jpg'),
    Volunteer('Person 2', 'assets/images/person2.png'),
    Volunteer('Person 3', 'assets/images/person3.png'),
  ];

  Volunteer? selectedVolunteer;
  bool isEditing1 = false;
  bool isEditing2 = false;
  TextEditingController controller1 =
      TextEditingController(text: 'اسم المتطوع:');
  TextEditingController controller2 = TextEditingController(
      text:
          'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية الشباب ومهاراتهم الخ الخ الخ');

  void _saveEdit() {
    setState(() {
      isEditing1 = false;
      isEditing2 = false;
    });
  }

  _generateData() {
    var personData = [
      PersonEvent('Person 1', 10),
      PersonEvent('Person 2', 15),
      PersonEvent('Person 3', 20),
      PersonEvent('Person 4', 25),
      PersonEvent('Person 5', 30),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (PersonEvent personEvent, _) => personEvent.person,
        measureFn: (PersonEvent personEvent, _) => personEvent.events,
        id: 'Events',
        data: personData,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (PersonEvent personEvent, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFFffe145)),
      ),
    );

    var eventData = [
      EventParticipants('Event 1', 10),
      EventParticipants('Event 2', 20),
      EventParticipants('Event 3', 30),
      EventParticipants('Event 4', 40),
      EventParticipants('Event 5', 50),
    ];

    _seriesEventData.add(
      charts.Series(
        domainFn: (EventParticipants eventParticipants, _) =>
            eventParticipants.event,
        measureFn: (EventParticipants eventParticipants, _) =>
            eventParticipants.participants,
        id: 'Participants',
        data: eventData,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (EventParticipants eventParticipants, _) =>
            charts.ColorUtil.fromDartColor(Color.fromRGBO(17, 36, 78, 0.576)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = <charts.Series<PersonEvent, String>>[];
    _seriesEventData = <charts.Series<EventParticipants, String>>[];
    _generateData();
  }

  // bool isEditing1 = false;
  // bool isEditing2 = false;
  // TextEditingController controller1 = TextEditingController(text: 'اسم المتطوع:');
  // TextEditingController controller2 = TextEditingController(text: 'المركز هو');

  // void _saveEdit() {
  //   setState(() {
  //     isEditing1 = false;
  //     isEditing2 = false;
  //   });
  // }

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
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 150, // Adjust the height to make the chart smaller
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
                'الانشطة ذات الاقبال الاكبر',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF071533),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 150, // Adjust the height to make the chart smaller
                width: 350,
                child: charts.BarChart(
                  _seriesEventData,
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

/////////////////////////////////////////////////////////
  void _chooseVolunteerAutomatically() {
    // Replace with your logic for automated selection
    Volunteer automatedVolunteer = volunteers[0]; // Example
    // SizedBox(height: 10,);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Text(
          'متطوع الشهر المثالي وفقا للاحصائيات',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF071533),
            fontFamily: 'Amiri',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                automatedVolunteer.imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              automatedVolunteer.name,
              style: TextStyle(
                color: Color(0xFF071533),
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                selectedVolunteer = automatedVolunteer;
              });
            },
            child: Text(
              'حفظ',
              style: TextStyle(
                color: Color(0xFFffe145),
                fontFamily: 'Amiri',
                fontSize: 12,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'رجوع',
              style: TextStyle(
                color: Color(0xFFE94444),
                fontFamily: 'Amiri',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _chooseVolunteerManually() {
    // Navigator.of(context).push(
    // MaterialPageRoute(
    //   builder: (context) => NewPageForManualSelection(
    //     volunteers: volunteers,
    //     onSelected: (volunteer) {
    //       setState(() {
    //         selectedVolunteer = volunteer;
    //       });
    //     },
    //   ), // Replace with your new page
    // ),
    // );
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: _chooseVolunteerAutomatically,
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Color(0xFF071533).withOpacity(0.4), // Background color
                //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                // ),
                child: Text('بشكل اوتوماتيكي',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE94444),
                      decoration: TextDecoration.underline,
                    )),
              ),
              TextButton(
                onPressed: _chooseVolunteerManually,
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Color(0xFF071533).withOpacity(0.4), // Background color
                //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                // ),
                child: Text('بشكل يدوي',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE94444),
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
                            child: Image.asset(
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
                                // fontWeight:
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
                      // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF071533), width: 1.0),
                      ),
                    ),
                    child: Text(
                      'تأكيد',
                      style: TextStyle(fontSize: 10, color: Color(0xFF071533)),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       isEditing1 = true;
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Color(0xFF071533), // Background color
                  //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  //   ),
                  //   child: Text('تعديل', style: TextStyle(fontSize: 10, color: Colors.white)),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildEditableCardVolunteerOfTheMonth() {
  //   return SizedBox(
  //     width: 100, // Adjust the width as needed
  //     height: 270, // Adjust the height as needed
  //     child: Card(
  // shape: RoundedRectangleBorder(
  //   borderRadius: BorderRadius.circular(10),
  // ),
  //       child: Container(
  //         height: 200,
  //         padding: EdgeInsets.all(12.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [
  //             Text(
  //               'متطوع الشهر',
  //               style: TextStyle(
  //                 color: Color(0xFF071533),
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 6),
  //             isEditing1
  //                 ? TextField(
  //                     controller: controller1,
  //                     maxLines: null,
  //                     style: TextStyle(color: Color(0xFF071533), fontSize: 10),
  //                     decoration: InputDecoration(
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   )
  //                 : Text(
  //                     controller1.text,
  //                     style: TextStyle(
  //                       fontSize: 10,
  //                     ),
  //                   ),
  //             SizedBox(height: 6),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 ElevatedButton(
  //                   onPressed: _saveEdit,
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xFF071533).withOpacity(0.4), // Background color
  //                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  //                   ),
  //                   child: Text('حفظ', style: TextStyle(fontSize: 10, color: Colors.white)),
  //                 ),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       isEditing1 = true;
  //                     });
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xFF071533), // Background color
  //                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  //                   ),
  //                   child: Text('تعديل', style: TextStyle(fontSize: 10, color: Colors.white)),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
                      style: TextStyle(color: Color(0xFF071533), fontSize: 10),
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
                      // .withOpacity(0.4), // Background color
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    ),
                    child: Text('حفظ',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
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
                      // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF071533), width: 1.0),
                      ),
                    ),
                    child: Text('تعديل',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF071533),
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
                      MaterialPageRoute(
                        builder: (context) => ParamedicsRequests()
                      ),
                    );
          // Add your onTap functionality here
          print('Card clicked');
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
                      MaterialPageRoute(
                        builder: (context) => BloodRequests()
                      ),
                    );
          // Add your onTap functionality here
          print('Card clicked22222');
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
