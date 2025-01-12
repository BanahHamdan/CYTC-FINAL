
// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'dart:convert';
// import 'package:transparent_image/transparent_image.dart';
// class ViewCommentsAdmin extends StatefulWidget {
//   final String postId;
//   final String userId;

//   const ViewCommentsAdmin({Key? key, required this.postId, required this.userId})
//       : super(key: key);

//   @override
//   _ViewCommentsAdminState createState() => _ViewCommentsAdminState();
// }

// class _ViewCommentsAdminState extends State<ViewCommentsAdmin> {
//   late Post post;
//   List<Comment> comments = [];
//   Map<String, String> userIdToUsername = {};
//   TextEditingController commentController = TextEditingController();
//   bool isLoading = true;
//   bool hasError = false;
//   String errorMessage = '';
//   bool noComments = false;
//   bool isLiked = false;

//   @override
//   void initState() {
//     super.initState();
//     print('Post ID received: ${widget.postId}'); // Log the post ID
//     fetchPostAndComments();
//     checkIfUserLikedPost();
//   }

//   Future<void> fetchPostAndComments() async {
//     try {
//       final postResponse = await http
//           .get(Uri.parse('http://localhost:9999/posts/${widget.postId}'));
//       final commentsResponse = await http
//           .get(Uri.parse('http://localhost:9999/comments/${widget.postId}'));

//       print('Post response body is ');
//       print(postResponse.body);
//       print('Comments response body is ');
//       print(commentsResponse.body);

//       if (postResponse.statusCode == 200 &&
//           commentsResponse.statusCode == 200) {
//         final postData = jsonDecode(postResponse.body);
//         final commentsData = jsonDecode(commentsResponse.body);

//         setState(() {
//           post = Post.fromJson(
//               postData['post']); // Adjusting to get the actual post object

//           if (commentsData is List) {
//             comments = commentsData
//                 .map((commentJson) => Comment.fromJson(commentJson))
//                 .toList(); // Adjusting to get the comments array
//             noComments = comments.isEmpty;
//           } else {
//             noComments = true;
//           }
//         });

//         await fetchUsernames();
//         setState(() {
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           hasError = true;
//           isLoading = false;
//           errorMessage =
//               'Error: Post response status code: ${postResponse.statusCode}, Comments response status code: ${commentsResponse.statusCode}';
//         });
//         print(errorMessage);
//       }
//     } catch (e) {
//       setState(() {
//         hasError = true;
//         isLoading = false;
//         errorMessage = 'Error fetching post and comments: $e';
//       });
//       print(errorMessage);
//     }
//   }

//   Future<void> fetchUsernames() async {
//     for (var comment in comments) {
//       if (!userIdToUsername.containsKey(comment.userId)) {
//         final userResponse = await http
//             .get(Uri.parse('http://localhost:9999/user/${comment.userId}'));
//         if (userResponse.statusCode == 200) {
//           final userData = jsonDecode(userResponse.body);
//           setState(() {
//             userIdToUsername[comment.userId] = userData['user']['username'];
//           });
//         } else {
//           setState(() {
//             userIdToUsername[comment.userId] = 'Unknown User';
//           });
//         }
//       }
//     }
//   }

//   Future<void> addComment(String text) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:9999/comments/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'postId': widget.postId,
//         'userId': widget.userId, // Use passed userId
//         'comment': text,
//       }),
//     );

//     final responseData = jsonDecode(response.body);

//     if (responseData['status'] == true) {
//       final newComment = Comment.fromJson(responseData['comment']);
//       setState(() {
//         comments.add(newComment);
//         noComments = false;
//       });
//       commentController.clear();
//       await fetchUsernames(); // Fetch the username for the new comment
//     } else {
//       print('Failed to add comment: ${responseData['message']}');
//     }
//   }

//   Future<void> editComment(String commentId, String newText) async {
//     final response = await http.put(
//       Uri.parse('http://localhost:9999/comments/$commentId'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'comment': newText,
//       }),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         final comment =
//             comments.firstWhere((comment) => comment.id == commentId);
//         comment.text = newText;
//       });
//     } else {
//       print('Failed to edit comment');
//     }
//   }

//   Future<void> deleteComment(String commentId) async {
//     final response = await http.delete(
//       Uri.parse('http://localhost:9999/comments/$commentId'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         comments.removeWhere((comment) => comment.id == commentId);
//         noComments = comments.isEmpty;
//       });
//     } else {
//       print('Failed to delete comment');
//     }
//   }

//   Future<void> checkIfUserLikedPost() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:9999/likes/hasUserLikedPost'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'userId': widget.userId,
//         'postId': widget.postId,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         isLiked = data['liked'];
//       });
//     } else {
//       print('Failed to check if user liked the post');
//     }
//   }

//   Future<void> toggleLikePost() async {
//     if (isLiked) {
//       await unlikePost();
//     } else {
//       await likePost();
//     }
//   }

//   Future<void> likePost() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:9999/likes/like'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'userId': widget.userId,
//         'postId': widget.postId,
//       }),
//     );

//     if (response.statusCode == 201) {
//       setState(() {
//         isLiked = true;
//       });
//     } else {
//       print('Failed to like the post');
//       print(response.body); // Print the response body for debugging
//     }
//   }

//   Future<void> unlikePost() async {
//     final response = await http.delete(
//       Uri.parse('http://localhost:9999/likes/unlike'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'userId': widget.userId,
//         'postId': widget.postId,
//       }),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         isLiked = false;
//       });
//     } else {
//       print('Failed to unlike the post');
//       print(response.body); // Print the response body for debugging
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(
//         'Building ViewPost page for Post ID: ${widget.postId}'); // Log the post ID

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.close, size: 20, color: Colors.grey),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : hasError
//               ? Center(child: Text('Failed to load post: $errorMessage'))
//               : SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(LineAwesomeIcons.smile_beam,
//                                 color: Color(0xFF071533)),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text('شاركنا باضافة تعليقك',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontFamily: 'Amiri',
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF071533))),
//                           ],
//                         ),
//                       ),
//                       _buildPostDetails(),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 170, 0),
//                         child: Text(
//                           'التعليقات',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'Amiri',
//                             color: Color(0xFF071533),
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Divider(color: Colors.grey[300]),
//                       ),
//                       _buildCommentsSection(),
//                     ],
//                   ),
//                 ),
//     );
//   }

//   Widget _buildPostDetails() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center( 
//         child:Container(
//         width: 700,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     post.title,
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       color: Color(0xFF071533),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     post.description,
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       color: Color(0xFF071533),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//             child: Container(
//                   width: 300.0, // Set the desired width here
//                   height: 200.0,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12.0),
//                     child: FadeInImage.memoryNetwork(
//                       placeholder: kTransparentImage,
//                       image: post.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//         ),
//             // Container(
//             //   width: double.infinity,
//             //   height: 200.0,
//             //   child: ClipRRect(
//             //     borderRadius: BorderRadius.circular(12.0),
//             //     child: FadeInImage.memoryNetwork(
//             //       placeholder: kTransparentImage,
//             //       image: post.imageUrl,
//             //       fit: BoxFit.cover,
//             //     ),
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // IconButton(
//                   //   icon: Icon(
//                   //     isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
//                   //     color: isLiked ? Color(0xFFffe145) : Colors.grey,
//                   //   ),
//                   //   onPressed: toggleLikePost,
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       ),
//       ),
//     );
//   }

//   Widget _buildImageWidget() {
//     if (post.imageUrl.isNotEmpty) {
//       return Container(
//         //  width: 300.0,
//         //         height: 200.0,
//         margin: const EdgeInsets.symmetric(vertical: 8.0),   //horizontal: 20),
//         // padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(12.0),
//           child: FadeInImage.memoryNetwork(
//             placeholder: kTransparentImage,
//             image: post.imageUrl,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
//     } else {
//       return SizedBox.shrink();
//     }
//   }

//   Widget _buildCommentsSection() {
//     return Center(
//       child: Container(
//         width: 700,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               if (noComments)
//                 Text(
//                   'كن أول من يعلق على هذا المنشور',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ...comments.map((comment) => Card(
//                     margin: const EdgeInsets.symmetric(vertical: 4.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.all(8.0),
//                       title: Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           userIdToUsername[comment.userId] ?? 'Loading...',
//                           style: TextStyle(
//                             fontFamily: 'Amiri',
//                             color: Color(0xFFffe145),
//                           ),
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       subtitle: Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           comment.text,
//                           style: TextStyle(
//                             fontFamily: 'Amiri',
//                             color: Color(0xFF071533),
//                           ),
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       trailing: comment.userId == widget.userId
//                           ? Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.edit, color: Colors.grey),
//                                   onPressed: () async {
//                                     String? editedText = await showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         TextEditingController editController =
//                                             TextEditingController(text: comment.text);
//                                         return AlertDialog(
//                                           title: Text('Edit Comment'),
//                                           content: TextField(
//                                             controller: editController,
//                                             decoration: InputDecoration(
//                                                 hintText: 'Edit your comment'),
//                                           ),
//                                           actions: [
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).pop();
//                                               },
//                                               child: Text('Cancel'),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.of(context)
//                                                     .pop(editController.text);
//                                               },
//                                               child: Text('Save'),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                     if (editedText != null) {
//                                       await editComment(comment.id, editedText);
//                                     }
//                                   },
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.delete, color: Colors.red),
//                                   onPressed: () async {
//                                     await deleteComment(comment.id);
//                                   },
//                                 ),
//                               ],
//                             )
//                           : null,
//                     ),
//                   )),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     textAlign: TextAlign.right,
//                     controller: commentController,
//                     cursorColor: Color(0xFFffe145),
//                     decoration: InputDecoration(
//                       hintText: '... اكتب تعليقك',
//                       hintStyle: TextStyle(fontFamily: 'Amiri'),
//                       border: InputBorder.none,
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(color: Color(0xFFffe145)),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.send, color: Color(0xFFffe145)),
//                         onPressed: () => addComment(commentController.text),
//                       ),
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

// }

// class Post {
//   final String id;
//   final String title;
//   final String description;
//   final String imageUrl;

//   Post({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['_id'],
//       title: json['title'],
//       description: json['description'],
//       imageUrl: json['imageUrl'],
//     );
//   }
// }

// class Comment {
//   final String id;
//   final String postId;
//   final String userId;
//   String text;

//   Comment({
//     required this.id,
//     required this.postId,
//     required this.userId,
//     required this.text,
//   });

//   factory Comment.fromJson(Map<String, dynamic> json) {
//     return Comment(
//       id: json['_id'],
//       postId: json['postId'],
//       userId: json['userId'],
//       text: json['comment'],
//     );
//   }

//   @override
//   String toString() {
//     return 'Comment{id: $id, postId: $postId, userId: $userId, text: $text}';
//   }
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';

class ViewCommentsAdmin extends StatefulWidget {
  final String postId;
  final String userId;

  const ViewCommentsAdmin(
      {Key? key, required this.postId, required this.userId})
      : super(key: key);

  @override
  _ViewCommentsAdminState createState() => _ViewCommentsAdminState();
}

class _ViewCommentsAdminState extends State<ViewCommentsAdmin> {
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

  void confirmDeleteComment(String commentId, String username) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('تأكيد الحذف'),
          content:
              Text('هل أنت متأكد من رغبتك في حذف تعليق المستخدم $username؟'),
          actions: [
            TextButton(
              child: Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('نعم'),
              onPressed: () async {
                Navigator.of(context).pop();
                await deleteComment(commentId);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Building ViewPost page for Post ID: ${widget.postId}'); // Log the post ID

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close, size: 20, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text('Failed to load post: $errorMessage'))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(LineAwesomeIcons.smile_beam,
                                color: Color(0xFF071533)),
                            SizedBox(
                              width: 5,
                            ),
                            Text('شاركنا باضافة تعليقك',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Amiri',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF071533))),
                          ],
                        ),
                      ),
                      _buildPostDetails(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 170, 0),
                        child: Text(
                          'التعليقات',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            color: Color(0xFF071533),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(color: Colors.grey[300]),
                      ),
                      _buildCommentsSection(),
                    ],
                  ),
                ),
    );
  }

  Widget _buildPostDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 700,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        post.title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Amiri',
                          color: Color(0xFF071533),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        post.description,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Amiri',
                          color: Color(0xFF071533),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 300.0, // Set the desired width here
                    height: 200.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageWidget() {
    if (post.imageUrl.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: post.imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildCommentsSection() {
    return Center(
      child: Container(
        width: 700,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (noComments)
                Text(
                  'كن أول من يعلق على هذا المنشور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ...comments.map((comment) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          userIdToUsername[comment.userId] ?? 'Loading...',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            color: Color(0xFFffe145),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          comment.text,
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            color: Color(0xFF071533),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          confirmDeleteComment(
                              comment.id,
                              userIdToUsername[comment.userId] ??
                                  'Unknown User');
                        },
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    textAlign: TextAlign.right,
                    controller: commentController,
                    cursorColor: Color(0xFFffe145),
                    decoration: InputDecoration(
                      hintText: '... اكتب تعليقك',
                      hintStyle: TextStyle(fontFamily: 'Amiri'),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFFffe145)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send, color: Color(0xFFffe145)),
                        onPressed: () => addComment(commentController.text),
                      ),
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
