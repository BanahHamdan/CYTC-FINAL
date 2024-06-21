// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class InterestsPage extends StatefulWidget {
//   @override
//   _InterestsPageState createState() => _InterestsPageState();
// }

// class _InterestsPageState extends State<InterestsPage> {
//   List<bool> _isSelected = [false, false, false, false, false, false];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfffafafa),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'قم بتحديد اهتماماتك',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533)
//                 ),
//               ),
//               Text(
//                 'بناء على اختياراتك سيتم تحديد اهتماماتك لنرسل لك اشعارات تخص ما قمت باختياره',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533)
//                 ),
//               ),
//               SizedBox(height: 10),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                   childAspectRatio: 3 / 2,
//                 ),
//                 itemCount: 6,
//                 itemBuilder: (context, index) {
//                   return _buildCategoryCard(
//                     'Category ${index + 1}',
//                     'assets/image${index + 1}.png',
//                     index,
//                   );
//                 },
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Add your onPressed code here!
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF071533),
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'استمر',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: 'Amiri',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryCard(String title, String imagePath, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isSelected[index] = !_isSelected[index];
//         });
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         elevation: 5,
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: AssetImage(imagePath),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: _isSelected[index]
//                     ? Colors.yellow.withOpacity(0.5)
//                     : Colors.black.withOpacity(0.3),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '.././UserPages/screen/bottomBarPages/buttonBar.dart';

class InterestsPage extends StatefulWidget {
  final String userId;

  const InterestsPage({super.key, required this.userId});
  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  List<bool> _isSelected = [];
  List<Map<String, String>> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/interest/all'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        _categories = data
            .map((item) => {
                  "id": item['_id'].toString(),
                  "name": item['interestName'].toString()
                })
            .toList();
        _isSelected = List<bool>.filled(_categories.length, false);
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> _submitInterests() async {
    List<String> selectedInterests = [];
    for (int i = 0; i < _isSelected.length; i++) {
      if (_isSelected[i]) {
        selectedInterests.add(_categories[i]['id']!);
      }
    }

    if (selectedInterests.isEmpty) {
      _showSelectionDialog();
      return;
    }

    for (String interestId in selectedInterests) {
      var reqBody = {"userId": widget.userId, "interestId": interestId};

      final response = await http.post(
        Uri.parse('http://localhost:9999/interest/user-interest/add'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        print('Failed to add interest: $interestId');
        // Optionally, handle this error with a message to the user
      }
    }

    // Navigate to the bar page after adding interests
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => bar(
          userId: widget.userId,
          userRole: "0", // Pass the appropriate user role if needed
          initialIndex: 4, // Set the initial index for the bottom bar
        ),
      ),
    );

    // Optionally, show a success message before navigating
    print('Interests added successfully');
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'خطأ',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Amiri',
              color: Color(0xFF071533),
            ),
          ),
          content: Text(
            'يجب اختيار شيء واحد على الأقل',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Amiri',
              color: Color(0xFF071533),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'موافق',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20),
              Text(
                'معرف المستخدم: ${widget.userId}',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'قم بتحديد اهتماماتك',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
              Text(
                'بناء على اختياراتك سيتم تحديد اهتماماتك لنرسل لك اشعارات تخص ما قمت باختياره',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                ),
              ),
              SizedBox(height: 10),
              _categories.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3 / 2,
                      ),
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        return _buildCategoryCard(
                          _categories[index]['name']!,
                          'assets/image${index % 6 + 1}.png', // Example image paths
                          index,
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator()),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitInterests,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF071533),
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'استمر',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected[index] = !_isSelected[index];
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _isSelected[index]
                    ? Colors.yellow.withOpacity(0.5)
                    : Colors.black.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}