import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cytc/view/screen/bottomBarPages/AdminChatPage.dart';

class ChatPage extends StatefulWidget {
  final String userId;

  const ChatPage({Key? key, required this.userId}) : super(key: key);

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
            userId: widget.userId, adminId: adminId, adminName: adminName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userId,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF071533),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return ListTile(
            title: Text(user['username']),
            subtitle: Text(user['email']),
            onTap: () => _navigateToChat(user['_id'], user['username']),
          );
        },
      ),
    );
  }
}
