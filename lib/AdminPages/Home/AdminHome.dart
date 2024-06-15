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
//                 Expanded(child: _buildCardMostNeededArea()),
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

//   Widget _buildCardMostNeededArea() {
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

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdminHomePage extends StatelessWidget {
  final String userId;
  final Widget child;

  const AdminHomePage({Key? key, required this.userId, required this.child}) : super(key: key);

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

  _generateData() {
    var data = [
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
        data: data,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (PersonEvent personEvent, _) => charts.ColorUtil.fromDartColor(Color(0xFFffe145)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = <charts.Series<PersonEvent, String>>[];
    _generateData();
  }

  bool isEditing1 = false;
  bool isEditing2 = false;
  TextEditingController controller1 = TextEditingController(text: 'اسم المتطوع:');
  TextEditingController controller2 = TextEditingController(text: 'المركز هو');

  void _saveEdit() {
    setState(() {
      isEditing1 = false;
      isEditing2 = false;
    });
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
                Expanded(child: _buildCardMostNeededArea()),
                SizedBox(width: 12),
                Expanded(child: _buildCardPopularActivities()),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'قم بادخال حالات الطوارئ  ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFffe145),
              ),
            ),
            Row(
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

  Widget _buildCardMostNeededArea() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.25),
      ),
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اكثر الاشخاص تفاعلا معنا',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 150, // Adjust the height to make the chart smaller
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
    );
  }

  Widget _buildCardPopularActivities() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.25),
      ),
      child: Container(
        height: 112.5,
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            'الانشطة ذات الاقبال الاكبر',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableCardVolunteerOfTheMonth() {
    return SizedBox(
      width: 100, // Adjust the width as needed
      height: 200, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'متطوع الشهر',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              isEditing1
                  ? TextField(
                      controller: controller1,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      controller1.text,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _saveEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    child: Text('حفظ', style: TextStyle(fontSize: 10)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing1 = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    child: Text('تعديل', style: TextStyle(fontSize: 10)),
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
      height: 200, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 100,
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'تعريف عن المركز',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              isEditing2
                  ? TextField(
                      controller: controller2,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      controller2.text,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _saveEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    child: Text('حفظ', style: TextStyle(fontSize: 10)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing2 = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    child: Text('تعديل', style: TextStyle(fontSize: 10)),
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
      width: 100, // Adjust the width as needed
      height: 200, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.25),
        ),
        child: Container(
          height: 75,
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              'طلب مسعفين',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardRequestBloodUnits() {
    return SizedBox(
      width: 100, // Adjust the width as needed
      height: 200, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.25),
        ),
        child: Container(
          height: 75,
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              'طلب وحدات دم',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
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

