// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Campaigns/Campaigns_list(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Events/events_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Festivals/Fest_main(1).dart';
// import 'package:flutter/material.dart';

// class AdminActivities extends StatefulWidget {
//   @override
//   _AdminActivitiesState createState() => _AdminActivitiesState();

//   final String userId;
//   final String userRole;

//   const AdminActivities({Key? key, required this.userId, required this.userRole}) : super(key: key);
// } 

// class _AdminActivitiesState extends State<AdminActivities> {
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
//                 _buildCategoryCard(
//                   '     الانشطة\nوالدورات',
//                   'Get your dream job here this week',
//                   'assets/homePage/activities.jpg',
//                   () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => EventsPage(userId: widget.userId, userRole: widget.userRole,)),
//                     );
//                   },
//                 ),
//                 _buildCategoryCard(
//                   '     حملاتنا\nالتطوعية',
//                   'Don\'t miss out on the events',
//                   'assets/homePage/campaigns.jpg',
//                   () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CampaignPage(userId: widget.userId,)),
//                     );
//                   },
//                 ),
//                 _buildCategoryCard(
//                   '     المهرجانات\nوالاحتفالات',
//                   'Learn new skills with our courses',
//                   'assets/homePage/celebration.jpg',
//                   () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => FestivalsPage(userId: widget.userId, userRole: widget.userRole)),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Edited _buildCategoryCard function to accept a navigation function
//   Widget _buildCategoryCard(String title, String subtitle, String imagePath, Function onTap) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 5,
//       child: InkWell(
//         onTap: () => onTap(), // Add navigation function here
//         child: Container(
//           width: double.infinity, // Make the container take up all available width
//           height: 100, // Fixed height
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Color(0xFF071533).withOpacity(0.3), // Overlay color
//             ),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/AdminPages/screen/MenuPages/Activities/events/ViewAddEvents.dart';
import 'package:cytc/AdminPages/screen/MenuPages/Activities/festivals/ViewAddFestPage.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Campaigns/Campaigns_list(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Events/events_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Festivals/Fest_main(1).dart';
import 'package:flutter/material.dart';

class AdminActivities extends StatefulWidget {
  @override
  _AdminActivitiesState createState() => _AdminActivitiesState();

  final String userId;
  final String userRole;

  const AdminActivities({Key? key,required this.userId, required this.userRole}) : super(key: key);
}

class _AdminActivitiesState extends State<AdminActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
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
                  // alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _buildCategoryCard(
                          'المهرجانات والاحتفالات',
                          'assets/homePage/fest2.jpg',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewAddFestPage(userId: widget.userId, userRole: widget.userRole),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      // Expanded(
                      //   child: _buildCategoryCard(
                      //     'حملاتنا التطوعية',
                      //     'assets/homePage/campaignss.jpg',
                      //     () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => CampaignPage(userId: widget.userId),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(width: 8),
                      Expanded(
                        child: _buildCategoryCard(
                          'الانشطة والدورات والحملات التطوعية',
                          'assets/homePage/campaignss.jpg',
                          () {
                            Navigator.push( 
                              context,
                              MaterialPageRoute(
                                builder: (context) =>   ViewAddEventsPage(userId: widget.userId, userRole: widget.userRole,),//EventsPage(userId: widget.userId, userRole: widget.userRole),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath, Function onTap) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          height: 220,
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
              color: Color(0xFF071533).withOpacity(0.5),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 23,
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
