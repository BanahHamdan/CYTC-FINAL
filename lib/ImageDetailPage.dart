// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final String topicText;
  final String imagePath;

  const ImageDetailPage({Key? key, required this.topicText, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topicText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(topicText, style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
