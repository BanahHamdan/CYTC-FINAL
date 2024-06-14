// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Activities extends StatefulWidget {
//   @override
//   _ActivitiesState createState() => _ActivitiesState();
// }

// class _ActivitiesState extends State<Activities> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(right: 17, top: 20),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Text(
//                 'تفاعل معنا وانضم الى عائلتنا',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//             child: Column(
//               children: [
//                 _buildCategoryCard('     الانشطة\nوالدورات',
//                     'Get your dream job here this week', 'assets/homePage/activities.jpg'),
//                 _buildCategoryCard('     حملاتنا\nالتطوعية',
//                     'Don\'t miss out on the events', 'assets/homePage/campaigns.jpg'),
//                 _buildCategoryCard('     المهرجانات\nوالاحتفالات',
//                     'Learn new skills with our courses', 'assets/homePage/celebration.jpg'),
//                 // _buildCategoryCard('تقديم طلب تدريب للخريجين',
//                 //     'Make a difference by volunteering', 'assets/image4.png'),
//                 // _buildCategoryCard('اقترح علينا افكار جديدة',
//                 //     'Tips to stay healthy and fit', 'assets/image5.png'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryCard(String title, String subtitle, String imagePath) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 5,
//       child: Container(
//         width: double.infinity, // Make the container take up all available width
//         height: 100, // Fixed height
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Color(0xFF071533).withOpacity(0.3), // Overlay color
//           ),
//           // child: Column(
//           //   crossAxisAlignment: CrossAxisAlignment.end,
//           //   mainAxisAlignment: MainAxisAlignment.end,
//             // children: [
//              child: Align(
//               alignment: Alignment.topRight,
//              child: Text(
//                 title,
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//              ),
//               // SizedBox(height: 4),
//               // Text(
//               //   subtitle,
//               //   style: TextStyle(
//               //     fontFamily: 'Amiri',
//               //     fontSize: 14,
//               //     color: Colors.white,
//               //   ),
//               // ),
//             // ],
//           // ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/UserPages/screen/bottomBarPages/activities/Campaigns/Campaigns_list(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Events/events_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Festivals/Fest_main(1).dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();

  final String userId;
  final String userRole;

  const Activities({Key? key, required this.userId, required this.userRole}) : super(key: key);
} 

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 17, top: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'تفاعل معنا وانضم الى عائلتنا',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                _buildCategoryCard(
                  '     الانشطة\nوالدورات',
                  'Get your dream job here this week',
                  'assets/homePage/activities.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsPage(userId: widget.userId, userRole: widget.userRole,)),
                    );
                  },
                ),
                _buildCategoryCard(
                  '     حملاتنا\nالتطوعية',
                  'Don\'t miss out on the events',
                  'assets/homePage/campaigns.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CampaignPage(userId: widget.userId,)),
                    );
                  },
                ),
                _buildCategoryCard(
                  '     المهرجانات\nوالاحتفالات',
                  'Learn new skills with our courses',
                  'assets/homePage/celebration.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FestivalsPage(userId: widget.userId, userRole: widget.userRole)),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Edited _buildCategoryCard function to accept a navigation function
  Widget _buildCategoryCard(String title, String subtitle, String imagePath, Function onTap) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () => onTap(), // Add navigation function here
        child: Container(
          width: double.infinity, // Make the container take up all available width
          height: 100, // Fixed height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF071533).withOpacity(0.3), // Overlay color
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
