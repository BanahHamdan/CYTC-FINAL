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
      home: ViewPost(
        postId: '664cff22b5a3f535d63bcc36',
        userId: 'exampleUserId', // Example postId and userId
      ),
    );
  }
}

class ViewPost extends StatefulWidget {
  final String postId;
  final String userId;

  const ViewPost({Key? key, required this.postId, required this.userId})
      : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  late Post post;
  List<Comment> comments = [];
  Map<String, String> userIdToUsername = {};
  TextEditingController commentController = TextEditingController();
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';
  bool noComments = false;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    print('Post ID received: ${widget.postId}'); // Log the post ID
    fetchPostAndComments();
    checkIfUserLikedPost();
  }

  Future<void> fetchPostAndComments() async {
    try {
      final postResponse = await http
          .get(Uri.parse('http://localhost:9999/posts/${widget.postId}'));
      final commentsResponse = await http
          .get(Uri.parse('http://localhost:9999/comments/${widget.postId}'));

      print('Post response body is ');
      print(postResponse.body);
      print('Comments response body is ');
      print(commentsResponse.body);

      if (postResponse.statusCode == 200 &&
          commentsResponse.statusCode == 200) {
        final postData = jsonDecode(postResponse.body);
        final commentsData = jsonDecode(commentsResponse.body);

        setState(() {
          post = Post.fromJson(
              postData['post']); // Adjusting to get the actual post object

          if (commentsData is List) {
            comments = commentsData
                .map((commentJson) => Comment.fromJson(commentJson))
                .toList(); // Adjusting to get the comments array
            noComments = comments.isEmpty;
          } else {
            noComments = true;
          }
        });

        await fetchUsernames();
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
          errorMessage =
              'Error: Post response status code: ${postResponse.statusCode}, Comments response status code: ${commentsResponse.statusCode}';
        });
        print(errorMessage);
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
        errorMessage = 'Error fetching post and comments: $e';
      });
      print(errorMessage);
    }
  }

  Future<void> fetchUsernames() async {
    for (var comment in comments) {
      if (!userIdToUsername.containsKey(comment.userId)) {
        final userResponse = await http
            .get(Uri.parse('http://localhost:9999/user/${comment.userId}'));
        if (userResponse.statusCode == 200) {
          final userData = jsonDecode(userResponse.body);
          setState(() {
            userIdToUsername[comment.userId] = userData['user']['username'];
          });
        } else {
          setState(() {
            userIdToUsername[comment.userId] = 'Unknown User';
          });
        }
      }
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
        'userId': widget.userId, // Use passed userId
        'comment': text,
      }),
    );

    final responseData = jsonDecode(response.body);

    if (responseData['status'] == true) {
      final newComment = Comment.fromJson(responseData['comment']);
      setState(() {
        comments.add(newComment);
        noComments = false;
      });
      commentController.clear();
      await fetchUsernames(); // Fetch the username for the new comment
    } else {
      print('Failed to add comment: ${responseData['message']}');
    }
  }

  Future<void> editComment(String commentId, String newText) async {
    final response = await http.put(
      Uri.parse('http://localhost:9999/comments/$commentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'comment': newText,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        final comment =
            comments.firstWhere((comment) => comment.id == commentId);
        comment.text = newText;
      });
    } else {
      print('Failed to edit comment');
    }
  }

  Future<void> deleteComment(String commentId) async {
    final response = await http.delete(
      Uri.parse('http://localhost:9999/comments/$commentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        comments.removeWhere((comment) => comment.id == commentId);
        noComments = comments.isEmpty;
      });
    } else {
      print('Failed to delete comment');
    }
  }

  Future<void> checkIfUserLikedPost() async {
    final response = await http.post(
      Uri.parse('http://localhost:9999/likes/hasUserLikedPost'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': widget.userId,
        'postId': widget.postId,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        isLiked = data['liked'];
      });
    } else {
      print('Failed to check if user liked the post');
    }
  }

  Future<void> toggleLikePost() async {
    if (isLiked) {
      await unlikePost();
    } else {
      await likePost();
    }
  }

  Future<void> likePost() async {
    final response = await http.post(
      Uri.parse('http://localhost:9999/likes/like'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': widget.userId,
        'postId': widget.postId,
      }),
    );

    if (response.statusCode == 201) {
      setState(() {
        isLiked = true;
      });
    } else {
      print('Failed to like the post');
      print(response.body); // Print the response body for debugging
    }
  }

  Future<void> unlikePost() async {
    final response = await http.delete(
      Uri.parse('http://localhost:9999/likes/unlike'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': widget.userId,
        'postId': widget.postId,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLiked = false;
      });
    } else {
      print('Failed to unlike the post');
      print(response.body); // Print the response body for debugging
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Building ViewPost page for Post ID: ${widget.postId}'); // Log the post ID

    return Scaffold(
      appBar: AppBar(
        title: Text('View Post'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text('Failed to load post: $errorMessage'))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('User ID: ${widget.userId}',
                            style:
                                TextStyle(fontSize: 16)), // Display the user ID
                      ),
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
          Row(
            children: [
              Text('Post ID: ${post.id}',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Spacer(),
              IconButton(
                icon: Icon(
                  isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
                  color: isLiked ? Colors.blue : Colors.grey,
                ),
                onPressed: toggleLikePost,
              ),
            ],
          ),
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
          if (noComments)
            Text('Be the first one to comment on this post',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ...comments.map((comment) => ListTile(
                title: Row(
                  children: [
                    Text(userIdToUsername[comment.userId] ??
                        'Loading...'), // Display username
                    if (comment.userId == widget.userId) ...[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final newText = await showDialog<String>(
                            context: context,
                            builder: (context) {
                              final editController =
                                  TextEditingController(text: comment.text);
                              return AlertDialog(
                                title: Text('Edit Comment'),
                                content: TextField(
                                  controller: editController,
                                  decoration: InputDecoration(
                                    hintText: 'Edit your comment',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(editController.text);
                                    },
                                    child: Text('Save'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );

                          if (newText != null) {
                            await editComment(comment.id, newText);
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await deleteComment(comment.id);
                        },
                      ),
                    ],
                  ],
                ),
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
  final String id;
  final String postId;
  final String userId;
  String text;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'],
      postId: json['postId'],
      userId: json['userId'],
      text: json['comment'],
    );
  }

  @override
  String toString() {
    return 'Comment{id: $id, postId: $postId, userId: $userId, text: $text}';
  }
}
