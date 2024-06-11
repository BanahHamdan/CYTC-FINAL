// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/view/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class universityTrainingPage extends StatefulWidget {
  @override
  _universityTrainingPageState createState() => _universityTrainingPageState();
}

class _universityTrainingPageState extends State<universityTrainingPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController trainingHoursController = TextEditingController();
  final TextEditingController cvController = TextEditingController();

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
                                      builder: (context) => bar(
                                            userId: null,
                                            userRole: null,
                                          )),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                    Icon(Icons.person, color: Color(0xFF071533), size: 40),
                    SizedBox(height: 8),
                    TextField(
                      textAlign: TextAlign.right,
                      controller: nameController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'الاسم الثلاثي',
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
                    Icon(Icons.school, color: Color(0xFF071533), size: 40),
                    SizedBox(height: 8),
                    TextField(
                      textAlign: TextAlign.right,
                      controller: universityController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'اسم الجامعة',
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
                    Icon(Icons.book, color: Color(0xFF071533), size: 40),
                    SizedBox(height: 8),
                    TextField(
                      textAlign: TextAlign.right,
                      controller: majorController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'التخصص',
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
                    Icon(Icons.timer, color: Color(0xFF071533), size: 40),
                    SizedBox(height: 8),
                    TextField(
                      textAlign: TextAlign.right,
                      controller: trainingHoursController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'عدد ساعات التدريب',
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
                    Icon(Icons.attach_file, color: Color(0xFF071533), size: 40),
                    SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          PlatformFile file = result.files.first;
                          // Do something with the file, such as upload it to a server or display its path
                          print('File name: ${file.name}');
                          print('File path: ${file.path}');
                        } else {
                          // User canceled the picker
                        }
                      },
                      icon: Icon(Icons.upload_file, color: Color(0xFFf3c344),),
                      label: Text(
                        'ارفق السيرة الذاتية',
                        style: TextStyle(
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                        // textStyle: Color(0xFF071533), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: Color(0xFF071533), // Border color
                            width: 1, // Border width
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _showParticipationDialog(context);
                  // Handle form submission
                },
                style: ElevatedButton.styleFrom(
                  // primary: Color(0xFF071533),
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
      ),
    );
  }
}


void _showParticipationDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'عند ضغطك على زر تأكيد الارسال \n فأنت تقوم بتأكيد ارسالك للطلب',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF071533),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                ),
              ),         
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle donate button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF071533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(18),
                ),
                child: Text(
                  'تأكيد الارسال',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
