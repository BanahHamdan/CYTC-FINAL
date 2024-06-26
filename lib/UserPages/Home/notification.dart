// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../screen/Emergencies/Paramedics.dart';
// import '../screen/Emergencies/bloodDonation.dart';
// import '../screen/bottomBarPages/activities/Events/events_main(1).dart';

// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // Import your pages here

// class NotificationPage extends StatefulWidget {
//   final String userId;
//   const NotificationPage({Key? key, required this.userId}) : super(key: key);
//   @override
//   _NotificationPageState createState() => _NotificationPageState();
// }

// class _NotificationPageState extends State<NotificationPage> {
//   List<NotificationItemData> notifications = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchNotifications();
//   }

//   Future<void> fetchNotifications() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://localhost:9999/notification/user/${widget.userId}'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['status']) {
//           setState(() {
//             notifications = (data['notifications'] as List)
//                 .map((notification) => NotificationItemData(
//                       id: notification['_id'],
//                       title: notification['title'],
//                       subtitle: notification['description'],
//                       type: notification['type'],
//                       imagePath: 'assets/Logo.png', // Use a default image path
//                     ))
//                 .toList();
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isLoading = false;
//           });
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   void handleNotificationTap(NotificationItemData notification) {
//     if (notification.type == 'blood') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BloodDonationPage(
//                   userId: widget.userId,
//                   userRole: '',
//                 )), // Replace with actual page
//       );
//     } else if (notification.type == 'emergency') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ParamedicsPage(
//                 userId: widget.userId,
//                 userRole: '')), // Replace with actual page
//       );
//     } else if (notification.type == 'event') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => EventsPage(
//                 userId: widget.userId,
//                 userRole: '')), // Replace with actual page
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           'الإشعارات',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: Color(0xFF071533),
//               fontFamily: 'Amiri',
//               fontSize: 23,
//               fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               LineAwesomeIcons.angle_right_solid,
//               color: Color(0xFF071533),
//               size: 20,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: isLoading
//             ? Center(
//                 child: CircularProgressIndicator(
//                   color: Color(0xFF071533),
//                 ),
//               )
//             : notifications.isEmpty
//                 ? Center(
//                     child: Text(
//                       'لا توجد إشعارات',
//                       style: TextStyle(
//                         color: Color(0xFF071533),
//                         fontFamily: 'Amiri',
//                         fontSize: 18,
//                       ),
//                     ),
//                   )
//                 : ListView.separated(
//                     itemCount: notifications.length,
//                     itemBuilder: (context, index) {
//                       final notification = notifications[index];
//                       return GestureDetector(
//                         onTap: () => handleNotificationTap(notification),
//                         child: NotificationItem(
//                           title: notification.title,
//                           subtitle: notification.subtitle,
//                           imagePath: notification.imagePath,
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) =>
//                         Divider(color: Colors.grey),
//                   ),
//       ),
//     );
//   }
// }

// class NotificationItem extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imagePath;

//   NotificationItem({
//     required this.title,
//     required this.subtitle,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image.asset(imagePath, width: 40, height: 40),
//         SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: Color(0xFF071533),
//                   fontFamily: 'Amiri',
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.right,
//               ),
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontFamily: 'Amiri',
//                   fontSize: 14,
//                 ),
//                 textAlign: TextAlign.right,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class NotificationItemData {
//   final String id;
//   final String title;
//   final String subtitle;
//   final String type;
//   final String imagePath;

//   NotificationItemData({
//     required this.id,
//     required this.title,
//     required this.subtitle,
//     required this.type,
//     required this.imagePath,
//   });
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screen/Emergencies/Paramedics.dart';
import '../screen/Emergencies/bloodDonation.dart';
import '../screen/bottomBarPages/activities/Events/events_main(1).dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screen/Emergencies/Paramedics.dart';
import '../screen/Emergencies/bloodDonation.dart';
import '../screen/bottomBarPages/activities/Events/events_main(1).dart';

class NotificationPage extends StatefulWidget {
  final String userId;
  const NotificationPage(
      {Key? key,
      required this.userId,
      required Future<void> Function() onNotificationsRead})
      : super(key: key);
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItemData> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNotifications().then((_) => markNotificationsAsRead());
  }

  Future<void> fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse(
          'http://localhost:9999/notification/user/${widget.userId}'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status']) {
          setState(() {
            notifications = (data['notifications'] as List)
                .map((notification) => NotificationItemData(
                      id: notification['_id'],
                      title: notification['title'],
                      subtitle: notification['description'],
                      type: notification['type'],
                      imagePath: 'assets/Logo.png', // Use a default image path
                    ))
                .toList();
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> markNotificationsAsRead() async {
    try {
      for (var notification in notifications) {
        final url = Uri.parse(
            'http://localhost:9999/notification/read/${notification.id}');
        await http.patch(
            url); // Assuming the API uses POST to mark notifications as read
      }
    } catch (e) {
      print('Error marking notifications as read: $e');
    }
  }

  void handleNotificationTap(NotificationItemData notification) {
    if (notification.type == 'blood') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BloodDonationPage(
                  userId: widget.userId,
                  userRole: '',
                )), // Replace with actual page
      );
    } else if (notification.type == 'emergency') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ParamedicsPage(
                userId: widget.userId,
                userRole: '')), // Replace with actual page
      );
    } else if (notification.type == 'event') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventsPage(
                userId: widget.userId,
                userRole: '')), // Replace with actual page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'الإشعارات',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF071533),
              fontFamily: 'Amiri',
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              LineAwesomeIcons.angle_right_solid,
              color: Color(0xFF071533),
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF071533),
                ),
              )
            : notifications.isEmpty
                ? Center(
                    child: Text(
                      'لا توجد إشعارات',
                      style: TextStyle(
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return GestureDetector(
                        onTap: () => handleNotificationTap(notification),
                        child: NotificationItem(
                          title: notification.title,
                          subtitle: notification.subtitle,
                          imagePath: notification.imagePath,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.grey),
                  ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 40, height: 40),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Amiri',
                  fontSize: 14,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NotificationItemData {
  final String id;
  final String title;
  final String subtitle; 
  final String type;
  final String imagePath;

  NotificationItemData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.imagePath,
  });
}
