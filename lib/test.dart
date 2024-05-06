import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryPage(),
    );
  }
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoryBox(
            categoryName: 'Category 1',
            imagePath: 'assets/category1_image.jpg',
            onTap: () {
              // Add navigation functionality
              print('Category 1 clicked');
            },
          ),
          CategoryBox(
            categoryName: 'Category 2',
            imagePath: 'assets/category2_image.jpg',
            onTap: () {
              // Add navigation functionality
              print('Category 2 clicked');
            },
          ),
          CategoryBox(
            categoryName: 'Category 3',
            imagePath: 'assets/category3_image.jpg',
            onTap: () {
              // Add navigation functionality
              print('Category 3 clicked');
            },
          ),
          CategoryBox(
            categoryName: 'Category 4',
            imagePath: 'assets/category4_image.jpg',
            onTap: () {
              // Add navigation functionality
              print('Category 4 clicked');
            },
          ),
          CategoryBox(
            categoryName: 'Category 5',
            imagePath: 'assets/category5_image.jpg',
            onTap: () {
              // Add navigation functionality
              print('Category 5 clicked');
            },
          ),
        ],
      ),
    );
  }
}

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
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              categoryName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
