// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BloodDonationPage extends StatefulWidget {
  @override
  _BloodDonationPageState createState() => _BloodDonationPageState();
}

class _BloodDonationPageState extends State<BloodDonationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _colorTween = _controller.drive(
      ColorTween(
        begin: Colors.transparent,
        end: Color(0xFFd54043),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showLastDonationDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تاريخ اخر تبرع بالدم',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF071533),
                          ),
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          'assets/calendar_icon.png', // Replace with the path to your image
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Color(0xFFd54043),
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            '5/3/2023', // Example date in Arabic
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 20,
              color: Color(0xFF071533),
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    color: Color(0xFF071533).withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 300,
                  child: IconButton(
                    icon: Icon(
                      LineAwesomeIcons.angle_right_solid,
                      color: Color(0xFF071533),
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 12,
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.menu,
                            color: Color(0xFF071533), size: 20),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      );
                    },
                  ),
                  //   ],
                  // ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/homePage/bloodWhite.png', // Replace with the path to your image
                      width: 210, // Adjust the width as needed
                      height: 210, // Adjust the height as needed
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    70), // Adjust the spacing to ensure content aligns correctly
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Adjust the spacing between icon and text
                    Image.asset(
                      'assets/emergency_icon.png', // Replace with the path to your image
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 7),
                    Text(
                      'بحاجة لوحدات دم بشكل طارئ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF071533),
                        fontFamily: 'Amiri',
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: _colorTween.value!,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 7),
                    Image.asset(
                      'assets/emergency_icon.png', // Replace with the path to your image
                      width: 20,
                      height: 20,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مستشفى النجاح ',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      ':اسم المستشفى',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AB ',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      ':فصيلة الدم المطلوبة',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'ملاحظة: يجب ان يكون قد مر على الاقل 3 شهور منذ اخر مرة قمت بالتبرع بالدم بها',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Amiri',
                  color: Color(0xFFd54043),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showLastDonationDateDialog(context);
              },
              child: Text(
                'اعرف تاريخ اخر مرة تبرعت بها بالدم',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Amiri',
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF071533),
                padding: EdgeInsets.all(15),
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the radius as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
