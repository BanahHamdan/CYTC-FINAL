
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:flutter/material.dart';
// import 'events_list(2).dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';

// class EventsPage extends StatefulWidget {
//   final String userId;
  
//   final String userRole;

//   const EventsPage({Key? key, required this.userId, required this.userRole}) : super(key: key);
//   @override
//   _EventsPageState createState() => _EventsPageState();
// }

// class _EventsPageState extends State<EventsPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add this line
//   TextEditingController textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey, // Add this line
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
//                 _scaffoldKey.currentState?.openDrawer(); // Change this line
//               },
//             ),
//             title: Text(
//               'الانشطة والدورات',
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
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
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildListItem('دورات', Icons.add,
//                 'http://localhost:9999/event/interest/دورات'),
//             _buildListItem('ورش عمل ولقاءات توعوية', Icons.work,
//                 'http://localhost:9999/event/interest/ورش عمل'),
//             _buildListItem('مخيمات صيفية', Icons.emoji_nature,
//                 'http://localhost:9999/event/interest/مخيمات'),
//             _buildListItem('مبادرات شبابية', Icons.volunteer_activism,
//                 'http://localhost:9999/event/interest/مبادرات شبابية'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildListItem(String title, IconData icon, String url) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ListTile(
//         leading: Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 15),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Flexible(
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFF071533).withOpacity(0.1),
//               ),
//               padding: EdgeInsets.all(8),
//               child: Icon(icon, color: Color(0xFF071533)),
//             ),
//           ],
//         ),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => EventsList(category: title, apiUrl: url, userId: widget.userId, userRole: widget.userRole,),
//             ),
//           );
//         },
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
//                         style: TextStyle(color: Color(0xFF071533), fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Amiri'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 16.0),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId,userRole: widget.userRole)));
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
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: '' ,userRole: ''))),
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
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'events_list(2).dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';

class EventsPage extends StatefulWidget {
  final String userId;
  final String userRole;

  const EventsPage({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textEditingController = TextEditingController();

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
              'الانشطة والدورات',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWeb = constraints.maxWidth > 680;
          double adjustedWidth = isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: isWeb ? Alignment.centerRight : Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: adjustedWidth,
                    child: _buildListItem('دورات', Icons.add, 'http://localhost:9999/event/interest/دورات'),
                  ),
                  Container(
                    width: adjustedWidth,
                    child: _buildListItem('ورش عمل ولقاءات توعوية', Icons.work, 'http://localhost:9999/event/interest/ورش عمل'),
                  ),
                  Container(
                    width: adjustedWidth,
                    child: _buildListItem('مخيمات صيفية', Icons.emoji_nature, 'http://localhost:9999/event/interest/مخيمات'),
                  ),
                  Container(
                    width: adjustedWidth,
                    child: _buildListItem('مبادرات شبابية', Icons.volunteer_activism, 'http://localhost:9999/event/interest/مبادرات شبابية'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon, String url) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 15),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF071533).withOpacity(0.1),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(icon, color: Color(0xFF071533)),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventsList(category: title, apiUrl: url, userId: widget.userId, userRole: widget.userRole),
            ),
          );
        },
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
                        style: TextStyle(color: Color(0xFF071533), fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Amiri'),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId, userRole: widget.userRole)));
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: widget.userId, userRole: widget.userRole))),
            title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage(userId: widget.userId, userRole: widget.userRole))), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage(userId: widget.userId, userRole: widget.userRole))), // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId))), // Add onTap functionality for logout
            title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
          ),
        ],
      ),
    );
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
