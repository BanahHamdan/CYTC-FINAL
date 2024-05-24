// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cytc/view/screen/mainPages/Events/events_main(1).dart';
import 'package:flutter/material.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({super.key});

  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F7F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          alignment: Alignment.topRight,
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => eventsPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'شارك معنا في انشطتنا',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'اسم النشاط',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFf3c344),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      SizedBox(height: 5),
                      // Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: [
                          // Image.asset(
                          //   'assets/logo.png',
                          //   height: 30,
                          // ),
                          Text(
                            textAlign: TextAlign.right,
                            'دورة اسعاف اولي',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontFamily: 'Amiri',
                            ),
                          ),
                        // ],
                      // ),
                      Divider(thickness: 1, height: 20),
                      Text(
                        'في هذه الدورة سيتم اعطاء مهارات الاسعاف الاساسية والمهمة بحيث مع نهايتها سيكون الطالب قادر على ان يقوم بالاسعاف الاولي بالشكل الصحيح. وسيتم تقسيم ساعات الدروة الى 4 اسابيع بمعدل يوم واحد كل اسبوع بحيث سيتم اخد 4 ساعات متواصلة في اليوم الواحد وستبدأ من الساعة 11 صباحا الى الساعة 3 ظهرا ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF071533),
                          fontFamily: 'Amiri',
                        ),
                      ),
                      Divider(thickness: 1, height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                          // _buildInfoColumn('معلومات عن النشاط', 'المواطنون'),
                          _buildInfoColumn('الحد الاقصى لعدد المشاركين', 'فرداً 16'),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildStatCard('اعمار المشاركين في هذا النشاط', ' 15-25', 'بين الاعمار التالية', Icons.person),
                  _buildStatCard('تاريخ بداية وانتهاء النشاط', '16/5 - 20/7', 'يوم', Icons.date_range),
                  // _buildStatCard('آخر عملية تبرع قبل', '1', 'ثانية', Icons.timer),
                  // _buildStatCard('عدد المستفيدين', '4', 'المستهدف 16 مستفيد', Icons.group),
                ],
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the register button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF071533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text(
                      'سجل الآن',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Amiri',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          // textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFf3c344),
            fontFamily: 'Amiri',
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          // textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF071533),
            fontFamily: 'Amiri',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String count, String unit, IconData icon) {
    // SizedBox(height: 30);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(
          //       color: Color(0xFFf3c344), // Yellow border color
          //       width: 2,
          //     ),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
              // child: 
              Icon(icon, color: Color(0xFFf3c344), size: 30),
          //   ),
          // ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF071533),
                fontFamily: 'Amiri',
              ),
            ),
            SizedBox(height: 5),
            Text(
              count,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFf3c344),
                fontFamily: 'Amiri',
              ),
            ),
            Text(
              unit,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFf3c344),
                fontFamily: 'Amiri',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
