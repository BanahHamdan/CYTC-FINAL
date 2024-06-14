// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';

// class AdminHomePage extends StatelessWidget {
  // final String userId;

  // const AdminHomePage({Key? key, required this.userId}) : super(key: key);

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

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     backgroundColor: Color(0xfff8f9fa),
//   //     body: SingleChildScrollView(
//   //       padding: EdgeInsets.all(12.0),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           Row(
//   //             children: [
//   //               Expanded(child: _buildCardMostNeededArea()),
//   //               SizedBox(width: 12),
//   //               Expanded(child: _buildCardPopularActivities()),
//   //             ],
//   //           ),
//   //           SizedBox(height: 12),
//   //           Row(
//   //             children: [
//   //               Expanded(child: _buildEditableCardVolunteerOfTheMonth()),
//   //               SizedBox(width: 12),
//   //               Expanded(child: _buildEditableCardCenterInfo()),
//   //             ],
//   //           ),
//   //           SizedBox(height: 12),
//   //           Text(
//   //             'قم بادخال حالات الطوارئ',
//   //             style: TextStyle(
//   //               fontSize: 12,
//   //               fontWeight: FontWeight.bold,
//   //             ),
//   //           ),
//   //           SizedBox(height: 6),
//   //           Row(
//   //             children: [
//   //               Expanded(child: _buildCardRequestRescuers()),
//   //               SizedBox(width: 12),
//   //               Expanded(child: _buildCardRequestBloodUnits()),
//   //             ],
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

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
//             'اكثر منطقة تحتاج لمسعفين بها',
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

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminHomePage extends StatefulWidget {
  final Widget child;
  final String userId;

  AdminHomePage({Key? key, required this.child, required this.userId}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AdminHomePage> {
  late List<charts.Series<Pollution, String>> _seriesData;
  late List<charts.Series<Task, String>> _seriesPieData;
  late List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Pollution(1980, 'USA', 30),
      new Pollution(1980, 'Asia', 40),
      new Pollution(1980, 'Europe', 10),
    ];
    var data2 = [
      new Pollution(1985, 'USA', 100),
      new Pollution(1980, 'Asia', 150),
      new Pollution(1985, 'Europe', 80),
    ];
    var data3 = [
      new Pollution(1985, 'USA', 200),
      new Pollution(1980, 'Asia', 300),
      new Pollution(1985, 'Europe', 180),
    ];

    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
           charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
       fillColorFn: (Pollution pollution, _) =>
          charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
         labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = <charts.Series<Pollution, String>>[];
    _seriesPieData = <charts.Series<Task, String>>[];
    _seriesLineData = <charts.Series<Sales, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('Flutter Charts'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'SO₂ emissions, by world region (in million tonnes)',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                        Expanded(
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
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Time spent on daily tasks',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5.0,),
                        Expanded(
                          child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                             behaviors: [
                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 1,
                              cellPadding: new EdgeInsets.only(right: 2.0, bottom: 2.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 6),
                            )
                          ],
                           defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 50,
                             arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Sales for the first 5 years',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
        new charts.ChartTitle('Years',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Sales',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Departments',
            behaviorPosition: charts.BehaviorPosition.end,
            titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
            )   
      ]
                          ),
                        ),
                      ],
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
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
