// ignore_for_file: prefer_const_constructors
// import 'package:cytc/AdminPages/screen/MenuPages/posts/commentsView.dart';
// import 'package:cytc/AdminPages/screen/MenuPages/posts/createpost.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:transparent_image/transparent_image.dart';

// class Adminviewpost extends StatefulWidget {
//   final String userId;

//   const Adminviewpost({Key? key, required this.userId}) : super(key: key);

//   @override
//   _ReactionPageState createState() => _ReactionPageState();
// }

// class _ReactionPageState extends State<Adminviewpost> {
//   bool isSearchBarVisible = false;
//   TextEditingController textEditingController = TextEditingController();
//   List<Post> posts = [];
//   String get currentUserId => widget.userId;

//   @override
//   void initState() {
//     super.initState();
//     fetchPosts();
//   }

//   Future<void> fetchPosts() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:9999/posts/all'));

//     print('all posts : ');
//     print(response.body);

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       setState(() {
//         posts = data.map((postJson) => Post.fromJson(postJson)).toList();
//         posts.sort((a, b) => b.id.compareTo(a.id));
//       });
//       await checkIfUserLikedPosts();
//     } else {
//       print('Failed to load posts');
//     }
//   }

//   Future<void> checkIfUserLikedPosts() async {
//     for (var post in posts) {
//       final response = await http.post(
//         Uri.parse('http://localhost:9999/likes/hasUserLikedPost'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           'userId': currentUserId,
//           'postId': post.id,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           post.liked = data['liked'];
//         });
//       } else {
//         print('Failed to check if user liked the post');
//       }
//     }
//   }

//   Future<void> likePost(String postId) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:9999/likes/like'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'userId': currentUserId,
//         'postId': postId,
//       }),
//     );

//     if (response.statusCode == 201) {
//       print('Like added successfully');
//       setState(() {
//         final post = posts.firstWhere((post) => post.id == postId);
//         post.liked = true;
//         post.likesCounter++;
//       });
//     } else {
//       print('Failed to add like');
//     }
//   }

//   Future<void> unlikePost(String postId) async {
//     final response = await http.delete(
//       Uri.parse('http://localhost:9999/likes/unlike'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'userId': currentUserId,
//         'postId': postId,
//       }),
//     );

//     if (response.statusCode == 200) {
//       print('Like removed successfully');
//       setState(() {
//         final post = posts.firstWhere((post) => post.id == postId);
//         post.liked = false;
//         post.likesCounter--;
//       });
//     } else {
//       print('Failed to remove like');
//       print(response.body); // Print the response body for debugging
//     }
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               // 'User ID: $currentUserId',
//               'تعرف على انجازاتنا وتفاعل معنا',
//               textAlign: TextAlign.right,
//              style: TextStyle(
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF071533),
//                 fontFamily: 'Amiri',
//               ),
//             ),
//           ),
//            Expanded(
//             child: ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 return Center(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.7, // Adjust the width as needed
//                     child: PostWidget(
//                       post: posts[index],
//                       currentUserId: currentUserId,
//                       onLike: () => likePost(posts[index].id),
//                       onUnlike: () => unlikePost(posts[index].id),
//                       onViewPost: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ViewCommentsAdmin(
//                                 postId: posts[index].id, userId: currentUserId),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 );
//           // Expanded(
//           //   child: ListView.builder(
//           //     itemCount: posts.length,
//           //     itemBuilder: (context, index) {
//           //       return PostWidget(
//           //         post: posts[index],
//           //         currentUserId: currentUserId,
//           //         onLike: () => likePost(posts[index].id),
//           //         onUnlike: () => unlikePost(posts[index].id),
//           //         onViewPost: () {
//           //           Navigator.push(
//           //             context,
//           //             MaterialPageRoute(
//           //               builder: (context) => ViewPost(
//           //                   postId: posts[index].id, userId: currentUserId),
//           //             ),
//           //           );
//           //         },
//           //       );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color(0xFFffe145),
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreatePost()),
//           );

//           if (result != null && result is Map) {
//             setState(() {
//               posts.insert(
//                   0,
//                   Post( 
//                     id: result['id'],
//                     title: result['title'],
//                     description: result['description'],
//                     imageUrl: result['imageUrl'],
//                     likesCounter: result['likesCounter'] ?? 0,
//                   ));
//             });
//           }
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class Post {
//   final String id;
//   final String title;
//   final String description;
//   final String imageUrl;
//   int likesCounter;
//   bool liked;

//   Post({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     this.likesCounter = 0,
//     this.liked = false,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['_id'],
//       title: json['title'],
//       description: json['description'],
//       imageUrl: json['imageUrl'],
//       likesCounter: json['likesCounter'] ?? 0,
//     );
//   }
// }

// class PostWidget extends StatelessWidget {
//   final Post post;
//   final String currentUserId;
//   final Function onLike;
//   final Function onUnlike;
//   final Function onViewPost;

//   const PostWidget({
//     Key? key,
//     required this.post,
//     required this.currentUserId,
//     required this.onLike,
//     required this.onUnlike,
//     required this.onViewPost,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.0),
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xFF071533).withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//         child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               title: Text(
//                 post.title,
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold
//                 ),
//               ),
//               subtitle: Text(
//                 post.description,
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   color: Color(0xFF071533),
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             // Image.network(post.imageUrl),
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: Text('Post ID: ${post.id}',
//             //       style: TextStyle(fontSize: 12, color: Colors.grey)),
//             // ),
// //////////////////////////////////////////////
//             Center(
//               child: Container(
//                 width: 300.0,
//                 height: 200.0, // Fixed height for the image container
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: FadeInImage.memoryNetwork(
//                     placeholder: kTransparentImage,
//                     image: post.imageUrl,
//                     fit: BoxFit.cover, // Ensures the image covers the container
//                   ),
//                 ),
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: Text('Post ID: ${post.id}',
//             //       textAlign: TextAlign.right,
//             //       style: TextStyle(fontSize: 12, color: Colors.grey)),
//             // ),
// //////////////////////////////////////////
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: TextButton(
//                     child: Text(
//                       'اعرض التعليقات',
//                       style: TextStyle(
//                         fontFamily: 'Amiri',
//                         color: Color(0xFF071533),
//                       ),
//                     ),
//                     onPressed: () => onViewPost(),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text('${post.likesCounter}'),
//                     IconButton(
//                       icon: Icon(
//                         post.liked
//                             ? Icons.thumb_up
//                             : Icons.thumb_up_alt_outlined,
//                         color: post.liked ? Color(0xFFffe145) : null,
//                       ),
//                       onPressed: () {
//                         if (post.liked) {
//                           onUnlike();
//                         } else {
//                           onLike();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//         ),
//     );
//   }
// }

import 'package:cytc/AdminPages/screen/MenuPages/posts/commentsView.dart';
import 'package:cytc/AdminPages/screen/MenuPages/posts/createpost.dart';
import 'package:cytc/UserPages/screen/bottomBarPages/posts/viewpost.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';

class Adminviewpost extends StatefulWidget {
  final String userId;

  const Adminviewpost({Key? key, required this.userId}) : super(key: key);

  @override
  _ReactionPageState createState() => _ReactionPageState();
}

class _ReactionPageState extends State<Adminviewpost> {
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();
  List<Post> posts = [];
  String get currentUserId => widget.userId;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/posts/all'));

    print('all posts : ');
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        posts = data.map((postJson) => Post.fromJson(postJson)).toList();
        posts.sort((a, b) => b.id.compareTo(a.id));
      });
      await checkIfUserLikedPosts();
    } else {
      print('Failed to load posts');
    }
  }

  Future<void> checkIfUserLikedPosts() async {
    for (var post in posts) {
      final response = await http.post(
        Uri.parse('http://localhost:9999/likes/hasUserLikedPost'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': currentUserId,
          'postId': post.id,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          post.liked = data['liked'];
        });
      } else {
        print('Failed to check if user liked the post');
      }
    }
  }

  Future<void> likePost(String postId) async {
    final response = await http.post(
      Uri.parse('http://localhost:9999/likes/like'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': currentUserId,
        'postId': postId,
      }),
    );

    if (response.statusCode == 201) {
      print('Like added successfully');
      setState(() {
        final post = posts.firstWhere((post) => post.id == postId);
        post.liked = true;
        post.likesCounter++;
      });
    } else {
      print('Failed to add like');
    }
  }

  Future<void> unlikePost(String postId) async {
    final response = await http.delete(
      Uri.parse('http://localhost:9999/likes/unlike'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': currentUserId,
        'postId': postId,
      }),
    );

    if (response.statusCode == 200) {
      print('Like removed successfully');
      setState(() {
        final post = posts.firstWhere((post) => post.id == postId);
        post.liked = false;
        post.likesCounter--;
      });
    } else {
      print('Failed to remove like');
      print(response.body); // Print the response body for debugging
    }
  }

  Future<void> deletePost(String postId) async {
    final response = await http.delete(
      Uri.parse('http://localhost:9999/posts/delete/$postId'),
    );

    if (response.statusCode == 200) {
      print('Post deleted successfully');
      setState(() {
        posts.removeWhere((post) => post.id == postId);
      });
    } else {
      print('Failed to delete post');
      print(response.body); // Print the response body for debugging
    }
  }

  void confirmDeletePost(String postId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد من رغبتك في حذف هذا المنشور؟'),
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
                await deletePost(postId);
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'تعرف على انجازاتنا وتفاعل معنا',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF071533),
                fontFamily: 'Amiri',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.7, // Adjust the width as needed
                    child: PostWidget(
                      post: posts[index],
                      currentUserId: currentUserId,
                      onLike: () => likePost(posts[index].id),
                      onUnlike: () => unlikePost(posts[index].id),
                      onViewPost: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewCommentsAdmin(
                              postId: posts[index].id,
                              userId: currentUserId,
                            ),
                          ),
                        );
                      },
                      onDelete: () => confirmDeletePost(posts[index].id),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFffe145),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePost()),
          );

          if (result != null && result is Map) {
            setState(() {
              posts.insert(
                0,
                Post(
                  id: result['id'],
                  title: result['title'],
                  description: result['description'],
                  imageUrl: result['imageUrl'],
                  likesCounter: result['likesCounter'] ?? 0,
                ),
              );
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Post {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  int likesCounter;
  bool liked;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.likesCounter = 0,
    this.liked = false,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      likesCounter: json['likesCounter'] ?? 0,
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;
  final String currentUserId;
  final Function onLike;
  final Function onUnlike;
  final Function onViewPost;
  final Function onDelete;

  const PostWidget({
    Key? key,
    required this.post,
    required this.currentUserId,
    required this.onLike,
    required this.onUnlike,
    required this.onViewPost,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF071533).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                post.title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                post.description,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                  fontSize: 15,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 300.0,
                height: 200.0, // Fixed height for the image container
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: post.imageUrl,
                    fit: BoxFit.cover, // Ensures the image covers the container
                  ),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    child: Text(
                      'اعرض التعليقات',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        color: Color(0xFF071533),
                      ),
                    ),
                    onPressed: () => onViewPost(),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${post.likesCounter}'),
                    IconButton(
                      icon: Icon(
                        post.liked
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined,
                        color: post.liked ? Color(0xFFffe145) : null,
                      ),
                      onPressed: () {
                        if (post.liked) {
                          onUnlike();
                        } else {
                          onLike();
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onDelete(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
