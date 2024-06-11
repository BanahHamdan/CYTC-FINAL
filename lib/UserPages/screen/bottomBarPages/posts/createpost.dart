import 'dart:io'; // Import for File operations
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cytc/linkapi.dart';

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
    // var response = await http.post(Uri.parse(LinkApi.login);
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
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              IconButton(
                onPressed: uploadImage,
                icon: Icon(Icons.camera_alt),
              ),
              imageUrl.isNotEmpty
                  ? Image.network(imageUrl)
                  : Container(), // Show the uploaded image or an empty container
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: createPost,
                child: Text('Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
