import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'createpost.dart';
import 'viewpost.dart';
import 'package:transparent_image/transparent_image.dart';

class ReactionPage extends StatefulWidget {
  final String userId;

  const ReactionPage({Key? key, required this.userId}) : super(key: key);

  @override
  _ReactionPageState createState() => _ReactionPageState();
}

class _ReactionPageState extends State<ReactionPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF071533),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add functionality for burger menu
          },
        ),
        actions: [
          Visibility(
            visible: !isSearchBarVisible,
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                setState(() {
                  isSearchBarVisible = !isSearchBarVisible;
                });
              },
            ),
          ),
          Visibility(
            visible: isSearchBarVisible,
            child: Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(100, 10, 10, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  controller: textEditingController,
                  cursorColor: Color(0xFFff9c0d),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Color(0xFFff9c0d)),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, color: Color(0xFFff9c0d)),
                      onPressed: () {
                        setState(() {
                          isSearchBarVisible = false;
                          textEditingController.clear();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Add functionality to navigate to profile page
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: AssetImage('assets/banah.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('User ID: $currentUserId', style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostWidget(
                  post: posts[index],
                  currentUserId: currentUserId,
                  onLike: () => likePost(posts[index].id),
                  onUnlike: () => unlikePost(posts[index].id),
                  onViewPost: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewPost(
                            postId: posts[index].id, userId: currentUserId),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
                  ));
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

  const PostWidget({
    Key? key,
    required this.post,
    required this.currentUserId,
    required this.onLike,
    required this.onUnlike,
    required this.onViewPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(post.title),
            subtitle: Text(post.description),
          ),
          Image.network(post.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Post ID: ${post.id}',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          ButtonBar(
            children: [
              IconButton(
                icon: Icon(
                  post.liked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                  color: post.liked ? Colors.blue : null,
                ),
                onPressed: () {
                  if (post.liked) {
                    onUnlike();
                  } else {
                    onLike();
                  }
                },
              ),
              Text('${post.likesCounter}'),
              TextButton(
                child: Text('View Post'),
                onPressed: () => onViewPost(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
