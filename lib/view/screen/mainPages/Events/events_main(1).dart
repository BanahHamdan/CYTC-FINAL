// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/view/homePage.dart';
import 'package:cytc/view/screen/mainPages/Events/events_details(3).dart';
import 'package:cytc/view/screen/mainPages/Events/events_list(2).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eventsPage extends StatefulWidget {
  const eventsPage({super.key});

  @override
  _eventsPageState createState() => _eventsPageState();
}

class _eventsPageState extends State<eventsPage> {
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color(0xFFF9F7F2),
  //     body: Column(
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.vertical(
  //             bottom: Radius.circular(20),
  //           ),
  //           child: Container(
  //             height: 150, // Adjust height as needed
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 colors: [
  //                   Color(0xFFffe145), //0xFFf3c344
  //                   Color(0xFFffd700),
  //                 ],
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Color(0xFF071533).withOpacity(0.3),
  //                   spreadRadius: 2,
  //                   blurRadius: 10,
  //                   offset: Offset(0, 3),
  //                 ),
  //               ],
  //             ),
  //             child: SafeArea(
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         IconButton(
  //                           icon: Icon(
  //                             Icons.person,
  //                             color: Colors.white,
  //                           ),
  //                           onPressed: () {
  //                             // Add functionality for profile icon
  //                           },
  //                         ),
  //                         IconButton(
  //                           icon: Icon(
  //                             Icons.shopping_cart,
  //                             color: Colors.white,
  //                           ),
  //                           onPressed: () {
  //                             // Add functionality for cart icon
  //                           },
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: 10),
  //                   Text(
  //                     'برامجنا',
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.bold,
  //                       fontFamily: 'Amiri',
  //                     ),
  //                   ),
  //                   SizedBox(height: 10),
  //                   Container(
  //                     margin: EdgeInsets.symmetric(horizontal: 16),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: TextField(
  //                       controller: textEditingController,
  //                       cursorColor: Color(0xFF071533),
  //                       decoration: InputDecoration(
  //                         hintText: '...بحث بأقسام البرامج',
  //                         hintStyle: TextStyle(
  //                           color: Colors.grey,
  //                           fontFamily: 'Amiri',
  //                         ),
  //                         prefixIcon: Icon(
  //                           Icons.search,
  //                           color: Colors.grey,
  //                         ),
  //                         border: InputBorder.none,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F7F2),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFBE66F), //0xFFf3c344
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homePage(
                                              userId: null,
                                              userRole: null,
                                            )),
                                  );
                                },
                              ),
                              // SizedBox(width: 0),
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
                            'شارك معنا وانضم الى عائلتنا',
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
                                  padding: const EdgeInsets.only(
                                      right:
                                          16.0), // Adjust the value as needed
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
                                        // fit: BoxFit.cover,
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
                          color: Color.fromARGB(255, 247, 250, 252)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          textAlign: TextAlign.right,
                          controller: textEditingController,
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
                                //search func
                              },
                            ),
                            // prefixIcon: Icon(
                            //   Icons.search,
                            //   color: Color(0xFF071533),
                            //   size: 20,
                            // ),
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

          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildListItem('دورات', Icons.add),
                _buildListItem('ورش عمل ولقاءات توعوية', Icons.work),
                _buildListItem('مخيمات صيفية', Icons.emoji_nature),
                _buildListItem('مبادرات شبابية', Icons.volunteer_activism),
                // _buildListItem('الأضاحي', Icons.local_dining),
                // _buildListItem('التبرع بالدم', Icons.bloodtype),
                // _buildListItem('غراس', Icons.nature_people),
              ],
            ),
          ),
          // BottomNavigationBar(
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'الرئيسية',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.favorite),
          //       label: 'وقفا إحسان',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.add_circle_outline),
          //       label: 'التبرع السريع',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.grid_view),
          //       label: 'فرص التبرع',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.apps),
          //       label: 'برامجنا',
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        // Arrow icon on the left side
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 15),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text aligned to the right
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
            ),
            SizedBox(width: 10), // Space between icon and text
            // Icon with grey circle background
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE0E0E0),
              ),
              padding: EdgeInsets.all(
                  8), // Adjust padding to make the circle bigger or smaller
              child: Icon(icon, color: Color(0xFF071533)),
            ),
          ],
        ),
        onTap: () {
          // Navigate to different pages based on the title clicked
          // For example:
          if (title == 'دورات') {
            // Navigate to the corresponding page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => eventsList()),
            );
          }
          //else if (title == 'ورش عمل ولقاءات توعوية') {
          //   // Navigate to the corresponding page
          // } else if (title == 'مخيمات صيفية') {
          //   // Navigate to the corresponding page
          // } else if (title == 'مبادرات شبابية') {
          //   // Navigate to the corresponding page
          // }
        },
      ),
    );
  }

  //    @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color.fromARGB(255, 249, 247, 242),
  //     body: Column(
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.vertical(
  //             bottom: Radius.circular(20),
  //           ),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 colors: [Color.fromARGB(255, 237, 209, 133), Color(0xFFf3c344)],
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Color(0xFF071533).withOpacity(0.3),
  //                   spreadRadius: 2,
  //                   blurRadius: 10,
  //                   offset: Offset(0, 3), // Shadow position
  //                 ),
  //               ],
  //             ),
  //             child: SafeArea(
  //               child: Padding(
  //                 padding: const EdgeInsets.all(10),
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             IconButton(
  //                               icon: Icon(
  //                                 Icons.arrow_back,
  //                                 color: Colors.white,
  //                               ),
  //                               onPressed: () {
  //                                 // Add functionality for back button
  //                               },
  //                             ),
  //                             SizedBox(width: 5),
  //                             IconButton(
  //                               icon: Icon(
  //                                 Icons.menu,
  //                                 color: Colors.white,
  //                               ),
  //                               onPressed: () {
  //                                 // Add functionality for burger menu
  //                               },
  //                             ),
  //                           ],
  //                         ),
  //                         Text(
  //                       'شارك معنا وانضم الى عائلتنا',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                         fontFamily: 'Amiri',
  //                       ),
  //                     ),
  //                         Row(
  //                           children: [
  //                             IconButton(
  //                               onPressed: () {
  //                                 // Add functionality for notification icon
  //                               },
  //                               padding: EdgeInsets.zero,
  //                               icon: Container(
  //                                 padding: EdgeInsets.all(4),
  //                                 decoration: BoxDecoration(
  //                                   // color: Color(0xFFEC8F5E),
  //                                   shape: BoxShape.circle,
  //                                 ),
  //                                 child: Icon(
  //                                   Icons.notifications,
  //                                   color: Colors.white,
  //                                   size: 20,
  //                                 ),
  //                               ),
  //                             ),
  //                             GestureDetector(
  //                               onTap: () {
  //                                 // Add functionality to navigate to profile page
  //                               },
  //                               child: Container(
  //                                 // margin: EdgeInsets.only(right: 10),
  //                                 width: 35,
  //                                 height: 35,
  //                                 decoration: BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                   border: Border.all(color: Colors.white, width: 2),
  //                                   image: DecorationImage(
  //                                     image: AssetImage('assets/banah.jpg'),
  //                                     fit: BoxFit.cover,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 10),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Expanded(
  //                           child: Container(
  //                             margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
  //                             decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(10),
  //                             ),
  //                             child: TextField(
  //                               textAlign: TextAlign.right,
  //                               controller: textEditingController,
  //                               cursorColor: Color(0xFF071533),
  //                               decoration: InputDecoration(
  //                                 hintText: '... ابحث',
  //                                 hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Amiri',),
  //                                 prefixIcon: Icon(Icons.search, color: Color(0xFF071533)),
  //                                 border: InputBorder.none,
  //                                 suffixIcon: IconButton(
  //                                   icon: Icon(Icons.clear, color: Color(0xFF071533)),
  //                                   onPressed: () {
  //                                     setState(() {
  //                                       textEditingController.clear();
  //                                     });
  //                                   },
  //                                 ),
  //                               ),
  //                               onTap: () {
  //                                 setState(() {
  //                                   isSearchBarVisible = true;
  //                                 });
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 10),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         // Other content of your page goes here
  //       ],
  //     ),
  //   );
  // }
}


// colors: [Color.fromARGB(255, 237, 209, 133), Color(0xFFf3c344)],