// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:cytc/UserPages/screen/Emergencies/MapPage.dart';
import 'package:cytc/UserPages/screen/Emergencies/chooseeLocation.dart';
import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ParamedicsPage extends StatefulWidget {
  @override
  _ParamedicsPageState createState() => _ParamedicsPageState();

  final String userId;
  final String userRole;
 
  const ParamedicsPage({Key? key, required this.userId, required this.userRole}) : super(key: key);
}

class _ParamedicsPageState extends State<ParamedicsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  get chosenLocation => null; ////////// from database

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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.0),
        // child: ClipPath(
        //   clipper: CustomAppBarClipper(),
          child: AppBar(
            backgroundColor: Color(0xFF071533).withOpacity(0.1),
            elevation: 0,
            leading: Builder(
              builder: (context) {
                return IconButton( 
                  icon: Icon(LineAwesomeIcons.bars_solid, color: Color(0xFF071533)),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            actions: [
              IconButton(
                icon: Icon(LineAwesomeIcons.angle_right_solid, color: Color(0xFF071533)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        // ),
      ),
      backgroundColor: Colors.white,
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
                    color: Color(0xFF071533).withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 55,
                  child: Center(
                    child: Image.asset(
                      'assets/paramedicsEmergency.png', // Replace with the path to your image
                      width: 250, // Adjust the width as needed
                      height: 250, // Adjust the height as needed
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
                      'بحاجة لمسعفين بشكل طارئ',
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
                      'البلدة القديمة ',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      ':عنوان المنطقة',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'خطرة ',
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontFamily: 'Amiri',
                //         color: Color(0xFF071533),
                //       ),
                //     ),
                //     SizedBox(width: 8),
                //     Text(
                //       ':تقييم الحالة',
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontFamily: 'Amiri',
                //         color: Color(0xFF071533),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final chosenLocation = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseLocationPage(userId: widget.userId, userRole: widget.userRole,)),
                );

                if (chosenLocation != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MapPage(destination: chosenLocation, userId: widget.userId, userRole: widget.userRole),
                    ),
                  );
                }
              },
              child: Text(
                'احصل على خريطة المنطقة',
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
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
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
                        style: TextStyle(color: Color(0xFF071533), fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Amiri'),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId, userRole: widget.userRole)));
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => bar(userId: widget.userId, userRole: widget.userRole,))),
            title: Text('الرئيسية', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => universityTrainingPage(userId: widget.userId,userRole: widget.userRole))), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionsPage(userId: widget.userId,userRole: widget.userRole))), // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(userId: widget.userId,))), // Add onTap functionality for logout
            title: Text('تسجيل خروج', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Amiri', fontSize: 16, color: Color(0xFF071533))),
            trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
          ),
        ],
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
