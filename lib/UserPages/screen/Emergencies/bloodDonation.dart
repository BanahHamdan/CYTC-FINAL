// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
// import 'package:cytc/UserPages/screen/auth/login.dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
// import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';

// class BloodDonationPage extends StatefulWidget {
//   @override
//   _BloodDonationPageState createState() => _BloodDonationPageState();

//   final String userId;
//   final String userRole;
//   const BloodDonationPage(
//       {Key? key, required this.userId, required this.userRole})
//       : super(key: key);
// }

// class _BloodDonationPageState extends State<BloodDonationPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorTween;
//   bool _canDonate = false;
//   bool _isLoading = true;
//   String _hospitalName = '';
//   String _bloodType = '';
//   int _bloodUnitsRequired = 0;
//   String _date = '';
//   String _time = '';
//   String _lastDonationDate = '';
//   String _bloodDonationCaseId = ''; // Add this variable to store the case ID

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);

//     _colorTween = _controller.drive(
//       ColorTween(
//         begin: Colors.transparent,
//         end: Color(0xFFd54043),
//       ),
//     );

//     _checkCanDonate();
//     _fetchBloodDonationInfo();
//   }

//   Future<void> _checkCanDonate() async {
//     final response = await http.get(Uri.parse(
//         'http://localhost:9999/blooduser/can-donate/${widget.userId}'));
//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);
//       setState(() {
//         _canDonate = result['canDonate'];
//         _isLoading = false;
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       // Handle error case
//     }
//   }

//   Future<void> _fetchBloodDonationInfo() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:9999/blood-donation/last'));
//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);
//       setState(() {
//         _hospitalName = result['hospitalName'];
//         _bloodType = result['bloodType'];
//         _bloodUnitsRequired = result['bloodUnitsRequired'];
//         _date = result['date'];
//         _time = result['time'];
//         _bloodDonationCaseId = result['_id']; // Store the case ID
//       });
//     } else {
//       // Handle error case
//     }
//   }

//   Future<void> _fetchLastDonationDate() async {
//     final response = await http.get(
//         Uri.parse('http://localhost:9999/blooduser/last/${widget.userId}'));
//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);
//       setState(() {
//         _lastDonationDate = result['timestamp'];
//       });
//       _showLastDonationDateDialog(context, _lastDonationDate);
//     } else {
//       // Handle error case
//     }
//   }

//   Future<void> _sendDonationRequest() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:9999/blooduser/create'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'userId': widget.userId,
//         'bloodDonationCaseId': _bloodDonationCaseId,
//       }),
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       // Show success dialog upon successful donation request
//       _showDonationSuccessDialog(context);
//     } else {
//       // Handle error case
//     }
//   }

//   void _showLastDonationDateDialog(BuildContext context, String lastDate) {
//     final formattedDate =
//         DateFormat('yyyy-MM-dd').format(DateTime.parse(lastDate));
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           title: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'تاريخ اخر تبرع بالدم',
//                           style: TextStyle(
//                             fontFamily: 'Amiri',
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF071533),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Image.asset(
//                           'assets/calendar_icon.png', // Replace with the path to your image
//                           width: 30,
//                           height: 30,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Icon(
//                     Icons.close,
//                     color: Colors.grey,
//                     size: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           content: Text(
//             '$formattedDate\nيجب ان يمر ثلاثة اشهر على الاقل من اخر تاريح تبرعت فيه بالدم',
//             style: TextStyle(
//               fontFamily: 'Amiri',
//               fontSize: 20,
//               color: Color(0xFF071533),
//             ),
//             textAlign: TextAlign.center,
//           ),
//         );
//       },
//     );
//   }

//   void _showDonationConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           title: Text(
//             'التأكيد',
//             style: TextStyle(
//               fontFamily: 'Amiri',
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF071533),
//             ),
//           ),
//           content: Text(
//             'هل ستذهب للتبرع الآن؟',
//             style: TextStyle(
//               fontFamily: 'Amiri',
//               fontSize: 20,
//               color: Color(0xFF071533),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'لا',
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _sendDonationRequest();
//               },
//               child: Text(
//                 'نعم',
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showDonationSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible:
//           false, // Disable closing by tapping outside the dialog
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           title: Text(
//             'نجاح',
//             style: TextStyle(
//               fontFamily: 'Amiri',
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF071533),
//             ),
//           ),
//           content: Text(
//             'تم تسجيلك للتبرع بالدم في $_hospitalName لفصيلة الدم $_bloodType.\nيرجى التوجه إلى المستشفى في أقرب وقت.',
//             style: TextStyle(
//               fontFamily: 'Amiri',
//               fontSize: 20,
//               color: Color(0xFF071533),
//             ),
//             textAlign: TextAlign.center,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => bar(
//                       userId: widget.userId,
//                       userRole: widget.userRole,
//                     ),
//                   ),
//                   (route) => false,
//                 );
//               },
//               child: Text(
//                 'العودة الى الصفحة الرئيسية',
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(35.0),
//         child: AppBar(
//           backgroundColor: Color(0xFF071533).withOpacity(0.1),
//           elevation: 0,
//           leading: Builder(
//             builder: (context) {
//               return IconButton(
//                 icon:
//                     Icon(LineAwesomeIcons.bars_solid, color: Color(0xFF071533)),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               );
//             },
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(LineAwesomeIcons.angle_right_solid,
//                   color: Color(0xFF071533)),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white,
//       drawer: _buildDrawer(),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       ClipPath(
//                         clipper: BackgroundClipper(),
//                         child: Container(
//                           height: 200,
//                           color: Color(0xFF071533).withOpacity(0.1),
//                         ),
//                       ),
//                       Positioned(
//                         top: 30,
//                         left: 0,
//                         right: 0,
//                         child: Center(
//                           child: Image.asset(
//                             'assets/homePage/bloodWhite.png', // Replace with the path to your image
//                             width: 210, // Adjust the width as needed
//                             height: 210, // Adjust the height as needed
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       height:
//                           70), // Adjust the spacing to ensure content aligns correctly
//                   AnimatedBuilder(
//                     animation: _controller,
//                     builder: (context, child) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Adjust the spacing between icon and text
//                           Image.asset(
//                             'assets/emergency_icon.png', // Replace with the path to your image
//                             width: 20,
//                             height: 20,
//                           ),
//                           SizedBox(width: 7),
//                           Text(
//                             'بحاجة لوحدات دم بشكل طارئ',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontFamily: 'Amiri',
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 20.0,
//                                   color: _colorTween.value!,
//                                   offset: Offset(0, 0),
//                                 ),
//                               ],
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(width: 7),
//                           Image.asset(
//                             'assets/emergency_icon.png', // Replace with the path to your image
//                             width: 20,
//                             height: 20,
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             _hospitalName,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'Amiri',
//                               color: Color(0xFF071533),
//                             ),
//                           ),
//                           SizedBox(width: 6),
//                           Text(
//                             ':اسم المستشفى',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'Amiri',
//                               color: Color(0xFF071533),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             _bloodType,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'Amiri',
//                               color: Color(0xFF071533),
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             ':فصيلة الدم المطلوبة',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'Amiri',
//                               color: Color(0xFF071533),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             _bloodUnitsRequired.toString(),
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'Amiri',
//                               color: Color(0xFF071533),
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             ':عدد وحدات الدم الطلوبة',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'Amiri',
//                               color: Color(0xFF071533),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _canDonate
//                         ? () {
//                             _showDonationConfirmationDialog(context);
//                           }
//                         : () {
//                             _fetchLastDonationDate();
//                           },
//                     child: Text(
//                       'سأقوم بالتبرع',
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontFamily: 'Amiri',
//                         color: Colors.white,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF071533),
//                       padding: EdgeInsets.all(15),
//                       textStyle: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                             15.0), // Adjust the radius as needed
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   Widget _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 40, bottom: 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'بانه خالد حمدان',
//                         style: TextStyle(
//                             color: Color(0xFF071533),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             fontFamily: 'Amiri'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 16.0),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProfilePage(
//                                   userId: widget.userId,
//                                   userRole: widget.userRole)));
//                     },
//                     child: CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage(
//                           'assets/banah.jpg'), // Replace with your image path
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => bar(
//                           userId: widget.userId,
//                           userRole: widget.userId,
//                         ))),
//             title: Text('الرئيسية',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(Icons.home, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => universityTrainingPage(
//                         userId: widget.userId,
//                         userRole: widget.userRole))), // Add onTap functionality
//             title: Text('تقديم طلب تدريب للخريجين',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(LineAwesomeIcons.graduation_cap_solid,
//                 color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => SuggestionsPage(
//                         userId: widget.userId,
//                         userRole: widget.userRole))), // Add onTap functionality
//             title: Text('شاركنا باقتراحاتك وافكارك',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing:
//                 Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
//           ),
//           ListTile(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => LoginPage(
//                           userId: widget.userId,
//                         ))), // Add onTap functionality for logout
//             title: Text('تسجيل خروج',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Color(0xFF071533))),
//             trailing: Icon(Icons.logout, color: Color(0xFFffe145)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.6);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height * 0.6,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class CustomAppBarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.6);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height * 0.6,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:cytc/UserPages/screen/Profile/ProfilePage.dart';
import 'package:cytc/UserPages/screen/auth/login.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/Suggestions/Suggestions_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/activities/university/University_main(1).dart';
import 'package:cytc/UserPages/screen/bottomBarPages/buttonBar.dart';

class BloodDonationPage extends StatefulWidget {
  @override
  _BloodDonationPageState createState() => _BloodDonationPageState();

  final String userId;
  final String userRole;
  const BloodDonationPage(
      {Key? key, required this.userId, required this.userRole})
      : super(key: key);
}

class _BloodDonationPageState extends State<BloodDonationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;
  bool _canDonate = false;
  bool _isLoading = true;
  String _hospitalName = '';
  String _bloodType = '';
  int _bloodUnitsRequired = 0;
  String _date = '';
  String _time = '';
  String _lastDonationDate = '';
  String _bloodDonationCaseId = ''; // Add this variable to store the case ID

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

    _checkCanDonate();
    _fetchBloodDonationInfo();
  }

  Future<void> _checkCanDonate() async {
    final response = await http.get(Uri.parse(
        'http://localhost:9999/blooduser/can-donate/${widget.userId}'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      setState(() {
        _canDonate = result['canDonate'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      // Handle error case
    }
  }

  Future<void> _fetchBloodDonationInfo() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/blood-donation/last'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      setState(() {
        _hospitalName = result['hospitalName'];
        _bloodType = result['bloodType'];
        _bloodUnitsRequired = result['bloodUnitsRequired'];
        _date = result['date'];
        _time = result['time'];
        _bloodDonationCaseId = result['_id']; // Store the case ID
      });
    } else {
      // Handle error case
    }
  }

  Future<void> _fetchLastDonationDate() async {
    final response = await http.get(
        Uri.parse('http://localhost:9999/blooduser/last/${widget.userId}'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      setState(() {
        _lastDonationDate = result['timestamp'];
      });
      _showLastDonationDateDialog(context, _lastDonationDate);
    } else {
      // Handle error case
    }
  }

  Future<void> _sendDonationRequest() async {
    final response = await http.post(
      Uri.parse('http://localhost:9999/blooduser/create'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userId': widget.userId,
        'bloodDonationCaseId': _bloodDonationCaseId,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Show success dialog upon successful donation request
      _showDonationSuccessDialog(context);
    } else {
      // Handle error case
    }
  }

  void _showLastDonationDateDialog(BuildContext context, String lastDate) {
    final formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(lastDate));
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
                    Column(
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
                        SizedBox(height: 10),
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
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            '$formattedDate\nيجب ان يمر ثلاثة اشهر على الاقل من اخر تاريح تبرعت فيه بالدم',
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

  void _showDonationConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text(
            'التأكيد',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontWeight: FontWeight.bold,
              color: Color(0xFF071533),
            ),
          ),
          content: Text(
            'هل ستذهب للتبرع الآن؟',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 20,
              color: Color(0xFF071533),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'لا',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _sendDonationRequest();
              },
              child: Text(
                'نعم',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDonationSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Disable closing by tapping outside the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text(
            'نجاح',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontWeight: FontWeight.bold,
              color: Color(0xFF071533),
            ),
          ),
          content: Text(
            'تم تسجيلك للتبرع بالدم في $_hospitalName لفصيلة الدم $_bloodType.\nيرجى التوجه إلى المستشفى في أقرب وقت.',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 20,
              color: Color(0xFF071533),
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bar(
                      userId: widget.userId,
                      userRole: widget.userRole,
                    ),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                'العودة الى الصفحة الرئيسية',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
          ],
        );
      },
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
        child: AppBar(
          backgroundColor: Color(0xFF071533).withOpacity(0.1),
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon:
                    Icon(LineAwesomeIcons.bars_solid, color: Color(0xFF071533)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(LineAwesomeIcons.angle_right_solid,
                  color: Color(0xFF071533)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      drawer: _buildDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                            _hospitalName,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Amiri',
                              color: Color(0xFF071533),
                            ),
                          ),
                          SizedBox(width: 6),
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
                            _bloodType,
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _bloodUnitsRequired.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Amiri',
                              color: Color(0xFF071533),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            ':عدد وحدات الدم الطلوبة',
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
                  ElevatedButton(
                    onPressed: _canDonate
                        ? () {
                            _showDonationConfirmationDialog(context);
                          }
                        : () {
                            _fetchLastDonationDate();
                          },
                    child: Text(
                      'سأقوم بالتبرع',
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
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                        style: TextStyle(
                            color: Color(0xFF071533),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Amiri'),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                  userId: widget.userId,
                                  userRole: widget.userRole)));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/banah.jpg'), // Replace with your image path
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => bar(
                          userId: widget.userId,
                          userRole: widget.userId,
                        ))),
            title: Text('الرئيسية',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(Icons.home, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => universityTrainingPage(
                        userId: widget.userId,
                        userRole: widget.userRole))), // Add onTap functionality
            title: Text('تقديم طلب تدريب للخريجين',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing: Icon(LineAwesomeIcons.graduation_cap_solid,
                color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SuggestionsPage(
                        userId: widget.userId,
                        userRole: widget.userRole))), // Add onTap functionality
            title: Text('شاركنا باقتراحاتك وافكارك',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
            trailing:
                Icon(LineAwesomeIcons.comment_dots, color: Color(0xFFffe145)),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(
                          userId: widget.userId,
                        ))), // Add onTap functionality for logout
            title: Text('تسجيل خروج',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Color(0xFF071533))),
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
