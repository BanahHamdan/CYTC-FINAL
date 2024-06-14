// import 'package:cytc/UserPages/screen/bottomBarPages/chat/AdminChatPage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ChatPage extends StatefulWidget {
//   final String userId;

//   const ChatPage({Key? key, required this.userId}) : super(key: key);

//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final String usersApiUrl = 'http://localhost:9999/user/Admins';
//   List<Map<String, dynamic>> users = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchUsers();
//   }

//   Future<void> _fetchUsers() async {
//     final response = await http.get(Uri.parse(usersApiUrl));

//     if (response.statusCode == 200) {
//       setState(() {
//         users = List<Map<String, dynamic>>.from(json.decode(response.body));
//       });
//     } else {
//       // Handle error
//       print('Error fetching users: ${response.statusCode}');
//     }
//   }

//   void _navigateToChat(String adminId, String adminName) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AdminChatPage(
//             userId: widget.userId, adminId: adminId, adminName: adminName),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.userId,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFF071533),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           var user = users[index];
//           return ListTile(
//             title: Text(user['username']),
//             subtitle: Text(user['email']),
//             onTap: () => _navigateToChat(user['_id'], user['username']),
//           );
//         },
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:cytc/UserPages/screen/bottomBarPages/chat/AdminChatPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  final String userId;
  final String userRole;
  const ChatPage({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final String usersApiUrl = 'http://localhost:9999/user/Admins';
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse(usersApiUrl));

    if (response.statusCode == 200) {
      setState(() {
        users = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      // Handle error
      print('Error fetching users: ${response.statusCode}');
    }
  }

  void _navigateToChat(String adminId, String adminName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminChatPage(
            userId: widget.userId, adminId: adminId, adminName: adminName, userRole: widget.userRole,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'اختر اسم الادمن الذي ترغب بالتواصل معه',
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
                            Text(
                              user['username'],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xFF071533),
                              ),
                            ),
                            // SizedBox(height: 5),
                            // Text(
                            //   user['email'],
                            //   textAlign: TextAlign.right,
                            //   style: TextStyle(
                            //     fontFamily: 'Amiri',
                            //     fontSize: 16,
                            //     color: Color(0xFF071533),
                            //   ),
                            // ),
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
    );
  }
}

