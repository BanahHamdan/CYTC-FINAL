import 'dart:io'; // Import for File operations
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('posts_list');
  String imageUrl = '';

  Future<void> uploadImage() async {
    if (kIsWeb) {
      // For web
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null && result.files.single.bytes != null) {
        String uniqueFileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('postsImages');
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);

        await referenceImageToUpload.putData(
          result.files.single.bytes!,
          SettableMetadata(contentType: 'image/jpeg'), // Set content type
        );

        imageUrl = await referenceImageToUpload.getDownloadURL();
        setState(() {}); // Update the state to reflect the new image URL
      }
    } else {
      // For Android/iOS
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

      if (file != null) {
        String uniqueFileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('postsImages');
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);

        await referenceImageToUpload.putFile(
          File(file.path),
          SettableMetadata(contentType: 'image/jpeg'), // Set content type
        );

        imageUrl = await referenceImageToUpload.getDownloadURL();
        setState(() {}); // Update the state to reflect the new image URL
      }
    }
  }

  Future<void> createPost() async {
    final String apiUrl = "http://localhost:9999/posts/create";

    if (key.currentState?.validate() ?? false) {
      Map<String, dynamic> postData = {
        'title': titleController.text,
        'description': descriptionController.text,
        'imageUrl': imageUrl,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 201) {
        // If the server returns a created response, navigate back with the created post data
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        Navigator.pop(context, {
          'id': responseData['result']['_id'],
          'title': titleController.text,
          'description': descriptionController.text,
          'imageUrl': imageUrl,
        });
      } else {
        // Handle error response
        print('Failed to create post: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(LineAwesomeIcons.times_solid, color: Color(0xFF071533)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'قم بإنشاء منشور جديد',
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
                        TextFormField(
                          controller: titleController,
                          textAlign: TextAlign.right,
                          cursorColor: Color(0xFFffe145),
                          style: TextStyle(fontFamily: 'Amiri'),
                          decoration: InputDecoration(
                            labelText: 'العنوان',
                            hintStyle: TextStyle(fontFamily: 'Amiri'),
                            labelStyle: TextStyle(fontFamily: 'Amiri'),
                            alignLabelWithHint: true,
                            hintTextDirection: TextDirection.rtl,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFffe145), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال العنوان';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          style: TextStyle(fontFamily: 'Amiri'),
                          controller: descriptionController,
                          textAlign: TextAlign.right,
                          cursorColor: Color(0xFFffe145),
                          decoration: InputDecoration(
                            labelText: 'الوصف',
                            hintStyle: TextStyle(fontFamily: 'Amiri'),
                            labelStyle: TextStyle(fontFamily: 'Amiri'),
                            alignLabelWithHint: true,
                            hintTextDirection: TextDirection.rtl,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFffe145), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال الوصف';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: uploadImage,
                            icon: Icon(Icons.camera_alt,
                                color: Color(0xFF071533)),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        imageUrl.isNotEmpty
                            ? Image.network(imageUrl)
                            : Container(), // Show the uploaded image or an empty container
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: createPost,
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
                                'إنشاء منشور',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
