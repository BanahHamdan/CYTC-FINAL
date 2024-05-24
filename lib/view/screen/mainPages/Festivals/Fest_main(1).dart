// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:cytc/view/screen/bottomBarPages/buttonBar.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FestivalsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FestivalsPage extends StatefulWidget {
  @override
  _FestivalsPageState createState() => _FestivalsPageState();
}

class _FestivalsPageState extends State<FestivalsPage> {
  List<Case> cases = [
    Case(
      caseNumber: "مهرجان الربيع",
      description:
          "مهرجان الربيع هو مهرجان يقام سنويا للاحتفال في فصل الربيع وتفريح الاطفال, اذ يتواجد معنا مهرجين وامكانية الرسم على وجوه الاطفال",
      location: "متنزه جمال عبد الناصر",
      date: "20 مايو 2024",
      time: "5:00 - 8:00 PM",
      // donationStatus: "80 ر.ق من 63,000 ر.ق",
      // progressValue: 0.0,
      // supportersCount: 4,
      // remainingAmount: "62,920 ر.ق",
    ),
    // Case(
    //   caseNumber: "204133",
    //   description:
    //       "الحالة شاب في مقتبل العمر، يعمل براتب ثابت ولكن ترهقه الديون والالتزامات الشهرية فهو يعول والدته وإخوانه مما يجعله غير منتفع براتبه...",
    //   location: "داخل قطر",
    //   date: "21 مايو 2024",
    //   time: "10:30 AM",
    //   donationStatus: "32,329 ر.ق من 151,200 ر.ق",
    //   progressValue: 0.2,
    //   supportersCount: 119,
    //   remainingAmount: "118,871 ر.ق",
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105.0), // Set the height you want
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ 
                  Color(0xFFFBE66F),  //0xFFffe145
                  Color(0xFFffe145),  //0xFFFFD700   اعتمدي اللي محطوط مش الكومنت
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
                                    builder: (context) =>
                                        bar(userId: null, userRole: null),
                                  ),
                                );
                              },
                            ),
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
                          'تعرف على الاحتفالات والمهرجانات القادمة',
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
                                padding: const EdgeInsets.only(right: 16.0),
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
                        color:
                            Color.fromARGB(255, 247, 250, 252).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
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
                              // Search functionality
                            },
                          ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ResultCount(count: cases.length),
            ...cases.map((caseItem) {
              return CaseCard(caseItem: caseItem);
            }).toList(),
            SizedBox(height: 20),
            // QuickDonateButton(),
          ],
        ),
      ),
    );
  }
}

class ResultCount extends StatelessWidget {
  final int count;

  ResultCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.emoji_emotions,
            color: Color(0xFFf3c344),
            size: 24,
          ),
          SizedBox(width: 8),
          Text(
            'لا تتردد في القدوم ومشاركتنا في هذه الانشطة',
            // '$count عدد المهرجانات والاحتفالات المتاحة حاليا هو',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Amiri',
            ),
          ),
        ],
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Text(
//           'لا تتردد في القدوم مشاركتنا في هذه الانشطة',
//           textAlign: TextAlign.right,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Amiri',
//           ),
//         ),
//         SizedBox(width: 8), // Add some spacing between the text and the icon
//         Icon(
//           Icons.emoji_emotions,
//           color: Colors.amber,
//           size: 24,
//         ),
//       ],
//     ),
//   );
// }

class Case {
  final String caseNumber;
  final String description;
  final String location;
  final String date;
  final String time;
  // final String donationStatus;
  // final double progressValue;
  // final int supportersCount;
  // final String remainingAmount;

  Case({
    required this.caseNumber,
    required this.description,
    required this.location,
    required this.date,
    required this.time,
    // required this.donationStatus,
    // required this.progressValue,
    // required this.supportersCount,
    // required this.remainingAmount,
  });
}

class CaseCard extends StatelessWidget {
  final Case caseItem;

  CaseCard({required this.caseItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/homePage/fest1.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  // child: ImageIcon(
                  //   AssetImage('assets/homePage/fest1.jpg'),
                  //   size: 50,
                  // ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'حالة رقم : ${caseItem.caseNumber}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Amiri',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Text(
              caseItem.description,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Amiri',
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.right,
                      caseItem.location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.location_on, color: Color(0xFFf3c344), size: 16),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.right,
                      caseItem.date,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.calendar_today,
                        color: Color(0xFFf3c344), size: 16),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.right,
                      caseItem.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.access_time, color: Color(0xFFf3c344), size: 16),
                  ],
                ),
              ],
            ),

            // SizedBox(height: 10),
            // Wrap(
            //   spacing: 8,
            //   runSpacing: 4,
            //   children: [
            //     Chip(
            //       label: Text(
            //         'محدود الدخل',
            //         style: TextStyle(color: Colors.white, fontFamily: 'Amiri'),
            //       ),
            //       backgroundColor: Colors.grey,
            //     ),
            //     Chip(
            //       label: Text(
            //         'الرعاية الاجتماعية',
            //         style: TextStyle(color: Colors.white, fontFamily: 'Amiri'),
            //       ),
            //       backgroundColor: Colors.lightBlue,
            //     ),
            //     Chip(
            //       label: Text(
            //         'بقبل الزكاة',
            //         style: TextStyle(color: Colors.white, fontFamily: 'Amiri'),
            //       ),
            //       backgroundColor: Colors.red,
            //     ),
            //   ],
            // ),
            SizedBox(height: 10),
            // Row(
            //   children: [
            //     Expanded(
            //       child: LinearProgressIndicator(
            //         value: caseItem.progressValue,
            //         backgroundColor: Colors.grey[300],
            //         color: Colors.amber,
            //       ),
            //     ),
            //     SizedBox(width: 10),
            //     Text(
            //       caseItem.donationStatus,
            //       style: TextStyle(fontFamily: 'Amiri'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 10),
            // Text(
            //   'من ${caseItem.supportersCount} متبرع',
            //   style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Amiri'),
            //   textAlign: TextAlign.right,
            // ),
            // SizedBox(height: 5),
            // Text(
            //   caseItem.remainingAmount,
            //   style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Amiri'),
            //   textAlign: TextAlign.right,
            // ),
          ],
        ),
      ),
    );
  }
}

// class QuickDonateButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: ElevatedButton.icon(
//         onPressed: () {},
//         icon: Icon(Icons.rocket),
//         label: Text('التبرع السريع', style: TextStyle(fontFamily: 'Amiri')),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.pink, // background
//           foregroundColor: Colors.white, // foreground
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         ),
//       ),
//     );
//   }
// }

