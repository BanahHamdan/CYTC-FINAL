// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cytc/view/screen/Emergencies/MapPage.dart';
import 'package:cytc/view/screen/Emergencies/chooseeLocation.dart';
import 'package:cytc/view/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ParamedicsPage extends StatefulWidget {
  @override
  _ParamedicsPageState createState() => _ParamedicsPageState();
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 50, 0),
              height: 350, // Adjust height as needed
              color: Color(0xFFffe145), // Yellow color    اعتمدي هاد اكيد
              child: Center(
                child: Image.asset(
                  'assets/paramedicsEmergency.png', // Replace with your image path
                  width: 300, // Adjust the width as needed
                  height: 300, // Adjust the height as needed
                  fit: BoxFit.contain, // Adjust the fit as needed
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 8,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => bar(userId: null, userRole: null,)),
                  // );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 300),
              padding: EdgeInsets.only(top: 20), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 130),

                    //create me a box here

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ///
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

                        ///
                        SizedBox(height: 20),
                        // FaIcon(
                        //   FontAwesomeIcons.tint,
                        //   size: 100,
                        //   color: Colors.red,
                        // ),
                        // SizedBox(height: 20),
                        // SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Padding(padding: EdgeInsets.only(right: 120)),
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
                                // Container(
                                //   decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     color: Color(0xFFE0E0E0),
                                //   ),
                                //   padding: EdgeInsets.all(
                                //       8), // Adjust padding to make the circle bigger or smaller
                                //   child:
                                // Icon(
                                //   Icons.local_hospital,
                                //   color: Color(0xFF071533),
                                //   size: 20,
                                // ),
                                // ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(right: 40)),
                                Text(
                                  'خطرة ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Amiri',
                                    color: Color(0xFF071533),
                                  ),
                                  // textAlign: TextAlign.right,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  ':تقييم الحالة',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Amiri',
                                    color: Color(0xFF071533),
                                  ),
                                  // textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
///////////////////////////////////////
                        ElevatedButton(

                          // onPressed: () {
                          //    Get.to(() => MapPage(destination: chosenLocation));
                          // },

                          onPressed: () async {
                            final
                            chosenLocation = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseLocationPage()),
                            );

                            if (chosenLocation != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MapPage(destination: chosenLocation),
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


                        // ElevatedButton(
                        //   onPressed: () {
                        //      Get.to(() => MapPage());
                        //     //  Navigator.push(
                        //     //           context,
                        //     //           MaterialPageRoute(
                        //     //               builder: (context) => MapPage(destination: chosenLocation),
                        // )
                        // );
                        //   },
                          // child: Text(
                          //   'احصل على خريطة المنطقة',
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     fontFamily: 'Amiri',
                          //     color: Colors.white,
                          //   ),
                          // ),
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Color(0xFF071533),
                        //     padding: EdgeInsets.all(15),
                        //     textStyle: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(
                        //           15.0), // Adjust the radius as needed
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
