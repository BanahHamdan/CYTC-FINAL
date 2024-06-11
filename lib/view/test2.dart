import 'package:flutter/material.dart';

class posts1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('posts page'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: FeedPage(),
      ),
    );
  }
}

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Post> posts = [
    Post(
      username: 'pubity',
      postTime: '2m',
      contentText: 'Vine after seeing the Threads logo unveiled',
      contentImageUrl: 'assets/thread_vine.png',
      likes: 391,
      comments: 36,
    ),
    Post(
      username: 'thetinderblog',
      postTime: '5m',
      contentText: 'Elon alone on Twitter right now...',
      contentImageUrl: 'assets/elon_twitter.png',
      likes: 281,
      comments: 22,
    ),
  ];

  void _likePost(int index) {
    setState(() {
      posts[index].likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(
          post: posts[index],
          onLike: () => _likePost(index),
        );
      },
    );
  }
}

class Post {
  final String username;
  final String postTime;
  final String contentText;
  final String contentImageUrl;
  int likes;
  final int comments;

  Post({
    required this.username,
    required this.postTime,
    required this.contentText,
    required this.contentImageUrl,
    required this.likes,
    required this.comments,
  });
}

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onLike;

  PostCard({
    required this.post,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'), // Replace with your profile image path
            ),
            title: Text(post.username),
            subtitle: Text(post.postTime),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(post.contentText),
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(post.contentImageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: onLike,
                    ),
                    SizedBox(width: 10),
                    Text('${post.likes} likes'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 10),
                    Text('${post.comments} comments'),
                  ],
                ),
                Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
