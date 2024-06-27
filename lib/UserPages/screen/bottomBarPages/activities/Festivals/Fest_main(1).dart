// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class FestivalsPage extends StatefulWidget {
//   @override
//   _FestivalsPageState createState() => _FestivalsPageState();
  
//      final String userId;
//      final String userRole;
//   const FestivalsPage({Key? key, required this.userId, required this.userRole}) : super(key: key);
// }
 
// class _FestivalsPageState extends State<FestivalsPage> {
//   List events = [];

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     fetchEvents();
//   }

//   Future<void> fetchEvents() async {
//     final response = await http
//         .get(Uri.parse('http://localhost:9999/event/interest/ واحتفالات')); //مهرجانات واحتفالات
//     if (response.statusCode == 200) {
//       setState(() {
//         events = json.decode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load events');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80.0),
//         child: ClipPath(
//           clipper: CustomAppBarClipper(),
//           child: AppBar(
//             backgroundColor: Color(0xFF071533).withOpacity(0.1),
//             elevation: 0,
//             leading: IconButton(
//               icon: Icon(LineAwesomeIcons.bars_solid, color: Color(0xFF071533)),
//               onPressed: () {
//                 _scaffoldKey.currentState?.openDrawer();
//               },
//             ),
//             title: Text(
//               'تعرف على الاحتفالات والمهرجانات القادمة',
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//                 color: Color(0xFF071533),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             centerTitle: true,
//             actions: [
//               IconButton(
//                 icon: Icon(LineAwesomeIcons.angle_right_solid, color: Color(0xFF071533)),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       drawer: _buildDrawer(),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: events.length,
//           itemBuilder: (context, index) {
//             return EventCard(event: events[index]);
//           },
//         ),
//       ),
//     );
//   }

//   Drawer _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 40, bottom: 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'بانه خالد حمدان',
//                         style: TextStyle(
//                           color: Color(0xFF071533),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           fontFamily: 'Amiri',
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 16.0),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId, userRole: widget.userRole,)));
//                     },
//                     child: CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage('assets/banah.jpg'), // Replace with your image path
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: widget.userId, userRole: widget.userId))),
//             title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(Icons.home, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage(userId: widget.userId,userRole: widget.userRole))), // Add onTap functionality
//             title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage(userId: widget.userId,userRole: widget.userRole))), // Add onTap functionality
//             title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId,))), // Add onTap functionality for logout
//             title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
//             trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class EventCard extends StatelessWidget {
//   final Map<String, dynamic> event;

//   EventCard({required this.event});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     'assets/homePage/fest1.jpg',
//                     width: 60,
//                     height: 60,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Text(
//                     'اسم الحدث : ${event['name'] ?? 'بدون اسم'}',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Amiri',
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               event['description'] ?? 'بدون وصف',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'Amiri',
//               ),
//               textAlign: TextAlign.right,
//             ),
//             SizedBox(height: 10),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       event['location'] ?? 'بدون موقع',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                         fontFamily: 'Amiri',
//                       ),
//                     ),
//                     SizedBox(width: 4),
//                     Icon(Icons.location_on, color: Color(0xFFffe145), size: 16),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       _formatDate(event['startDate'] ?? 'بدون تاريخ'),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                         fontFamily: 'Amiri',
//                       ),
//                     ),
//                     SizedBox(width: 4),
//                     Icon(Icons.calendar_today, color: Color(0xFFffe145), size: 16),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       event['time'] ?? 'بدون وقت',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                         fontFamily: 'Amiri',
//                       ),
//                     ),
//                     SizedBox(width: 4),
//                     Icon(Icons.access_time, color: Color(0xFFffe145), size: 16),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatDate(String dateStr) {
//     try {
//       final date = DateTime.parse(dateStr);
//       final formatter = DateFormat('yyyy-MM-dd');
//       return formatter.format(date);
//     } catch (e) {
//       return 'تاريخ غير صالح';
//     }
//   }
// }

// class CustomAppBarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.6);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height * 0.6,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
 
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';

class FestivalsPage extends StatefulWidget {
  final String userId;
  final String userRole;
  const FestivalsPage({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  _FestivalsPageState createState() => _FestivalsPageState();
}

class _FestivalsPageState extends State<FestivalsPage> {
  List<Map<String, dynamic>> events = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  void fetchEvents() {
    List<Map<String, dynamic>> staticEvents = [
      {
        'name': 'مهرجان فرحة عيد ',
        'description': 'على شرف أطفال الشهداء والأسرى وبمشاركة ابنة الأسير البطل وليد دقة ندعوكم للمشاركة بالمهرجان الجماهيري الكبير "فرحة عيد" يوم الجمعة . الفرق المشاركة: فرقة عمو الطبيب, الفرقة القومية, مسرح الأطفال, فرقة الاستقلال للفنون الشعبية, كشافة مركز يافا الثقافي, فرقة الإغاثة الطبية الفلسطينية / مركز الشباب',
        'location': 'منتزه جمال عبدالناصر',
        'startDate': '2024-06-23',
        'time': '2:00pm-6:00pm'
      },
      {
        'name': 'حفل تخريج افواج الاغاثة الطبية',
        'description': 'سيتم اقامة الحفل في صالة الماسة في تمام الساعة ال 3 ظهرا وسيستمر لمدة ساعتين',
        'location': 'صالة الماسة',
        'startDate': '2024-06-30',
        'time': '6:00pm-8:00pm'
      },
    ];

    setState(() {
      events = staticEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ClipPath(
          clipper: CustomAppBarClipper(),
          child: AppBar(
            backgroundColor: Color(0xFF071533).withOpacity(0.1),
            elevation: 0,
            leading: IconButton(
              icon: Icon(LineAwesomeIcons.bars_solid, color: Color(0xFF071533)),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            title: Text(
              'تعرف على الاحتفالات والمهرجانات القادمة',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF071533),
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(LineAwesomeIcons.angle_right_solid, color: Color(0xFF071533)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EventCard(event: events[index]);
          },
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'بانه خالد حمدان',
                        style: TextStyle(
                          color: Color(0xFF071533),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId, userRole: widget.userRole,)));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/banah.jpg'), // Replace with your image path
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: widget.userId, userRole: widget.userId))),
            title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage(userId: widget.userId,userRole: widget.userRole))), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage(userId: widget.userId,userRole: widget.userRole))), // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId,))), // Add onTap functionality for logout
            title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/homePage/fest1.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'اسم الحدث : ${event['name'] ?? 'بدون اسم'}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Amiri',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              event['description'] ?? 'بدون وصف',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Amiri',
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      event['location'] ?? 'بدون موقع',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.location_on, color: Color(0xFFffe145), size: 16),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _formatDate(event['startDate'] ?? 'بدون تاريخ'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.calendar_today, color: Color(0xFFffe145), size: 16),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      event['time'] ?? 'بدون وقت',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.access_time, color: Color(0xFFffe145), size: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(date);
    } catch (e) {
      return 'تاريخ غير صالح';
    }
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
