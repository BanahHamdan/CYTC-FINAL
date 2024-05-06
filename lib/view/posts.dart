import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cytc/view/calender.dart';
import 'package:cytc/view/chat.dart';
import 'package:cytc/view/homePage.dart';
import 'package:flutter/material.dart';

class ReactionPage extends StatefulWidget {
  @override
 _ReactionPageState createState() => _ReactionPageState();
 }

class _ReactionPageState extends State<ReactionPage> {
  List<Post> posts = [
    Post(
      title: "Post 1",
      description: "Description for post 1",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Post(
      title: "Post 2",
      description: "Description for post 2",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Post(
      title: "Post 3",
      description: "Description for post 3",
      imageUrl: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(
            post: posts[index],
            onUpdate: () {
              setState(() {});
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add new post
      //     setState(() {
      //       posts.add(
      //         Post(
      //           title: "New Post",
      //           description: "Description for new post",
      //           imageUrl: "https://via.placeholder.com/150",
      //         ),
      //       );
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class Post {
  final String title;
  final String description;
  final String imageUrl;
  int likes = 0;
  int loves = 0;
  bool liked = false;
  bool loved = false;

  Post({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class PostWidget extends StatelessWidget {
  final Post post;
  final Function onUpdate;

  const PostWidget({Key? key, required this.post, required this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(post.title),
            subtitle: Text(post.description),
          ),
          Image.network(post.imageUrl),
          ButtonBar(
            children: [
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: post.liked ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  if (post.loved) {
                    post.loves--;
                    post.loved = false;
                  }
                  post.likes = post.liked ? post.likes - 1 : post.likes + 1;
                  post.liked = !post.liked;
                  onUpdate();
                },
              ),
              Text(post.likes.toString()),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: post.loved ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  if (post.liked) {
                    post.likes--;
                    post.liked = false;
                  }
                  post.loves = post.loved ? post.loves - 1 : post.loves + 1;
                  post.loved = !post.loved;
                  onUpdate();
                },
              ),
              Text(post.loves.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
