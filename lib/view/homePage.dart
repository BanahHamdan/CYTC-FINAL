// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sort_child_properties_last
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cytc/view/calender.dart';
import 'package:cytc/view/chat.dart';
import 'package:cytc/view/posts.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();

  homePage({Key? key}) : super(key: key);
}

///////////////text with icon in the emergensies//////////////////
Widget buildTextWithIcon(
    {required String text, IconData? icon, required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      // Navigate to the desired page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homePage()),
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end, // Align icon and text
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        SizedBox(width: 8), // Add some spacing between icon and text
        Icon(
          icon,
          color: Color(0xFFF3B664), // Icon color
          size: 24, // Icon size
        ),
      ],
    ),
  );
}

//////////////////////ل اول وحدة///////////////////////
class CategoryBoxFirst extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryBoxFirst({
    required this.categoryName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        // width: 180,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF9FBB73)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Directionality(
              textDirection:
                  TextDirection.rtl, // Set text direction to right-to-left
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////للاربعة اللي تحت/////////////////////////////
class CategoryBox extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryBox({
    required this.categoryName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: 180, // Adjust the width as needed
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF9FBB73)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imagePath,
              height: 130, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Location Details'),
//         ),
//         body: LocationDetails(),
//       ),
//     );
//   }
// }

class _homePageState extends State<homePage> {
  // int _currentPageIndex = 0;
   int selectTab = 3; // Set default selected tab to homePage
  late Widget selectPageView;

  @override
  void initState() {
    super.initState();
    selectPageView = homePage();
  }

  bool showSecondText = false;
  List<bool> _isOpen = [false, false];
// Define a TextEditingController to control the text field
  TextEditingController textEditingController = TextEditingController();
  bool isSearchBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /////////////////////////navBar///////////////////////////
      //   backgroundColor: Colors.white,
      //   color: Color(0xFFF3B664),
      //   animationDuration: Duration(milliseconds: 300),
      //   onTap: (index) {
      //     setState(() {
      //       selectTab = index; // Update selected tab
      //       // Update selected page based on tab index
      //       switch (index) {
      //         case 0:
      //           selectPageView = CalendarPage();
      //           break;
      //         case 1:
      //           selectPageView = ChatPage();
      //           break;
      //         case 2:
      //           selectPageView = ReactionPage();
      //           break;
      //         case 3:
      //           selectPageView = homePage();
      //           break;
      //       }
      //     });
      //   },
      //   items: [
      //     Icon(Icons.calendar_month, color: Colors.white),
      //     Icon(Icons.chat, color: Colors.white),
      //     Icon(Icons.add_reaction, color: Colors.white),
      //     Icon(Icons.home, color: Colors.white),
      //   ],
      //   index: selectTab, // Set initial selected tab
      // ),


      // backgroundColor: Color(0xFF9FBB73),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.white,
      //   color: Color(0xFFF3B664),
      //   animationDuration: Duration(milliseconds: 300),
        // onTap: (index) {
        //   // Navigate to the desired page based on the tapped icon
        //   switch (index) {
        //     case 0:
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (_) => CalendarPage()));
        //       break;
        //     case 1:
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (_) => ChatPage()));
        //       break;
        //     case 2:
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (_) => ReactionPage()));
        //       break;
        //     case 3:
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (_) => homePage()));
        //       break;
        //   }
        // },
        // items: [
        //   Icon(Icons.calendar_month, color: Colors.white),
        //   Icon(Icons.chat, color: Colors.white),
        //   Icon(Icons.add_reaction, color: Colors.white),
        //   Icon(Icons.home, color: Colors.white),
        // ],
      // ),
      //////////////////////////////////////////////////////////
      // appBar
      backgroundColor: Color(0xFF9FBB73),      // bottomNavigationBar: CurvedNavigationBar(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ////////app bar ,

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
                        image: AssetImage("assets/homePage/slider10.jpg"),
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
                        image: AssetImage("assets/homePage/slider1.jpg"),
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
                        image: AssetImage("assets/homePage/slider8.jpg"),
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
                        image: AssetImage("assets/homePage/slider6.jpg"),
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
                        image: AssetImage("assets/homePage/slider7.jpg"),
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

////////////////////////////////////////////////////////////

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
//////////////////////////اعلانات هامة/////////////////////
                    // Container with 'حالات طارئة' text and icon
                    Container(
                      margin: EdgeInsets.fromLTRB(220, 20, 25, 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3B664),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Align icon and text
                        children: [
                          Row(// Added Row to contain text and icon
                              children: [
                            Text(
                              '  حالات طارئة ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, 0, 10, 0), // Add padding for the icon
                              child: Icon(
                                Icons.warning, // Icon for emergency cases
                                color: Colors.white,
                              ),
                            ),
                          ]),
                          SizedBox(
                              width:
                                  10), // Add some space between the text and the next widget
                        ],
                      ),
                    ),
                    // Container with emergency texts and icons
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 35, 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildTextWithIcon(
                            text: 'مطلوب وحدات دم بشكل عاجل',
                            icon: Icons.bloodtype_outlined, // Blood icon
                            context: context,
                          ),
                          buildTextWithIcon(
                            text: 'مطلوب مسعفين بشكل طارئ',
                            icon: Icons
                                .medical_services_outlined, // Medical services icon
                            context: context,
                          ),
                        ],
                      ),
                    ),

///////////////////////////////////////////////////////

/////////////////////////volunteer of the month///////////////
                    Column(
                      children: [
                        // Volunteer of the Month
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          front: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'متطوع الشهر المثالي',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 0), // Spacer
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFF9FBB73), width: 5),
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage('assets/banah.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5), // Spacer
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(120, 0, 120, 20),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF9FBB73),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'بانه حمدان',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          back: Container(
                            // child: Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Text(
                                textAlign: TextAlign.center,
                                'متطوع الشهر المثالي هو المتطوع الذي اثبت كفائته هذا الشهر. يمكنك ان تكون المتطوع المثالي للشهر القادم! انضم الينا ولا تتردد ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
/////////////////////////////////////////////////////////////////
                    SizedBox(height: 20),
////////////////////////////من نحن///////////////////////////////

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CategoryBoxFirst(
                          categoryName: 'شارك معنا وانضم الى عائلتنا   ',
                          imagePath: 'assets/homePage/joinus2.jpg',
                          onTap: () {
                            // Add navigation functionality
                            // print('Category 1 clicked');
                          },
                        ),
                        // وحدة وحدة وكبار
                        // CategoryBox(
                        //   categoryName: 'حملات التبرع بالدم',
                        //   imagePath: 'assets/homePage/blood1.jpg',
                        //   onTap: () {
                        //     // Add navigation functionality
                        //     print('Category 2 clicked');
                        //   },
                        // ),
                        // CategoryBox(
                        //   categoryName: 'المهرجانات',
                        //   imagePath: 'assets/homePage/fest2.jpg',
                        //   onTap: () {
                        //     // Add navigation functionality
                        //     print('Category 3 clicked');
                        //   },
                        // ),
                        // CategoryBox(
                        //   categoryName: 'شاركنا اقتراحاتك وافكارك',
                        //   imagePath: 'assets/homePage/joinus3.jpg',
                        //   onTap: () {
                        //     // Add navigation functionality
                        //     print('Category 4 clicked');
                        //   },
                        // ),
                        // CategoryBox(
                        //   categoryName: 'تقديم طلب تدريب للخريجين',
                        //   imagePath: 'assets/homePage/grad.jpg',
                        //   onTap: () {
                        //     // Add navigation functionality
                        //     print('Category 5 clicked');
                        //   },
                        // ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: ListBody(
                          // padding: EdgeInsets.all(20.0),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryBox(
                                  categoryName: 'تعرف على حملات التبرع بالدم',
                                  imagePath: 'assets/homePage/blood1.jpg',
                                  onTap: () {
                                    // Add navigation functionality
                                  },
                                ),
                                CategoryBox(
                                  categoryName: 'المهرجانات',
                                  imagePath: 'assets/homePage/fest2.jpg',
                                  onTap: () {
                                    // Add navigation functionality
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10), // Spacer between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryBox(
                                  categoryName: 'شاركنا اقتراحاتك وافكارك',
                                  imagePath: 'assets/homePage/joinus3.jpg',
                                  onTap: () {
                                    // Add navigation functionality
                                  },
                                ),
                                CategoryBox(
                                  categoryName: 'تقديم طلب تدريب للخريجين',
                                  imagePath: 'assets/homePage/grad.jpg',
                                  onTap: () {
                                    // Add navigation functionality
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(height: 50),
////////////////////////////////////////////////////////////////////
                    Container(
                      color: Color(0xFF9FBB73), // Green background color
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                    'مركز تدريب الشباب المجتمعي',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5, left: 10),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    image: DecorationImage(
                                      image: AssetImage('assets/Logo.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Center(
                            child: Text(
                              "مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          // SizedBox(
                          //   height: 100, // Adjust the height as needed
                          //   child: GoogleMap(
                          //     initialCameraPosition: CameraPosition(
                          //       target: LatLng(37.7749, -122.4194),
                          //       zoom: 12,
                          //     ),
                          //     markers: {
                          //       Marker(
                          //         markerId: MarkerId('location'),
                          //         position: LatLng(37.7749, -122.4194),
                          //         infoWindow: InfoWindow(
                          //           title: 'Location',
                          //         ),
                          //       ),
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
////////////////////////////////////////////////////////////////////
                    Container(
                      color: Color.fromARGB(255, 102, 121, 72),
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.facebook), // Burger menu icon
                            onPressed: () {
                              // Add functionality for burger menu
                            },
                          ),
                          Container(
                            // margin: EdgeInsets.only(right: 20),
                            width: 35, // Adjust the width as needed
                            height: 35, // Adjust the height as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage('assets/Logo.png'),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.phone), // Burger menu icon
                            onPressed: () {
                              // Add functionality for burger menu
                            },
                          ),
                        ],
                      ),
                    ),
////////////////////////////////////////////////////////////////////

                    // //////
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       right: 20,
                    //       top: 0,
                    //       left: 20,
                    //       bottom: 0), // Adjust padding as needed
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(20.0),
                    //     child: Container(
                    //       // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    //       decoration: BoxDecoration(
                    //         border: Border(
                    //           top: BorderSide(
                    //               color: Color(0xFFF3B664), width: 2.0),
                    //           // left: BorderSide(color: Colors.white, width: 2.0),
                    //           // right:
                    //           //     BorderSide(color: Colors.white, width: 2.0),
                    //           bottom: BorderSide(
                    //               color: Color(0xFFF3B664), width: 2.0),
                    //         ),
                    //       ),
                    //       child: Directionality(
                    //         textDirection: TextDirection.rtl,
                    //         child: ExpansionPanelList(
                    //           animationDuration: Duration(seconds: 1),
                    //           dividerColor: Colors.green,
                    //           elevation: 1,
                    //           expandedHeaderPadding: EdgeInsets.all(8),
                    //           children: [
                    //             ExpansionPanel(
                    //               headerBuilder: (context, isOpen) {
                    //                 return ListTile(
                    //                   title: Text(
                    //                     "",
                    //                     style: TextStyle(
                    //                         color: Color(
                    //                             0xFFF3B664), // Change font color
                    //                         fontSize: 20.0, // Change font size
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                 );
                    //               },
                    //               body: Padding(
                    //                 padding: EdgeInsets.symmetric(
                    //                     horizontal: 16.0, vertical: 8.0),
                    //                 child: Text(
                    //                   "مركز تدريب الشباب المجتمعي التابع للاغاثة الطبية هو مركز يهتم بتنمية قدرات ومواهب الشباب عن طريق انشاء دورات وفرص تطوعية لاتاحة المجال للشباب لاظهار ابداعهم",
                    //                   style: TextStyle(
                    //                     color: Color(0xFFF3B664),
                    //                     fontSize: 17.0,
                    //                   ),
                    //                 ),
                    //               ),
                    //               isExpanded: _isOpen[0],
                    //               canTapOnHeader: true,
                    //             ),
                    //           ],
                    //           expansionCallback: (panelIndex, isOpen) {
                    //             setState(() {
                    //               _isOpen[panelIndex] = !isOpen;
                    //             });
                    //           },
                    //         ),
                    //       ),
                    //     ),
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
