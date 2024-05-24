// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/view/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';

class suggestionsPage extends StatefulWidget {
  @override
  _suggestionsPageState createState() => _suggestionsPageState();
}

class _suggestionsPageState extends State<suggestionsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F7F2),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105.0), // Set the height you want
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFf3c344),
                  Color(0xFFffe145),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF071533).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                // Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => bar(userId: null, userRole: null,)),
                                  );
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Add functionality for burger menu
                              },
                            ),
                          ],
                        ),
                        Text(
                          'شاركنا ب اقتراحاتك لانشطة جديدة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Amiri',
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Add functionality for notification icon
                              },
                              padding: EdgeInsets.zero,
                              icon: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF071533),
                                ),
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                // Add functionality to navigate to profile page
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage('assets/banah.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 30,
                      margin: EdgeInsets.fromLTRB(120, 0, 120, 0),
                      decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 247, 250, 252).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        cursorColor: Colors.white.withOpacity(0.9),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0),
                          hintText: '... ابحث',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'Amiri',
                            fontSize: 15,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.9),
                              size: 18,
                            ),
                            onPressed: () {
                              // Search functionality
                            },
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF071533).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.email, color: Color(0xFF071533), size: 40),
                        SizedBox(height: 8),
                        TextField(
                          textAlign: TextAlign.right,
                          controller: emailController,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'البريد الإلكتروني',
                            hintStyle: TextStyle(
                              color: Color(0xFF071533),
                              fontFamily: 'Amiri',
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFf3c344),
                                  width: 2), // Border color when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Colors.grey), // Border color when enabled
                            ),
                          ),
                          cursorColor: Color(0xFFf3c344),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF071533).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.person, color: Color(0xFF071533), size: 40),
                        SizedBox(height: 8),
                        TextField(
                          textAlign: TextAlign.right,
                          controller: nameController,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'الاسم',
                            hintStyle: TextStyle(
                              color: Color(0xFF071533),
                              fontFamily: 'Amiri',
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFf3c344),
                                  width: 2), // Border color when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Colors.grey), // Border color when enabled
                            ),
                          ),
                          cursorColor: Color(0xFFf3c344),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            //////////////////////////
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF071533).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.message, color: Color(0xFF071533), size: 40),
                  SizedBox(height: 8),
                  TextField(
                    textAlign: TextAlign.right,
                    controller: messageController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'عنوان النشاط / الفكرة',
                      hintStyle: TextStyle(
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFf3c344),
                            width: 2), // Border color when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Border color when enabled
                      ),
                    ),
                    cursorColor: Color(0xFFf3c344),
                  ),
                ],
              ),
            ),


            //////////////////////////

            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF071533).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Icon(Icons.message, color: Color(0xFF071533), size: 40),
                  SizedBox(height: 8),
                  TextField(
                    textAlign: TextAlign.right,
                    controller: messageController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'اشرح لنا اكثر لتوضيح فكرتك',
                      hintStyle: TextStyle(
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFf3c344),
                            width: 2), // Border color when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Border color when enabled
                      ),
                    ),
                    cursorColor: Color(0xFFf3c344),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF071533),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'إرسال',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Amiri',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
