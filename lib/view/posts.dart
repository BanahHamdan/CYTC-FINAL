// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ReactionPage extends StatefulWidget {
  const ReactionPage({super.key});

  @override
  _ReactionPageState createState() => _ReactionPageState();
}

class _ReactionPageState extends State<ReactionPage> {
  bool isSearchBarVisible = false;
  TextEditingController textEditingController = TextEditingController();

  List<Post> posts = [
    Post(
      title: "حفل تخريج افواج الاغاثة الطبية",
      description: "Description for post 1",
      imageUrl: "",
    ),
    Post(
      title: "الماراثون الرياضي لدعم السرطان",
      description: "Description for post 2",
      imageUrl: "",
    ),
    Post(
      title: "بمناسبة اليوم العالمي للاشخاص ذوي الاعاقة",
      description: "Description for post 3",
      imageUrl: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Color(0xFF071533), // Set background color to transparent
        elevation: 0, // Remove elevation
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu), // Burger menu icon
              onPressed: () {
                // Add functionality for burger menu
              },
            ),

            // IconButton(
            //   onPressed: () {
            //     // Add functionality for notification icon
            //   },
            //   padding: EdgeInsets.zero, // Remove padding around the icon button
            //   icon: Container(
            //     padding: EdgeInsets.all(4),
            //     decoration: BoxDecoration(
            //       color:
            //           Color(0xFFEC8F5E), // Notification icon background color
            //       shape: BoxShape.circle,
            //     ),
            //     child: Icon(
            //       Icons.notifications, // Notification icon
            //       color: Colors.white, // Notification icon color
            //       size: 17,
            //     ),
            //   ),
            // ),

            // ),
          ],
        ),

        actions: [
          // Wrap the search icon IconButton with Visibility
          Visibility(
            visible:
                !isSearchBarVisible, // Hide the search icon when the search bar is visible
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.white), // Search icon
              onPressed: () {
                // Update the state to toggle the visibility of the search bar
                setState(() {
                  isSearchBarVisible = !isSearchBarVisible;
                });
              },
            ),
          ),
          // Add the search bar here with Visibility widget to control its visibility
          Visibility(
            visible:
                isSearchBarVisible, // Control the visibility of the search bar
            child: Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(100, 10, 10, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  controller:
                      textEditingController, // Assign the TextEditingController to the TextField
                  cursorColor:
                      Color(0xFFff9c0d), // Customize the color of the cursor
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                        color: Colors
                            .grey), // Customize the color of the hint text
                    prefixIcon: Icon(Icons.search,
                        color: Color(0xFFff9c0d)), // Search icon
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear,
                          color: Color(
                              0xFFff9c0d)), // Clear icon to clear the search text
                      onPressed: () {
                        setState(() {
                          // Clear the search text and hide the search bar
                          isSearchBarVisible = false;
                          // Clear the text field
                          // You need to define the TextEditingController for this
                          // textEditingController.clear();
                        });
                      },
                    ),
                  ),
                  // Define a TextEditingController to control the text field
                  // controller: textEditingController,
                  // Add more properties as needed
                  // Add an onTap callback to the search icon to perform a search action
                  onTap: () {
                    // Perform search action here
                    // You can access the search query using the TextEditingController
                    // For example:
                    // String searchQuery = textEditingController.text;
                    // Perform search using the searchQuery
                  },
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
              width: 35, // Adjust the width as needed
              height: 35, // Adjust the height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: AssetImage('assets/banah.jpg'),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
/////////////////////////////////////////////////////////
      body: Center(
        child: ListView.builder(
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
    // crossAxisAlignment =  CrossAxisAlignment.end,
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
      margin: const EdgeInsets.all(8.0),
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
