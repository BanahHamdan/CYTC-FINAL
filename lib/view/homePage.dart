// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();

  homePage({Key? key}) : super(key: key);
}

class _homePageState extends State<homePage> {
  bool showSecondText = false;
  List<bool> _isOpen = [false, false];

//////////for search////////////////
  bool isSearchBarVisible = false;
  // void toggleSearchBarVisibility() {
  //   setState(() {
  //     isSearchBarVisible = !isSearchBarVisible;
  //   });
  // }
  /////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /////////////////////////navBar///////////////////////////
      backgroundColor: Color(0xFF9BCB3D),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFFF29F3D),
        animationDuration: Duration(milliseconds: 300),
        // onTap: (index){
        // },
        items: [
          Icon(Icons.calendar_month, color: Colors.white),
          Icon(Icons.chat, color: Colors.white),
          Icon(Icons.notifications, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
        ],
      ),
      //////////////////////////////////////////////////////////

      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Set background color to transparent
        elevation: 0, // Remove elevation
        leading: IconButton(
          icon: Icon(Icons.menu), // Burger menu icon
          onPressed: () {
            // Add functionality for burger menu
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Search icon
            onPressed: () {
              // Add functionality to show search bar
            },
          ),
          GestureDetector(
            onTap: () {
              // Add functionality to navigate to profile page
            },
            child: Container(
              // padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(right: 20),
              width: 40, // Adjust the width as needed
              height: 40, // Adjust the height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: AssetImage('assets/banah.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ), // Remove the app bar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ////////app bar ,
            Visibility(
              visible:
                  isSearchBarVisible, // Control the visibility of the search bar
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(77, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

// GestureDetector(
//   onTap: () {
//     // Add functionality to navigate to profile page
//   },
//   child: Container(
//     // padding: EdgeInsets.only(top: 20),
//     margin: EdgeInsets.only(right: 20),
//     width: 40, // Adjust the width as needed
//     height: 40, // Adjust the height as needed
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       border: Border.all(color: Color(0xFFF29F3D), width: 2),
//       image: DecorationImage(
//         image: AssetImage('assets/banah.jpg'),
//         fit: BoxFit.cover,
//       ),
//     ),
//   ),
// ),

            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 38), // Added padding
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Expanded(
            //         child: Container(
            //           margin: EdgeInsets.fromLTRB(77, 0, 10, 0),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(30),
            //           ),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               hintText: 'Search...',
            //               prefixIcon: Icon(Icons.search),
            //               border: InputBorder.none,
            //             ),
            //           ),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           // Add functionality to navigate to profile page
            //         },
            //         child: Container(
            //           // padding: EdgeInsets.only(top: 20),
            // margin: EdgeInsets.only(right: 20),
            // width: 55,
            // height: 55,
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   border: Border.all(color: Color(0xFFCF3333), width: 2),
            //   image: DecorationImage(
            //     image: AssetImage('assets/banah.jpg'), // Replace with actual profile image
            //     fit: BoxFit.cover,
            //   ),
            // ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

///////////////////////slider////////////////////////////
            Container(
              padding: EdgeInsets.only(
                  top: 0.99, bottom: 40), // Adjust padding as needed
              child: CarouselSlider(
                items: [
                  //  1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/slider10.jpg"),
                        // image: NetworkImage("https://picsum.photos/id/240/200/300"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/slider1.jpg"),
                        // image: NetworkImage("https://picsum.photos/id/241/200/300"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/slider8.jpg"),
                        // image: NetworkImage("https://picsum.photos/id/242/200/300"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //4th Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/slider6.jpg"),
                        // image: NetworkImage("https://picsum.photos/id/243/200/300"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //5th Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/slider7.jpg"),
                        // image: NetworkImage("https://picsum.photos/id/244/200/300"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.7,
                ),
              ),
            ),
////////////////////////////////////////////////////////////////

///////////////////////////volunteer of the month///////////////
            Container(
              padding: EdgeInsets.only(bottom: 10), // Adjust padding as needed
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
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'متطوع الشهر',
                          style: TextStyle(
                            color: Color(0xFF9BCB3D),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        // padding: EdgeInsets.only(top: 20),
                        // margin: EdgeInsets.only(right: 6),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xFF9BCB3D), width: 5),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/banah.jpg'), // Replace with actual profile image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // Inner container properties
                      // margin: EdgeInsets.all(20), // Add margin for spacing
                      margin: EdgeInsets.fromLTRB(110, 5, 110, 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF9BCB3D),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'بانه حمدان',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
///////////////////////////////////////////////////////////
//////////////////////////اعلانات هامة/////////////////////////////////
                    SizedBox(height: 20),
                    Container(),
///////////////////////////////////////////////////////////

////////////////////////////من نحن///////////////////////////////
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20,
                          top: 0,
                          left: 20,
                          bottom: 0), // Adjust padding as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xFFF29F3D), width: 2.0),
                              // left: BorderSide(color: Colors.white, width: 2.0),
                              // right:
                              //     BorderSide(color: Colors.white, width: 2.0),
                              // bottom: BorderSide(
                              //     color: Color(0xFFF29F3D), width: 2.0),
                            ),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ExpansionPanelList(
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.green,
                              elevation: 1,
                              expandedHeaderPadding: EdgeInsets.all(8),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isOpen) {
                                    return ListTile(
                                      title: Text(
                                        "من نحن؟",
                                        style: TextStyle(
                                          color: Color(
                                              0xFFF29F3D), // Change font color
                                          fontSize: 25.0, // Change font size
                                        ),
                                      ),
                                    );
                                  },
                                  body: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      "مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم",
                                      style: TextStyle(
                                        color: Color(0xFFF29F3D),
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                  isExpanded: _isOpen[0],
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isOpen) {
                                setState(() {
                                  _isOpen[panelIndex] = !isOpen;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    //////
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20,
                          top: 0,
                          left: 20,
                          bottom: 0), // Adjust padding as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xFFF29F3D), width: 2.0),
                              // left: BorderSide(color: Colors.white, width: 2.0),
                              // right:
                              //     BorderSide(color: Colors.white, width: 2.0),
                              // bottom: BorderSide(
                              //     color: Colors.white, width: 2.0),
                            ),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ExpansionPanelList(
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.green,
                              elevation: 1,
                              expandedHeaderPadding: EdgeInsets.all(8),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isOpen) {
                                    return ListTile(
                                      title: Text(
                                        "شارك معنا, وانضم الى عائلتنا",
                                        style: TextStyle(
                                          color: Color(
                                              0xFFF29F3D), // Change font color
                                          fontSize: 25.0, // Change font size
                                        ),
                                      ),
                                    );
                                  },
                                  body: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      "مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم",
                                      style: TextStyle(
                                        color: Color(0xFFF29F3D),
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                  isExpanded: _isOpen[0],
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isOpen) {
                                setState(() {
                                  _isOpen[panelIndex] = !isOpen;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20,
                          top: 0,
                          left: 20,
                          bottom: 25), // Adjust padding as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xFFF29F3D), width: 2.0),
                              // left: BorderSide(color: Colors.white, width: 2.0),
                              // right:
                              //     BorderSide(color: Colors.white, width: 2.0),
                              bottom: BorderSide(
                                  color: Color(0xFFF29F3D), width: 2.0),
                            ),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ExpansionPanelList(
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.green,
                              elevation: 1,
                              expandedHeaderPadding: EdgeInsets.all(8),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isOpen) {
                                    return ListTile(
                                      title: Text(
                                        "شراكاتنا مع الجامعات",
                                        style: TextStyle(
                                          color: Color(
                                              0xFFF29F3D), // Change font color
                                          fontSize: 25.0, // Change font size
                                        ),
                                      ),
                                    );
                                  },
                                  body: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      "مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم",
                                      style: TextStyle(
                                        color: Color(0xFFF29F3D),
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                  isExpanded: _isOpen[0],
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isOpen) {
                                setState(() {
                                  _isOpen[panelIndex] = !isOpen;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///

                    //     Container(
                    //       child:GestureDetector(
                    //         onTap: () {
                    //           setState(() {
                    //             showSecondText = !showSecondText; // Toggle the value
                    //           });
                    //           // Add navigation functionality
                    //         },
                    //           child: Padding(
                    //             padding: EdgeInsets.only(right: 20, top: 10, left: 20), // Add your desired padding

                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 border: Border(
                    //                   bottom: BorderSide(
                    //                     color: Color.fromARGB(232, 244, 195, 138), // Set border color
                    //                     width: 2.0, // Set border width
                    //                   ),
                    //                   ),
                    //               ),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.end,
                    //               children: [
                    //                 Text(
                    //                   'من نحن؟',
                    //                   textDirection: TextDirection.rtl,
                    //                   style: TextStyle(
                    //                     color: Color(0xFFF29F3D),
                    //                     fontSize: 40,
                    //                     fontWeight: FontWeight.bold,
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 10), // Add space between icon and text
                    //                 Icon(
                    //                   Icons.arrow_drop_down_circle_outlined, // Replace with your desired icon
                    //                   color: Color(0xFFF29F3D), // Set icon color
                    //                   size: 40,
                    //                   // DecoratedBox(
                    //                   //   decoration: BoxDecoration(
                    //                   //     border: Border(bottom: BorderSide(color: Color.fromARGB(232, 244, 195, 138), width: 2.0)), // Add border to the bottom side
                    //                   //   ),
                    //                 ),
                    //               ],
                    //            ),
                    //          ),
                    //         ),
                    //       ),
                    //     ),

                    //   if (showSecondText)
                    //   Container(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // Add navigation functionality
                    //     },
                    //     child: Padding(
                    //       padding: EdgeInsets.only(right: 20, top: 0, left: 20),
                    //       child: Text(
                    //         'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم',
                    //         textDirection: TextDirection.rtl,
                    //         style: TextStyle(
                    //           color: Color(0xFFF29F3D),
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
///////////////////////////////////////////////////////////

/////////////////////////////خيارات//////////////////////////////
                    // SizedBox(height: 20),
                    // Container(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         right: 30,
                    //         top: 5,
                    //         left: 5), // Add your desired padding
                    //     child: Text(
                    //       textDirection: TextDirection.rtl,
                    //       'شارك معنا, وانضم الى عائلتنا!',
                    //       style: TextStyle(
                    //         color: Color(0xFF9BCB3D), // Set hyperlink color
                    //         fontSize: 25,
                    //         // decoration: TextDecoration.underline,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   // Inner container properties
                    //   // margin: EdgeInsets.all(20), // Add margin for spacing
                    //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF9BCB3D),
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // Add navigation functionality
                    //     },
                    //     child: Padding(
                    //       padding: EdgeInsets.only(
                    //           right: 15,
                    //           top: 5,
                    //           left: 5), // Add your desired padding
                    //       child: Text(
                    //         textDirection: TextDirection.rtl,
                    //         'دورات وانشطة',
                    //         style: TextStyle(
                    //           color: Colors.white, // Set hyperlink color
                    //           fontSize: 20,
                    //           // decoration: TextDecoration.underline,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // SizedBox(height: 5),
                    // Container(
                    //   // Inner container properties
                    //   // margin: EdgeInsets.all(20), // Add margin for spacing
                    //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF9BCB3D),
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // Add navigation functionality
                    //     },
                    //     child: Padding(
                    //       padding: EdgeInsets.only(
                    //           right: 15,
                    //           top: 5,
                    //           left: 5), // Add your desired padding
                    //       child: Text(
                    //         textDirection: TextDirection.rtl,
                    //         'تطوع معنا',
                    //         style: TextStyle(
                    //           color: Colors.white, // Set hyperlink color
                    //           fontSize: 20,
                    //           // decoration: TextDecoration.underline,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    /////////////////////////////
                    // SizedBox(height: 5),
                    // Container(
                    //   // Inner container properties
                    //   // margin: EdgeInsets.all(20), // Add margin for spacing
                    //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF9BCB3D),
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child:GestureDetector(
                    //     onTap: () {
                    //       // Add navigation functionality
                    //     },
                    //       child: Padding(
                    //         padding:  EdgeInsets.only(right: 15, top: 5, left: 5), // Add your desired padding
                    //         child: Text(
                    //           textDirection: TextDirection.rtl,
                    //           'انجازات المركز',
                    //           style: TextStyle(
                    //             color: Colors.white, // Set hyperlink color
                    //             fontSize: 20,
                    //         // decoration: TextDecoration.underline,
                    //       ),
                    //     ),
                    //   ),
                    //   ),
                    // ),

                    // SizedBox(height: 5),
                    // Container(
                    //   // Inner container properties
                    //   // margin: EdgeInsets.all(20), // Add margin for spacing
                    //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF9BCB3D),
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child:GestureDetector(
                    //     onTap: () {
                    //       // Add navigation functionality
                    //     },
                    //       child: Padding(
                    //         padding:  EdgeInsets.only(right: 15, top: 5, left: 5), // Add your desired padding
                    //         child: Text(
                    //           textDirection: TextDirection.rtl,
                    //           'شراكاتنا مع الجامعات',
                    //           style: TextStyle(
                    //             color: Colors.white, // Set hyperlink color
                    //             fontSize: 20,
                    //         // decoration: TextDecoration.underline,
                    //       ),
                    //     ),
                    //   ),
                    //   ),
                    // ),

                    // SizedBox(height: 5),
                    // Container(
                    //   // Inner container properties
                    //   // margin: EdgeInsets.all(20), // Add margin for spacing
                    //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF9BCB3D),
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child:GestureDetector(
                    //     onTap: () {
                    //       // Add navigation functionality
                    //     },
                    //       child: Padding(
                    //         padding:  EdgeInsets.only(right: 15, top: 5, left: 5), // Add your desired padding
                    //         child: Text(
                    //           textDirection: TextDirection.rtl,
                    //           'شاركنا ب اقتراحاتك',
                    //           style: TextStyle(
                    //             color: Colors.white, // Set hyperlink color
                    //             fontSize: 20,
                    //         // decoration: TextDecoration.underline,
                    //       ),
                    //     ),
                    //   ),
                    //   ),
                    // ),
///////////////////////////////////////////////////////////

////////////////////////footer////////////////////////////
                    // SizedBox(height: 250),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Color(
                    //         0xFF9BCB3D), // Set the background color to orange
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         right: 20, top: 50, left: 20, bottom: 150),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             GestureDetector(
                    //               onTap: () {
                    //                 // Add navigation functionality
                    //               },
                    //               child: Text(
                    //                 'First Link 1',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 16,
                    //                   decoration: TextDecoration.underline,
                    //                 ),
                    //               ),
                    //             ),
                    //             GestureDetector(
                    //               onTap: () {
                    //                 // Add navigation functionality
                    //               },
                    //               child: Text(
                    //                 'First Link 2',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 16,
                    //                   decoration: TextDecoration.underline,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             GestureDetector(
                    //               onTap: () {
                    //                 // Add navigation functionality
                    //               },
                    //               child: Text(
                    //                 'Second Link 1',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 16,
                    //                   decoration: TextDecoration.underline,
                    //                 ),
                    //               ),
                    //             ),
                    //             GestureDetector(
                    //               onTap: () {
                    //                 // Add navigation functionality
                    //               },
                    //               child: Text(
                    //                 'Second Link 2',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 16,
                    //                   decoration: TextDecoration.underline,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
/////////////////////////////////////////////////////
                    // Container(
                    //   child:GestureDetector(
                    //     onTap: () {
                    //       // Add navigation functionality
                    //     },
                    //       child: Padding(
                    //         padding:  EdgeInsets.only(right: 20, top: 0, left: 0), // Add your desired padding
                    //         child: Text(
                    //           textDirection: TextDirection.rtl,
                    //           'مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم',
                    //           style: TextStyle(
                    //             color: Color(0xFFF29F3D), // Set hyperlink color
                    //             fontSize: 17,
                    //             fontWeight: FontWeight.bold,
                    //             // decoration: TextDecoration.underline,
                    //       ),
                    //     ),
                    //   ),
                    //   ),
                    // ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
