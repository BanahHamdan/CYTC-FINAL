// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
              height: 150,  // Adjust height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4BB29D),
                    Color(0xFF1E7F6B),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Add functionality for profile icon
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Add functionality for cart icon
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'برامجنا',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: textEditingController,
                        cursorColor: Color(0xFF071533),
                        decoration: InputDecoration(
                          hintText: '...بحث بأقسام البرامج',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Amiri',
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 colors: [
  //                   Color(0xFF4BB29D),
  //                   Color(0xFF1E7F6B),
  //                 ],
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(0.3),
  //                   spreadRadius: 2,
  //                   blurRadius: 10,
  //                   offset: Offset(0, 3),
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
  //                                   shape: BoxShape.circle,
  //                                   color: Color(0xFFFFB44C),
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
  //                                 width: 35,
  //                                 height: 35,
  //                                 decoration: BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                   border: Border.all(
  //                                       color: Colors.white, width: 2),
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
  //                     Text(
  //                       'شارك معنا وانضم الى عائلتنا',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                         fontFamily: 'Amiri',
  //                       ),
  //                     ),
  //                     SizedBox(height: 5),
  //                     Container(
  //                       margin: EdgeInsets.symmetric(horizontal: 50),
  //                       decoration: BoxDecoration(
  //                         color: Color(0xFFE8EBED),
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       child: TextField(
  //                         textAlign: TextAlign.right,
  //                         controller: textEditingController,
  //                         cursorColor: Color(0xFF071533),
  //                         decoration: InputDecoration(
  //                           hintText: '... ابحث',
  //                           hintStyle: TextStyle(
  //                             color: Colors.grey,
  //                             fontFamily: 'Amiri',
  //                           ),
  //                           prefixIcon: Icon(
  //                             Icons.search,
  //                             color: Color(0xFF071533),
  //                           ),
  //                           border: InputBorder.none,
  //                           suffixIcon: IconButton(
  //                             icon: Icon(
  //                               Icons.clear,
  //                               color: Color(0xFF071533),
  //                             ),
  //                             onPressed: () {
  //                               setState(() {
  //                                 textEditingController.clear();
  //                               });
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildListItem('الحملات', Icons.campaign),
                _buildListItem('الهدية', Icons.card_giftcard),
                _buildListItem('التبرع الدوري', Icons.autorenew),
                _buildListItem('الزكاة', Icons.attach_money),
                _buildListItem('الأضاحي', Icons.local_dining),
                _buildListItem('التبرع بالدم', Icons.bloodtype),
                _buildListItem('غراس', Icons.nature_people),
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
        leading: Icon(icon, color: Color(0xFF071533)),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Amiri',
            color: Color(0xFF071533),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF071533)),
        onTap: () {
          // Add navigation or functionality here
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
  //                   color: Colors.black.withOpacity(0.3),
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