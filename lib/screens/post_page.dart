import 'package:flutter/material.dart';

class Post {
  final String title;
  final String content;
  final String author;
  final String profileImage;
  final String postImage;

  Post({
    required this.title,
    required this.content,
    required this.author,
    required this.profileImage,
    required this.postImage,
  });
}

class PostPage extends StatelessWidget {
  final List<Post> posts = [
    Post(
      title: 'First Post',
      content: 'This is the content of the first post.',
      author: 'John Doe',
      profileImage: 'assets/profile_images/john_doe.jpg',
      postImage: 'assets/post_images/post1.jpg',
    ),
    Post(
      title: 'Second Post',
      content: 'This is the content of the second post.',
      author: 'Jane Smith',
      profileImage: 'assets/profile_images/jane_smith.jpg',
      postImage: 'assets/post_images/post2.jpg',
    ),
    Post(
      title: 'Third Post',
      content: 'This is the content of the third post.',
      author: 'Michael Brown',
      profileImage: 'assets/profile_images/michael_brown.jpg',
      postImage: 'assets/post_images/post3.jpg',
    ),
    Post(
      title: 'Fourth Post',
      content: 'This is the content of the fourth post.',
      author: 'Emily Johnson',
      profileImage: 'assets/profile_images/emily_johnson.jpg',
      postImage: 'assets/post_images/post4.jpg',
    ),
    Post(
      title: 'Fifth Post',
      content: 'This is the content of the fifth post.',
      author: 'David Wilson',
      profileImage: 'assets/profile_images/david_wilson.jpg',
      postImage: 'assets/post_images/post5.jpg',
    ),
    Post(
      title: 'Sixth Post',
      content: 'This is the content of the sixth post.',
      author: 'Sophia Martinez',
      profileImage: 'assets/profile_images/sophia_martinez.jpg',
      postImage: 'assets/post_images/post6.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(posts[index].profileImage),
                    ),
                    title: Text(
                      posts[index].author,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Posted 1 hour ago'), // Add timestamp
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        // Add options menu
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    posts[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(posts[index].content),
                  SizedBox(height: 8),
                  if (posts[index].postImage.isNotEmpty)
                    Image.asset(
                      posts[index].postImage,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () {
                          // Implement like functionality
                        },
                      ),
                      Text('Like'),
                      SizedBox(width: 16),
                      IconButton(
                        icon: Icon(Icons.comment),
                        onPressed: () {
                          // Implement comment functionality
                        },
                      ),
                      Text('Comment'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
