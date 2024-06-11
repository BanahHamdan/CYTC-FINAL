// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, library_private_types_in_public_api, use_key_in_widget_constructors
import 'package:cytc/UserPages/Home/homeCircularGrey.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isReportsSelected = false;
  bool isSettingsSelected = false;

  String phoneNumber = '1234567890';
  String location = 'نابلس';
  String bloodType = 'AB+';
  String profileImagePath = 'assets/banah.jpg';

  final ImagePicker _picker = ImagePicker();
  final String correctCode =
      "123456"; // Example code, replace with actual logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //0xFFF9F7F2
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: BackgroundClipper(),
                  child: Container(
                    height: 200,
                    color: Color(0xFFEBF5FF), // Baby blue
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new,
                            color: Color(0xFF071533), size: 20,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.menu, color: Color(0xFF071533), size: 20,),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(profileImagePath),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: _pickProfileImage,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFEBF5FF),
                                ),
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'بانه خالد موسى حمدان',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isReportsSelected = true;
                              isSettingsSelected = false;
                            });
                          },
                          child: _buildTab('تقاريري', isReportsSelected),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isReportsSelected = false;
                              isSettingsSelected = false;
                            });
                          },
                          child: _buildTab('معلوماتي',
                              !isReportsSelected && !isSettingsSelected),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSettingsSelected = true;
                              isReportsSelected = false;
                            });
                          },
                          child: _buildTab('حسابي', isSettingsSelected),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: isReportsSelected
                        ? _buildReportsContent()
                        : isSettingsSelected
                            ? _buildSettingsContent()
                            : _buildInfoContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        width: 250, // Set the width of the drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFEBF5FF),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'القائمة',
                  style: TextStyle(
                    color: Color(0xFF071533),
                    fontSize: 25,
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigate to home
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeTestGrey(userId: '',)));
              },
              title: Row(
                children: [
                  // Icon(Icons.arrow_back_ios,
                  //     color: Color(0xFF071533), size: 15),
                  Spacer(),
                  Text('الرئيسية', textAlign: TextAlign.right),
                  SizedBox(width: 10),
                  Icon(Icons.home, color: Color(0xFFffe145)),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                // Navigate to profile
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              title: Row(
                children: [
                  // Icon(Icons.arrow_back_ios,
                  //     color: Color(0xFF071533), size: 15),
                  Spacer(),
                  Text('الملف الشخصي', textAlign: TextAlign.right),
                  SizedBox(width: 10),
                  Icon(Icons.account_circle, color: Color(0xFFffe145)),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                // Handle logout
              },
              title: Row(
                children: [
                  // Icon(Icons.arrow_back_ios,
                  //     color: Color(0xFF071533), size: 15),
                  Spacer(),
                  Text('تسجيل خروج', textAlign: TextAlign.right),
                  SizedBox(width: 10),
                  Icon(Icons.logout, color: Color(0xFFffe145)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Color(0xFFffe145) : Colors.grey,
              fontFamily: 'Amiri',
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 40,
              color: Color(0xFFffe145),
              margin: EdgeInsets.only(top: 5),
            ),
        ],
      ),
    );
  }

  Widget _buildReportsContent() {
    return Column(
      key: ValueKey('تقاريري'),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.all(18),
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FractionColumnWidth(0.19),
              1: FractionColumnWidth(0.18),
              2: FractionColumnWidth(0.18),
              3: FractionColumnWidth(0.18),
              4: FractionColumnWidth(0.14),
              5: FractionColumnWidth(0.14),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Color(0xFFEBF5FF),
                ),
                children: [
                  _buildTableCell('استمرارية النشاط', true),
                  _buildTableCell('عدد الساعات'),
                  _buildTableCell('تاريخ النهاية'),
                  _buildTableCell('تاريخ البداية'),
                  _buildTableCell('التصنيف'),
                  _buildTableCell('اسم النشاط'),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                children: [
                  _buildStatusCell('مستمر', true),
                  _buildTableCell('50'),
                  _buildTableCell('2023-12-31'),
                  _buildTableCell('2023-01-01'),
                  _buildTableCell('تعليم'),
                  _buildTableCell('نشاط 1'),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  color: Color(0xFFEBF5FF),
                ),
                children: [
                  _buildStatusCell('منتهي', false),
                  _buildTableCell('30'),
                  _buildTableCell('2023-06-30'),
                  _buildTableCell('2023-02-01'),
                  _buildTableCell('رياضة'),
                  _buildTableCell('نشاط 2'),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                children: [
                  _buildStatusCell('مستمر', true),
                  _buildTableCell('20'),
                  _buildTableCell('2023-11-30'),
                  _buildTableCell('2023-03-01'),
                  _buildTableCell('صحة'),
                  _buildTableCell('نشاط 3'),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  color: Color(0xFFEBF5FF),
                ),
                children: [
                  _buildStatusCell('منتهي', false),
                  _buildTableCell('40'),
                  _buildTableCell('2023-08-31'),
                  _buildTableCell('2023-04-01'),
                  _buildTableCell('ثقافة'),
                  _buildTableCell('نشاط 4'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, [bool isHeader = false]) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Amiri',
        ),
      ),
    );
  }

  Widget _buildStatusCell(String text, bool isOngoing) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Amiri',
          color: isOngoing ? Colors.green : Color(0xFF071533),
        ),
      ),
    );
  }

  Widget _buildInfoContent() {
    return Column(
      key: ValueKey('معلوماتي'),
      children: [
        _buildInfoCard(
            'البريد الإلكتروني', 'banah.hamdan@gmail.com', Icons.email, false),
        _buildInfoCard('رقم الهاتف', phoneNumber, Icons.phone, true),
        _buildInfoCard(
            'تاريخ الميلاد', '2001/10/06', Icons.calendar_today, false),
        _buildInfoCard('مكان السكن', location, Icons.location_city, true),
        _buildInfoCard('فصيلة الدم', bloodType, Icons.bloodtype, true),
        _buildInfoCard(
            'تاريخ آخر تبرع بالدم', '2024/03/09', Icons.date_range, false),
      ],
    );
  }

  Widget _buildSettingsContent() {
    return Column(
      key: ValueKey('إعدادات الحساب'),
      children: [
        ListTile(
          title: Text(
            'تسجيل الخروج',
            style: TextStyle(
                fontSize: 16, fontFamily: 'Amiri', color: Color(0xFF071533)),
            textAlign: TextAlign.right,
          ),
          trailing: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEBF5FF), // Same color as the app bar
            ),
            child: Icon(Icons.logout, color: Color(0xFF071533), size: 20),
          ),
          onTap: _logout,
        ),
        Divider(color: Colors.grey[300]),
        ListTile(
          title: Text(
            'إلغاء الحساب',
            style: TextStyle(
                fontSize: 16, fontFamily: 'Amiri', color: Color(0xFF071533)),
            textAlign: TextAlign.right,
          ),
          trailing: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEBF5FF), // Same color as the app bar
            ),
            child: Icon(Icons.delete, color: Color(0xFF071533), size: 20),
          ),
          onTap: _showDeleteAccountDialog,
        ),
        Divider(color: Colors.grey[300]),
      ],
    );
  }

  Widget _buildArticleCard(String imagePath, String title, String readTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Amiri',
              color: Color(0xFF071533),
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.favorite_border, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Text(
                readTime,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Amiri',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.more_vert, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      String title, String value, IconData icon, bool isEditable) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isEditable)
                GestureDetector(
                  onTap: () {
                    _showEditDialog(title, value);
                  },
                  child: Icon(Icons.edit, color: Colors.grey),
                ),
              if (isEditable) SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEBF5FF), // Same color as the app bar
                ),
                child: Icon(icon, color: Color(0xFF071533), size: 20),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[300]),
      ],
    );
  }

  void _showEditDialog(String title, String currentValue) {
    TextEditingController controller =
        TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titlePadding: EdgeInsets.only(top: 10, left: 10, right: 10),
          title: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'تعديل $title',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontFamily: 'Amiri'),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          content: TextField(
            controller: controller,
            textAlign: TextAlign.right,
            cursorColor: Color(0xFFffe145),
            decoration: InputDecoration(
              hintText: "أدخل القيمة الجديدة",
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(fontFamily: 'Amiri'),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFffe145)),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (title == 'رقم الهاتف') {
                    phoneNumber = controller.text;
                  } else if (title == 'مكان السكن') {
                    location = controller.text;
                  } else if (title == 'فصيلة الدم') {
                    bloodType = controller.text;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('حفظ',
                  style:
                      TextStyle(fontFamily: 'Amiri', color: Color(0xFFffe145))),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog() {
    TextEditingController codeController = TextEditingController();
    bool isError = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              titlePadding: EdgeInsets.only(top: 10, left: 10, right: 10),
              title: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'إلغاء الحساب',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: 'Amiri'),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'أدخل الكود الذي تم إرساله إلى بريدك الإلكتروني',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontFamily: 'Amiri'),
                  ),
                  TextField(
                    controller: codeController,
                    textAlign: TextAlign.right,
                    cursorColor: Color(0xFFffe145),
                    decoration: InputDecoration(
                      hintText: "أدخل الكود",
                      hintStyle: TextStyle(fontFamily: 'Amiri'),
                      hintTextDirection: TextDirection.rtl,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFffe145)),
                      ),
                      errorText:
                          isError ? "الكود غير صحيح. حاول مرة أخرى" : null,
                      errorStyle: TextStyle(fontFamily: 'Amiri'),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (codeController.text == correctCode) {
                      // Perform account deletion and navigate to login page
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      setState(() {
                        isError = true;
                      });
                    }
                  },
                  child: Text('حذف',
                      style: TextStyle(
                          fontFamily: 'Amiri', color: Color(0xFFffe145))),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _logout() {
    // Perform logout and navigate to login page
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImagePath = pickedFile.path;
      });
    }
  }
}

class BackgroundClipper extends CustomClipper<Path> {
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
