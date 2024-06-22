// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItemData> notifications = [];

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  void fetchNotifications() {
    // Simulate fetching data from a backend
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        notifications = [
          NotificationItemData(
            title: 'المنتجات الجديدة وصلت',
            subtitle: 'اكتشف المنتجات الجديدة الآن!',
            imagePath: 'assets/Logo.png',
          ),
          NotificationItemData(
            title: 'تم شحن الطلب',
            subtitle: 'تم شحن طلبك.',
            imagePath: 'assets/Logo.png',
          ),
          NotificationItemData(
            title: 'مرحبًا بك في Aurora',
            subtitle: 'التجارة الإلكترونية.',
            imagePath: 'assets/Logo.png',
          ),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'الإشعارات',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF071533),
            fontFamily: 'Amiri',
            fontSize: 23,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
           IconButton(
            icon: Icon(
              LineAwesomeIcons.angle_right_solid,
              color: Color(0xFF071533),
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: notifications.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF071533),
                ),
              )
            : ListView.separated(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationItem(
                    title: notification.title,
                    subtitle: notification.subtitle,
                    imagePath: notification.imagePath,
                  );
                },
                separatorBuilder: (context, index) => Divider(color: Colors.grey),
              ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 40, height: 40),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF071533),
                  fontFamily: 'Amiri',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Amiri',
                  fontSize: 14,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NotificationItemData {
  final String title;
  final String subtitle;
  final String imagePath;

  NotificationItemData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}
