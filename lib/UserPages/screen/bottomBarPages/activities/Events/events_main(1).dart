// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

// import 'events_list(2).dart';

// class EventsPage extends StatefulWidget {
//   const EventsPage({super.key});

//   @override
//   _EventsPageState createState() => _EventsPageState();
// }

// class _EventsPageState extends State<EventsPage> {
//   TextEditingController textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF9F7F2),
//       body: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFFFBE66F), //0xFFffe145
//                     Color(0xFFffe145),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF071533).withOpacity(0.3),
//                     spreadRadius: 2,
//                     blurRadius: 10,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               Icons.arrow_back_ios_new,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                             onPressed: () {
//                               // Navigate back or to home page
//                             },
//                           ),
//                           Text(
//                             'شارك معنا وانضم الى عائلتنا',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Amiri',
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(
//                               Icons.notifications,
//                               color: Colors.white,
//                               size: 18,
//                             ),
//                             onPressed: () {
//                               // Add functionality for notification icon
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 5),
//                       Container(
//                         height: 30,
//                         margin: EdgeInsets.symmetric(horizontal: 60),
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 247, 250, 252)
//                               .withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: TextField(
//                           textAlign: TextAlign.right,
//                           controller: textEditingController,
//                           cursorColor: Colors.white.withOpacity(0.9),
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(top: 0),
//                             hintText: '... ابحث',
//                             hintStyle: TextStyle(
//                               color: Colors.white.withOpacity(0.9),
//                               fontFamily: 'Amiri',
//                               fontSize: 15,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 Icons.search,
//                                 color: Colors.white.withOpacity(0.9),
//                                 size: 18,
//                               ),
//                               onPressed: () {
//                                 // Add search functionality
//                               },
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(16),
//               children: [
//                 _buildListItem('دورات', Icons.add,
//                     'http://localhost:9999/event/interest/دورات'),
//                 _buildListItem('ورش عمل ولقاءات توعوية', Icons.work,
//                     'http://localhost:9999/event/interest/ورش'),
//                 _buildListItem('مخيمات صيفية', Icons.emoji_nature,
//                     'http://localhost:9999/event/interest/مخيمات'),
//                 _buildListItem('مبادرات شبابية', Icons.volunteer_activism,
//                     'http://localhost:9999/event/interest/مبادرات'),
//               ],
//             ),
//           ),
//         ],
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
//                 color: Color(0xFFE0E0E0),
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
//               builder: (context) => EventsList(category: title, apiUrl: url),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'events_list(2).dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add this line
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Add this line
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
                _scaffoldKey.currentState?.openDrawer(); // Change this line
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildListItem('دورات', Icons.add,
                'http://localhost:9999/event/interest/دورات'),
            _buildListItem('ورش عمل ولقاءات توعوية', Icons.work,
                'http://localhost:9999/event/interest/ورش'),
            _buildListItem('مخيمات صيفية', Icons.emoji_nature,
                'http://localhost:9999/event/interest/مخيمات'),
            _buildListItem('مبادرات شبابية', Icons.volunteer_activism,
                'http://localhost:9999/event/interest/مبادرات'),
          ],
        ),
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
              builder: (context) => EventsList(category: title, apiUrl: url),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: '' ,userRole: ''))),
            title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage())), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage())), // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () {}, // Add onTap functionality for logout
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
