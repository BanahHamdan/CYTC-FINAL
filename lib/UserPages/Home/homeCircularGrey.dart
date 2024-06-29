// import 'package:cytc/UserPages/screen/bottomBarPages/posts/viewpost.dart';
// import 'package:flutter/material.dart';
// import 'package:cytc/UserPages/Home/locationMap.dart';
// import 'package:cytc/UserPages/screen/Emergencies/Paramedics.dart';
// import 'package:cytc/UserPages/screen/Emergencies/bloodDonation.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeTestGrey extends StatelessWidget {
//   final String userId;
//   final String userRole;

//   const HomeTestGrey({Key? key, required this.userId, required this.userRole})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeTest(userId: userId, userRole: userRole),
//     );
//   }
// }

// class HomeTest extends StatefulWidget {
//   final String userId;
//   final String userRole;

//   const HomeTest({Key? key, required this.userId, required this.userRole})
//       : super(key: key);

//   @override
//   _HomeTestState createState() => _HomeTestState();
// }

// class _HomeTestState extends State<HomeTest>
//     with SingleTickerProviderStateMixin {
//   TextEditingController textEditingController = TextEditingController();
//   bool isSearchBarVisible = false;
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   void _toggleSearchBar() {
//     setState(() {
//       isSearchBarVisible = !isSearchBarVisible;
//       if (isSearchBarVisible) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           body: HomePage(userId: widget.userId, userRole: widget.userRole),
//         ),
//       ],
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   final String userId;
//   final String userRole;

//   const HomePage({Key? key, required this.userId, required this.userRole})
//       : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool showBloodDonation = true;
//   bool showSkillsNeeded = true;
//   List<Post> posts = [];
//   Volunteer? volunteer;

//   @override
//   void initState() {
//     super.initState();
//     fetchPosts();
//     fetchVolunteerOfMonth();
//   }

//   Future<void> fetchPosts() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:9999/posts/all'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       setState(() {
//         posts = data.map((postJson) => Post.fromJson(postJson)).toList();
//         posts.sort((a, b) => b.id.compareTo(a.id));
//       });
//     } else {
//       print('Failed to load posts');
//     }
//   }

//   Future<void> fetchVolunteerOfMonth() async {
//     final month = DateTime.now().month.toString().padLeft(2, '0');
//     final response =
//         await http.get(Uri.parse('http://localhost:9999/volunteer/$month'));
//         print('volenteer of the month:');
//         print(response.body);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         volunteer = Volunteer.fromJson(data);
//       });
//     } else {
//       print('Failed to load volunteer of the month');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfffafafa),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               height:
//                   240, // Adjust height as needed to accommodate image and text
//               color: Colors.white,
//               padding: EdgeInsets.only(
//                   top: 0.99, bottom: 40), // Adjust padding as needed
//               child: CarouselSlider(
//                 items: posts.isEmpty
//                     ? [
//                         _buildSliderItem("assets/homePage/slider1.jpg",
//                             "No Posts Available", "")
//                       ]
//                     : posts.take(3).map((post) {
//                         return _buildSliderItem(
//                             post.imageUrl, post.title, post.id);
//                       }).toList(),
//                 options: CarouselOptions(
//                   height: 240.0, // Adjusted height
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 0.9,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 205),
//               padding: EdgeInsets.only(
//                   bottom: 0, top: 0), // Adjust padding as needed
//               decoration: BoxDecoration(
//                 color: Colors.white, // Rounded container color
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30.0),
//                   topRight: Radius.circular(30.0),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: LayoutBuilder(
//                       builder: (context, constraints) {
//                         bool isWeb = constraints.maxWidth > 680;
//                         double adjustedWidth = isWeb
//                             ? constraints.maxWidth * 0.5
//                             : constraints.maxWidth;
//                         return SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: adjustedWidth,
//                                 child: _buildEmergencySection(),
//                               ),
//                               Container(
//                                 width: adjustedWidth,
//                                 child: _buildEmergencyCards(),
//                               ),
//                               SizedBox(height: 30),
//                               Container(
//                                 width: adjustedWidth,
//                                 child: _buildVolunteerOfMonth(),
//                               ),
//                               SizedBox(height: 10),
//                               Container(
//                                 width: adjustedWidth,
//                                 child: _buildCustomVolunteerCard(),
//                               ),
//                               SizedBox(height: 40),
//                               Container(
//                                 width: adjustedWidth,
//                                 child: _buildCenterInfo(),
//                               ),
//                               SizedBox(height: 40),
//                               Container(
//                                 width: adjustedWidth,
//                                 child: _buildMapSection(),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSliderItem(String imagePath, String text, String postId) {
//     return GestureDetector(
//       onTap: () {
//         if (postId.isNotEmpty) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   ViewPost(postId: postId, userId: widget.userId),
//             ),
//           );
//         }
//       },
//       child: Stack(
//         children: [
//           Container(
//             margin: EdgeInsets.all(6.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               image: DecorationImage(
//                 image: imagePath.startsWith('http')
//                     ? NetworkImage(imagePath) as ImageProvider<Object>
//                     : AssetImage(imagePath) as ImageProvider<Object>,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 10),
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Amiri',
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmergencySection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(right: 5),
//           child: Align(
//             alignment: Alignment.topRight,
//             child: Text(
//               'حالات طارئة',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontFamily: 'Amiri',
//                 color: Color(0xFF071533),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Image.asset(
//           'assets/gif/alert.gif', // Replace with your gif path
//           width: 40,
//           height: 40,
//         ),
//       ],
//     );
//   }

//   Widget _buildEmergencyCards() {
//     return Row(
//       children: [
//         if (showSkillsNeeded)
//           Expanded(
//             child: _buildCategoryCard(
//               'بحاجة لمسعفين',
//               'assets/homePage/ambulance_icon.png',
//               () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ParamedicsPage(
//                         userId: widget.userId, userRole: widget.userRole)),
//               ),
//             ),
//           ),
//         if (!showSkillsNeeded)
//           Expanded(child: SizedBox()), // Placeholder to maintain structure
//         if (showBloodDonation)
//           Expanded(
//             child: _buildCategoryCard(
//               'بحاجة لوحدات دم',
//               'assets/homePage/bloodBag_icon.png',
//               () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => BloodDonationPage(
//                         userId: widget.userId, userRole: widget.userRole)),
//               ),
//             ),
//           ),
//         if (!showBloodDonation)
//           Expanded(child: SizedBox()), // Placeholder to maintain structure
//       ],
//     );
//   }

//   Widget _buildVolunteerOfMonth() {
//     return Padding(
//       padding: EdgeInsets.only(right: 15),
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Text(
//           'متطوع الشهر المثالي',
//           textAlign: TextAlign.right,
//           style: TextStyle(
//             fontSize: 17,
//             fontFamily: 'Amiri',
//             color: Color(0xFF071533),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCustomVolunteerCard() {
//     if (volunteer == null) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     return Center(
//       child: CustomVolunteerCard(
//         title: 'متطوع الشهر المثالي',
//         subtitle: volunteer!.username,
//         imagePath: volunteer!.userImageUrl,
//         frontText:
//             'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر وكان الاكثر نشاطا وتفاعلا معنا في المركز . يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد',
//       ),
//     );
//   }

//   Widget _buildCenterInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(right: 15),
//           child: Align(
//             alignment: Alignment.topRight,
//             child: Text(
//               'تعرف على مركزنا',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontFamily: 'Amiri',
//                 color: Color(0xFF071533),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         Container(
//           width: 300,
//           height: 210,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Color(0xFF071533).withOpacity(0.2),
//                 spreadRadius: 1,
//                 blurRadius: 6,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 8),
//                       child: Text(
//                         'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                           fontSize: 15,
//                           // fontWeight: FontWeight.bold,
//                           fontFamily: 'Amiri',
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 17),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     'مركز تدريب الشباب المجتمعي هو مؤسسة تهدف إلى تطوير مهارات الشباب في مختلف المجالات، وتمكينهم من أداء دورهم القيادي في المجتمع بفعالية، وتعزيز مواهبهم في الفنون والإبداع، ودعمهم من خلال الدورات التدريبية والمبادرات المجتمعية، وذلك بهدف إعداد جيل قادر على إحداث التغيير الإيجابي في المجتمع.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontFamily: 'Amiri',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMapSection() {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(right: 15),
//           child: Align(
//             alignment: Alignment.topRight,
//             child: Text(
//               'اعرف موقع المركز وقم بزيارتنا',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontFamily: 'Amiri',
//                 color: Color(0xFF071533),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Image.asset(
//           'assets/gif/map.gif',
//           width: 150,
//           height: 150,
//         ),
//         Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MapPageHome(
//                     destination: LatLng(32.2238, 35.2613),
//                     userId: widget.userId,
//                     userRole: widget.userRole,
//                   ),
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               foregroundColor: Color(0xFF071533),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               side: BorderSide(color: Colors.grey),
//             ),
//             child: Text(
//               'اذهب للخريطة',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'Amiri',
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomVolunteerCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imagePath;
//   final String frontText;

//   CustomVolunteerCard({
//     required this.title,
//     required this.subtitle,
//     required this.imagePath,
//     required this.frontText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isWeb = constraints.maxWidth > 680;
//         double adjustedWidth =
//             isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth;
//         return Container(
//           width: adjustedWidth,
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               FlipCard(
//                 direction: FlipDirection.HORIZONTAL,
//                 front: Container(
//                   width: adjustedWidth,
//                   height: 125,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0xFF071533).withOpacity(0.2),
//                         spreadRadius: 1,
//                         blurRadius: 6,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             subtitle,
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 15),
//                       Container(
//                         width: 130,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 2,
//                           ),
//                           image: DecorationImage(
//                             image: imagePath.startsWith('http')
//                                 ? NetworkImage(imagePath)
//                                     as ImageProvider<Object>
//                                 : AssetImage(imagePath)
//                                     as ImageProvider<Object>,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                     ],
//                   ),
//                 ),
//                 back: Container(
//                   width: adjustedWidth,
//                   height: 125,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0xFF071533).withOpacity(0.2),
//                         spreadRadius: 1,
//                         blurRadius: 6,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: Text(
//                       frontText,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Amiri',
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// Widget _buildCategoryCard(String title, String imagePath, Function onTap) {
//   return LayoutBuilder(
//     builder: (context, constraints) {
//       bool isWeb = constraints.maxWidth > 680;
//       double adjustedWidth =
//           isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth;
//       return GestureDetector(
//         onTap: () => onTap(),
//         child: Card(
//           color: Color(0xFF071533), // Set the background color of the card
//           margin: EdgeInsets.all(8),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Container(
//             width: adjustedWidth,
//             height: 100, // Adjust the height of the card as needed
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(imagePath,
//                     width: 45, height: 45), // Display the image
//                 SizedBox(height: 10),
//                 Text(
//                   title,
//                   style: TextStyle(
//                       fontSize: 16, color: Colors.white, fontFamily: 'Amiri'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.3);
//     path.quadraticBezierTo(
//         size.width / 2, size.height / 2, size.width, size.height * 0.3);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class Post {
//   final String id;
//   final String title;
//   final String description;
//   final String imageUrl;
//   int likesCounter;
//   bool liked;

//   Post({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     this.likesCounter = 0,
//     this.liked = false,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['_id'],
//       title: json['title'],
//       description: json['description'],
//       imageUrl: json['imageUrl'],
//       likesCounter: json['likesCounter'] ?? 0,
//     );
//   }
// }

// class Volunteer {
//   final String id;
//   final String userId;
//   final String username;
//   final String userImageUrl;
//   final String month;

//   Volunteer({
//     required this.id,
//     required this.userId,
//     required this.username,
//     required this.userImageUrl,
//     required this.month,
//   });

//   factory Volunteer.fromJson(Map<String, dynamic> json) {
//     return Volunteer(
//       id: json['_id'],
//       userId: json['userId'],
//       username: json['username'], 
//       userImageUrl: json['userImageUrl'],
//       month: json['month'],
//     );
//   }
// }



// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/UserPages/screen/bottomBarPages/posts/viewpost.dart';
import 'package:flutter/material.dart';
import 'package:cytc/UserPages/Home/locationMap.dart';
import 'package:cytc/UserPages/screen/Emergencies/Paramedics.dart';
import 'package:cytc/UserPages/screen/Emergencies/bloodDonation.dart';
import 'package:flip_card/flip_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeTestGrey extends StatelessWidget {
  final String userId;
  final String userRole;

  const HomeTestGrey({Key? key, required this.userId, required this.userRole})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeTest(userId: userId, userRole: userRole),
    );
  }
}

class HomeTest extends StatefulWidget {
  final String userId;
  final String userRole;

  const HomeTest({Key? key, required this.userId, required this.userRole})
      : super(key: key);

  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  bool isSearchBarVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleSearchBar() {
    setState(() {
      isSearchBarVisible = !isSearchBarVisible;
      if (isSearchBarVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: HomePage(userId: widget.userId, userRole: widget.userRole),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  final String userId;
  final String userRole;

  const HomePage({Key? key, required this.userId, required this.userRole})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBloodDonation = true;
  bool showSkillsNeeded = true;
  List<Post> posts = [];
  Volunteer? volunteer;

  @override
  void initState() {
    super.initState();
    fetchPosts();
    fetchVolunteerOfMonth();
  }

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/posts/all'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        posts = data.map((postJson) => Post.fromJson(postJson)).toList();
        posts.sort((a, b) => b.id.compareTo(a.id));
      });
    } else {
      print('Failed to load posts');
    }
  }

  Future<void> fetchVolunteerOfMonth() async {
    final month = DateTime.now().month.toString().padLeft(2, '0');
    final response =
        await http.get(Uri.parse('http://localhost:9999/volunteer/$month'));
        print('volenteer of the month:');
        print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      setState(() {
        volunteer = Volunteer.fromJson(data);
      });
    } else {
      print('Failed to load volunteer of the month');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height:
                  240, // Adjust height as needed to accommodate image and text
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: 0.99, bottom: 40), // Adjust padding as needed
              child: CarouselSlider(
                items: posts.isEmpty
                    ? [
                        _buildSliderItem("assets/homePage/slider1.jpg",
                            "No Posts Available", "")
                      ]
                    : posts.take(3).map((post) {
                        return _buildSliderItem(
                            post.imageUrl, post.title, post.id);
                      }).toList(),
                options: CarouselOptions(
                  height: 240.0, // Adjusted height
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 205),
              padding: EdgeInsets.only(
                  bottom: 0, top: 0), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Colors.white, // Rounded container color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        bool isWeb = constraints.maxWidth > 680;
                        double adjustedWidth = isWeb
                            ? constraints.maxWidth * 0.5
                            : constraints.maxWidth;
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: adjustedWidth,
                                child: _buildEmergencySection(),
                              ),
                              Container(
                                width: adjustedWidth,
                                child: _buildEmergencyCards(),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: adjustedWidth,
                                child: _buildVolunteerOfMonth(),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: adjustedWidth,
                                child: _buildCustomVolunteerCard(),
                              ),
                              SizedBox(height: 40),
                              Container(
                                width: adjustedWidth,
                                child: _buildCenterInfo(),
                              ),
                              SizedBox(height: 40),
                              Container(
                                width: adjustedWidth,
                                child: _buildMapSection(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSliderItem(String imagePath, String text, String postId) {
    return GestureDetector(
      onTap: () {
        if (postId.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ViewPost(postId: postId, userId: widget.userId),
            ),
          );
        }
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: imagePath.startsWith('http')
                    ? NetworkImage(imagePath) as ImageProvider<Object>
                    : AssetImage(imagePath) as ImageProvider<Object>,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Amiri',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'حالات طارئة',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/gif/alert.gif', // Replace with your gif path
          width: 40,
          height: 40,
        ),
      ],
    );
  }

  Widget _buildEmergencyCards() {
    return Row(
      children: [
        if (widget.userRole == '1')
          Expanded(
            child: _buildCategoryCard(
              'بحاجة لمسعفين',
              'assets/homePage/ambulance_icon.png',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ParamedicsPage(
                        userId: widget.userId, userRole: widget.userRole)),
              ),
            ),
          ),
        if (widget.userRole == '0')
          Expanded(child: SizedBox()), // Placeholder to maintain structure
        if (widget.userRole == '1')
          Expanded(
            child: _buildCategoryCard(
              'بحاجة لوحدات دم',
              'assets/homePage/bloodBag_icon.png',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BloodDonationPage(
                        userId: widget.userId, userRole: widget.userRole)),
              ),
            ),
          ),
        if (widget.userRole == '0')
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 320,
            child: _buildCategoryCard(
              'بحاجة لوحدات دم',
              'assets/homePage/bloodBag_icon.png',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BloodDonationPage(
                        userId: widget.userId, userRole: widget.userRole)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVolunteerOfMonth() {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'متطوع الشهر المثالي',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Amiri',
            color: Color(0xFF071533),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomVolunteerCard() {
    if (volunteer == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: CustomVolunteerCard(
        title: 'متطوع الشهر المثالي',
        subtitle: volunteer!.username,
        imagePath: volunteer!.userImageUrl,
        frontText:
            'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر وكان الاكثر نشاطا وتفاعلا معنا في المركز . يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد',
      ),
    );
  }

  Widget _buildCenterInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'تعرف على مركزنا',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 300,
          height: 210,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF071533).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ),
                    SizedBox(width: 17),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'مؤسسة تهدف إلى تطوير مهارات الشباب في مختلف المجالات، وتمكينهم من أداء دورهم القيادي في المجتمع بفعالية، وتعزيز مواهبهم في الفنون والإبداع، ودعمهم من خلال الدورات التدريبية والمبادرات المجتمعية، وذلك بهدف إعداد جيل قادر على إحداث التغيير الإيجابي في المجتمع.',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'اعرف موقع المركز وقم بزيارتنا',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/gif/map.gif',
          width: 150,
          height: 150,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPageHome(
                    destination: LatLng(32.2238, 35.2613),
                    userId: widget.userId,
                    userRole: widget.userRole,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF071533),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.grey),
            ),
            child: Text(
              'اذهب للخريطة',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Amiri',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomVolunteerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String frontText;

  CustomVolunteerCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.frontText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWeb = constraints.maxWidth > 680;
        double adjustedWidth =
            isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth;
        return Container(
          width: adjustedWidth,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                  width: adjustedWidth,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF071533).withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subtitle,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: imagePath.startsWith('http')
                                ? NetworkImage(imagePath)
                                    as ImageProvider<Object>
                                : AssetImage(imagePath)
                                    as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                back: Container(
                  width: adjustedWidth,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF071533).withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      frontText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildCategoryCard(String title, String imagePath, Function onTap) {
  return LayoutBuilder(
    builder: (context, constraints) {
      bool isWeb = constraints.maxWidth > 680;
      double adjustedWidth =
          isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth;
      return GestureDetector(
        onTap: () => onTap(),
        child: Card(
          color: Color(0xFF071533), // Set the background color of the card
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: adjustedWidth,
            height: 100, // Adjust the height of the card as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath,
                    width: 45, height: 45), // Display the image
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: 'Amiri'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Post {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  int likesCounter;
  bool liked;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.likesCounter = 0,
    this.liked = false,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      likesCounter: json['likesCounter'] ?? 0,
    );
  }
}

class Volunteer {
  final String id;
  final String userId;
  final String username;
  final String userImageUrl;
  final String month;

  Volunteer({
    required this.id,
    required this.userId,
    required this.username,
    required this.userImageUrl,
    required this.month,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      id: json['_id'],
      userId: json['userId'],
      username: json['username'], 
      userImageUrl: json['userImageUrl'],
      month: json['month'],
    );
  }
}

