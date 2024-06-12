// ignore_for_file: prefer_const_constructors

import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AdminChatPage extends StatefulWidget {
  final String userId;
  final String adminId;
  final String adminName;

  const AdminChatPage(
      {Key? key,
      required this.userId,
      required this.adminId,
      required this.adminName})
      : super(key: key);

  @override
  _AdminChatPageState createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final String apiUrl = 'http://localhost:9999/chats';
  List<Map<String, dynamic>> messages = [];
  Timer? _timer;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _fetchMessages();
    _timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _fetchMessages());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchMessages() async {
    final response = await http
        .get(Uri.parse('$apiUrl/messages/${widget.userId}/${widget.adminId}'));

    if (response.statusCode == 200) {
      setState(() {
        messages =
            List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
      });
    } else {
      // Handle error
      print('Error fetching messages: ${response.statusCode}');
    }
  }

  Future<void> _sendMessage() async {
    String message = _messageController.text.trim();

    if (message.isNotEmpty) {
      final response = await http.post(
        Uri.parse('$apiUrl/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'senderId': widget.userId,
          'receiverId': widget.adminId,
          'message': message,
        }),
      );

      if (response.statusCode == 201) {
        _messageController.clear();
        _fetchMessages();
      } else {
        // Handle error
        print('Error sending message: ${response.statusCode}');
      }
    }
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
            backgroundColor: Color(0xFFffe145).withOpacity(0.7),
            elevation: 0,
            leading: IconButton(
              icon: Icon(LineAwesomeIcons.bars_solid, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            title: Text(
              '${widget.adminName} تواصل مع الادمن',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(LineAwesomeIcons.angle_right_solid, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(),
      backgroundColor: Color(0xfffafafa),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var messageData = messages[index];
                bool isMe = messageData['senderId'] == widget.userId;
                return ChatBubble(
                  message: messageData['message'],
                  isMe: isMe,
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: _messageController,
                      cursorColor: Color(0xFFffe145),
                      decoration: InputDecoration(
                        hintText: '... اكتب رسالتك',
                        hintStyle: TextStyle(fontFamily: 'Amiri'),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: Color(0xFFffe145)),
                          onPressed: _sendMessage,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: '', userRole: ''))),
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

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFF071533) : Colors.yellow[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: Color(0xFF071533),
            fontSize: 16.0,
          ),
        ),
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
