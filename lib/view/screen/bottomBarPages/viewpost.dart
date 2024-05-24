//view p0st 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewPost(postId: '664cff22b5a3f535d63bcc36'), // Example postId
    );
  }
}

class ViewPost extends StatefulWidget {
  final String postId;

  const ViewPost({Key? key, required this.postId}) : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  late Post post;
  List<Comment> comments = [];
  TextEditingController commentController = TextEditingController();
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    print('Post ID received: ${widget.postId}'); // Log the post ID
    fetchPostAndComments();
  }

  Future<void> fetchPostAndComments() async {
    try {
      final postResponse = await http.get(Uri.parse('http://localhost:9999/posts/${widget.postId}'));

      print('Post response body is ');
      print(postResponse.body);

      final commentsResponse = await http.get(Uri.parse('http://localhost:9999/comments/${widget.postId}'));
      print('Comments section');
      print(commentsResponse.body);
      print('""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""');
      print(postResponse.statusCode);
      print(commentsResponse.statusCode);

      if (postResponse.statusCode == 200 && commentsResponse.statusCode == 200) {
        final postData = jsonDecode(postResponse.body);
        final commentsData = jsonDecode(commentsResponse.body);
        print('Post Data');
        print(postData);
        print('Comments Data');
        print(commentsData);

        setState(() {
          post = Post.fromJson(postData['post']); // Adjusting to get the actual post object
          print('Post  Here ');
          print(post);
          comments = (commentsData as List)
              .map((commentJson) => Comment.fromJson(commentJson))
              .toList(); // Adjusting to get the comments array

        });

        print('****comments*****');
        print(comments);
        isLoading = false;

      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  Future<void> addComment(String text) async {
    final response = await http.post(
      Uri.parse('http://localhost:9999/comments/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'postId': widget.postId,
        'userId': 'currentUserId', // Replace with actual current user ID
        'username': 'currentUsername', // Replace with actual current username
        'comment': text,
      }),
    );

    if (response.statusCode == 200) {
      final newComment = Comment.fromJson(jsonDecode(response.body));
      setState(() {
        comments.add(newComment);
      });
      commentController.clear();
    } else {
      print('Failed to add comment');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Building ViewPost page for Post ID: ${widget.postId}'); // Log the post ID

    return Scaffold(
      appBar: AppBar(
        title: Text('View Post'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
          ? Center(child: Text('Failed to load post'))
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostDetails(),
            Divider(),
            _buildCommentsSection(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Post ID: ${widget.postId}',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(post.description, style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          _buildImageWidget(),
          SizedBox(height: 8),
          Text('Post ID: ${post.id}',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildImageWidget() {
    if (post.imageUrl.isNotEmpty) {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: post.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildCommentsSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Comments', style: TextStyle(fontSize: 18)),
          ...comments.map((comment) => ListTile(
            title: Text(comment.username), // Display username
            subtitle: Text(comment.text), // Display comment text
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => addComment(commentController.text),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Post {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}

class Comment {
  final String postId;
  final String userId;
  final String username; // Added username field
  final String text;

  Comment({
    required this.postId,
    required this.userId,
    required this.username, // Added username field
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      userId: json['userId'],
      username: json['username'], // Added username field
      text: json['comment'],
    );
  }

  @override
  String toString() {
    return 'Comment{postId: $postId, userId: $userId, username: $username, text: $text}';
  }

}