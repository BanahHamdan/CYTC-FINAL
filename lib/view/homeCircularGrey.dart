// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/view/locationMap.dart';
import 'package:cytc/view/screen/Profile/ProfilePage.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTestGrey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeTest(),
    );
  }
}

class HomeTest extends StatefulWidget {
  @override
  _HomeTestGreyState createState() => _HomeTestGreyState();
}

class _HomeTestGreyState extends State<HomeTest>
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 100, // Adjust the width to accommodate both icons
            leading: Builder(
              builder: (context) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          10, 0, 5, 0), // Adjust padding as needed
                      child: Container(
                        width: 27, // Adjust width as needed
                        height: 27, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Color(0xFF071533).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.menu,
                              color: Color(0xFF071533), size: 20),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          padding: EdgeInsets.zero, // Remove extra padding
                          constraints:
                              BoxConstraints(), // Remove default constraints
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          10, 0, 5, 0), // Adjust padding as needed
                      child: Container(
                        width: 27, // Adjust width as needed
                        height: 27, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Color(0xFF071533).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.notifications,
                              color: Color(0xFF071533), size: 20),
                          onPressed: () {
                            // Handle notification click
                          },
                          padding: EdgeInsets.zero, // Remove extra padding
                          constraints:
                              BoxConstraints(), // Remove default constraints
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Color(0xFF071533),
                  size: 20,
                ),
                onPressed: _toggleSearchBar,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/Logo.png', // Replace with your image path
                  width: 40, // Adjust width as needed
                  height: 40, // Adjust height as needed
                ),
              ),
            ],
          ),
          drawer: Drawer(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeTestGrey()));
                    },
                    title: Row(
                      children: [
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    title: Row(
                      children: [
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
          ),
          body: HomePage(),
        ),
        if (isSearchBarVisible)
          FadeTransition(
            opacity: _animation,
            child: Material(
              color: Color(0xFF071533).withOpacity(0.5),
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).padding.top +
                          kToolbarHeight), // Adjust for status bar and app bar height
                  Center(
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width *
                          0.8, // Adjust width as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        controller:
                            textEditingController, // Assign the TextEditingController to the TextField
                        cursorColor: Color(
                            0xFF071533), // Customize the color of the cursor
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 1),
                          hintText: '...ابحث',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily:
                                  'Amiri'), // Customize the color of the hint text
                          prefixIcon: Icon(Icons.search,
                              color: Color(0xFF071533)), // Search icon
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear,
                                color: Color(0xFF071533),
                                size:
                                    20), // Clear icon to clear the search text
                            onPressed: _toggleSearchBar,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBloodDonation = true;
  bool showSkillsNeeded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Text(
            //       'تعرف على احدث انجازاتنا',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           fontSize: 17,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: 'Amiri'),
            //     ),
            //   ),
            // ),
            Container(
              height:
                  240, // Adjust height as needed to accommodate image and text
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: 0.99, bottom: 40), // Adjust padding as needed
              child: CarouselSlider(
                items: [
                  // 1st Image of Slider with Text
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/homePage/slider10.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "نشاط رقم 1",
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
                  // 2nd Image of Slider with Text
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/homePage/slider1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "نشاط رقم 2",
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
                  // 3rd Image of Slider with Text
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/homePage/slider8.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "نشاط رقم 3",
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
                  // 4th Image of Slider with Text
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/homePage/slider6.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "نشاط رقم 4",
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
                  // 5th Image of Slider with Text
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/homePage/slider7.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "نشاط رقم 5",
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
                ],
                // Slider Container properties
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
                color: Colors.white, //rounded container color
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
                      child: SingleChildScrollView(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
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
                            ),
                            Row(
                              children: [
                                if (showSkillsNeeded)
                                  Expanded(
                                    child: _buildCategoryCard('بحاجة لمسعفين',
                                        'assets/homePage/bloodBag_icon.png'),
                                  ),
                                if (!showSkillsNeeded)
                                  Expanded(
                                      child:
                                          SizedBox()), // Placeholder to maintain structure
                                if (showBloodDonation)
                                  Expanded(
                                    child: _buildCategoryCard('بحاجة لوحدات دم',
                                        'assets/homePage/ambulance_icon.png'),
                                  ),
                                if (!showBloodDonation)
                                  Expanded(
                                      child:
                                          SizedBox()), // Placeholder to maintain structure
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ///////////////
                            Padding(
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
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ///////////////
                            Center(
                              child: CustomVolunteerCard(
                                title: 'متطوع الشهر المثالي',
                                subtitle: 'بانه خالد حمدان',
                                imagePath:
                                    'assets/banah.jpg', // Replace with your image asset
                                frontText:
                                    'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد',
                              ),
                            ),

                            SizedBox(
                              height: 40,
                            ),

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
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 300,
                              height: 125,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // SizedBox(height: 50),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Amiri',
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 10,
                                          // ),
                                          // Image.asset(
                                          //   'assets/Logo.png',
                                          //   width: 30,
                                          //   height: 30,
                                          // ),
                                        ],
                                      ),
                                      Text(
                                        'مركز تدريب الشباب المجتمعي، هو مركز يهتم بتطوير الخ الخ الخ',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Amiri',
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MapPageHome(
                                                        destination: LatLng(
                                                            32.2238, 35.2613)),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xFF071533),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            side:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          child: Text(
                                            'اعرف موقع المركز وقم بزيارتنا',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Amiri',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: Container(
            width: 300,
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   title,
                    //   textAlign: TextAlign.right,
                    //   style: TextStyle(
                    //     fontFamily: 'Amiri',
                    //     fontSize: 17,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
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
                SizedBox(
                  width: 15,
                ),
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
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // SizedBox(height: 20),
              ],
            ),
          ),
          back: Container(
            width: 300,
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              // child: Padding(
              // padding: EdgeInsets.fromLTRB(8, 40, 8, 8),
              child: Text(
                frontText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 15,
                ),
              ),
              // ),
            ),
          ),
        ),
        // Positioned(
        //   top: -40,
        //   left: 100,
        // child: Container(
        //   width: 100,
        //   height: 80,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(
        //       color: Colors.white,
        //       width: 2,
        //     ),
        //     image: DecorationImage(
        //       image: AssetImage(imagePath),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        // ),
      ],
    );
  }
}

Widget _buildCategoryCard(String title, String imagePath) {
  return Card(
    color: Color(0xFF071533), // Set the background color of the card
    margin: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      width: 110,
      height: 100, // Adjust the height of the card as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 45, height: 45), // Display the image
          SizedBox(height: 10),
          Text(title,
              style: TextStyle(
                  fontSize: 16, color: Colors.white, fontFamily: 'Amiri')),
        ],
      ),
    ),
  );
}
