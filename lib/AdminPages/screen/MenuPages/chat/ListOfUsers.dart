// // ignore_for_file: prefer_const_constructors
// import 'package:cytc/UserPages/screen/bottomBarPages/chat/AdminChatPage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// class ListOfUsers extends StatefulWidget {
//   final String userId;
//   final String userRole;

//   const ListOfUsers({Key? key, required this.userId, required this.userRole})
//       : super(key: key);

//   @override
//   _ListOfUsersState createState() => _ListOfUsersState();
// }

// class _ListOfUsersState extends State<ListOfUsers> {
//   final String usersApiUrl = 'http://localhost:9999/user/all';
//   final String unreadCountApiUrl = 'http://localhost:9999/chats/unread-count';
//   List<Map<String, dynamic>> users = [];
//   Map<String, int> unreadCounts = {};
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUsers();
//     _fetchUnreadCounts();
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     _timer =
//         Timer.periodic(Duration(seconds: 1), (Timer t) => _fetchUnreadCounts());
//   }

//   Future<void> _fetchUsers() async {
//     final response = await http.get(Uri.parse(usersApiUrl));

//     if (response.statusCode == 200) {
//       setState(() {
//         users = List<Map<String, dynamic>>.from(json.decode(response.body));
//         _sortUsers(); // Sort users after fetching
//       });
//     } else {
//       print('Error fetching users: ${response.statusCode}');
//     }
//   }

//   Future<void> _fetchUnreadCounts() async {
//     final response =
//         await http.get(Uri.parse('$unreadCountApiUrl/${widget.userId}'));

//     if (response.statusCode == 200) {
//       final counts = Map<String, int>.fromIterable(
//         json.decode(response.body)['data'],
//         key: (item) => item['_id'],
//         value: (item) => item['count'],
//       );

//       setState(() {
//         unreadCounts = counts;
//         _sortUsers(); // Sort users after fetching unread counts
//       });
//     } else {
//       print('Error fetching unread counts: ${response.statusCode}');
//     }
//   }

//   void _sortUsers() {
//     users.sort((a, b) {
//       int aUnread = unreadCounts[a['_id']] ?? 0;
//       int bUnread = unreadCounts[b['_id']] ?? 0;

//       if (aUnread == 0 && bUnread == 0) {
//         return 0;
//       } else if (aUnread == 0) {
//         return 1;
//       } else if (bUnread == 0) {
//         return -1;
//       } else {
//         return bUnread.compareTo(aUnread);
//       }
//     });
//   }

//   void _navigateToChat(String adminId, String adminName) async {
//     await _markMessagesAsRead(adminId);

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AdminChatPage(
//           userId: widget.userId,
//           adminId: adminId,
//           adminName: adminName,
//           userRole: widget.userRole,
//         ),
//       ),
//     ).then((_) => _fetchUnreadCounts()); // Refresh unread counts when returning
//   }

//   Future<void> _markMessagesAsRead(String adminId) async {
//     final response = await http.post(
//       Uri.parse('http://127.0.0.1:9999/chats/mark-as-read'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'senderId': adminId,
//         'receiverId': widget.userId,
//       }),
//     );

//     if (response.statusCode == 200) {
//       print('Messages marked as read');
//     } else {
//       print('Error marking messages as read: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               'اختر اسم الادمن الذي ترغب بالتواصل معه',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontFamily: 'Amiri',
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF071533),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   var user = users[index];
//                   int unreadCount = unreadCounts[user['_id']] ?? 0;

//                   return GestureDetector(
//                     onTap: () => _navigateToChat(user['_id'], user['username']),
//                     child: Card(
//                       margin: EdgeInsets.symmetric(vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     user['username'],
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       fontFamily: 'Amiri',
//                                       fontSize: 18,
//                                       fontWeight: unreadCount > 0
//                                           ? FontWeight.bold
//                                           : FontWeight.normal,
//                                       color: Color(0xFF071533),
//                                     ),
//                                   ),
//                                 ),
//                                 if (unreadCount > 0)
//                                   Container(
//                                     padding: EdgeInsets.all(6),
//                                     decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: Text(
//                                       unreadCount.toString(),
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors
import 'package:cytc/UserPages/screen/bottomBarPages/chat/AdminChatPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ListOfUsers extends StatefulWidget {
  final String userId;
  final String userRole;

  const ListOfUsers({Key? key, required this.userId, required this.userRole})
      : super(key: key);

  @override
  _ListOfUsersState createState() => _ListOfUsersState();
}

class _ListOfUsersState extends State<ListOfUsers> {
  final String usersApiUrl = 'http://localhost:9999/user/all';
  final String unreadCountApiUrl = 'http://localhost:9999/chats/unread-count';
  List<Map<String, dynamic>> users = [];
  Map<String, int> unreadCounts = {};
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
    _fetchUnreadCounts();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _fetchUnreadCounts());
  }

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse(usersApiUrl));

    if (response.statusCode == 200) {
      setState(() {
        users = List<Map<String, dynamic>>.from(json.decode(response.body));
        _sortUsers(); // Sort users after fetching
      });
    } else {
      print('Error fetching users: ${response.statusCode}');
    }
  }

  Future<void> _fetchUnreadCounts() async {
    final response =
        await http.get(Uri.parse('$unreadCountApiUrl/${widget.userId}'));

    if (response.statusCode == 200) {
      final counts = Map<String, int>.fromIterable(
        json.decode(response.body)['data'],
        key: (item) => item['_id'],
        value: (item) => item['count'],
      );

      setState(() {
        unreadCounts = counts;
        _sortUsers(); // Sort users after fetching unread counts
      });
    } else {
      print('Error fetching unread counts: ${response.statusCode}');
    }
  }

  void _sortUsers() {
    users.sort((a, b) {
      int aUnread = unreadCounts[a['_id']] ?? 0;
      int bUnread = unreadCounts[b['_id']] ?? 0;

      if (aUnread == 0 && bUnread == 0) {
        return 0;
      } else if (aUnread == 0) {
        return 1;
      } else if (bUnread == 0) {
        return -1;
      } else {
        return bUnread.compareTo(aUnread);
      }
    });
  }

  void _navigateToChat(String adminId, String adminName) async {
    await _markMessagesAsRead(adminId);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminChatPage(
          userId: widget.userId,
          adminId: adminId,
          adminName: adminName,
          userRole: widget.userRole,
        ),
      ),
    ).then((_) => _fetchUnreadCounts()); // Refresh unread counts when returning
  }

  Future<void> _markMessagesAsRead(String adminId) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:9999/chats/mark-as-read'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'senderId': adminId,
        'receiverId': widget.userId,
      }),
    );

    if (response.statusCode == 200) {
      print('Messages marked as read');
    } else {
      print('Error marking messages as read: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الرسائل الواردة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF071533),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      var user = users[index];
                      int unreadCount = unreadCounts[user['_id']] ?? 0;

                      return GestureDetector(
                        onTap: () => _navigateToChat(user['_id'], user['username']),
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        user['username'],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontFamily: 'Amiri',
                                          fontSize: 12,
                                          fontWeight: unreadCount > 0
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: Color(0xFF071533),
                                        ),
                                      ),
                                    ),
                                    if (unreadCount > 0)
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          unreadCount.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

