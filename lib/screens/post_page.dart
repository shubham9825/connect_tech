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
      title: 'Getting My New Job',
      content: 'Im excited to announce that I have accepted a new position as a Senior Developer! 🚀 After much hard work and effort, Im eager to begin this next chapter in my career. Im excited to bring my knowledge to the table, collaborate with talented colleagues, and make significant contributions to new projects. Thank you to everyone who has encouraged me along the journey. Cheers to new beginnings and infinite potential! 🌟. #newjob #seniordeveloper #excitedforthejourney',
      author: 'John Doe',
      profileImage: 'images/person1.jpg',
      postImage: 'images/post1.jpg',
    ),
    Post(
      title: 'Getting a new position at my Company',
      content: 'Im excited to announce that I have accepted a new position as a Senior Developer! 🚀 After much hard work and effort, Im eager to begin this next chapter in my career. Im excited to bring my knowledge to the table, collaborate with talented colleagues, and make significant contributions to new projects. Thank you to everyone who has encouraged me along the journey. Cheers to new beginnings and infinite potential! 🌟. #newjob #seniordeveloper #excitedforthejourney',
      author: 'Jane Smith',
      profileImage: 'images/person2.jpg',
      postImage: 'images/post2.jpg',
    ),
    Post(
      title: 'I got promoted at Meta',
      content: 'Im happy to announce that Ive been promoted in my company! 🎉 Its a tremendous honor to be acknowledged for my efforts and dedication, and Im happy for the opportunity to take on additional duties and tasks. Im looking forward to continuing to grow, learn, and contribute positively in my role. Thank you to all of my wonderful coworkers and mentors for their encouragement and support along the journey. Looking forward to the next chapter of success and progress! 💼✨ #Promotion #Grateful #ExcitedForTheJourney.',
      author: 'Michael Brown',
      profileImage: 'images/person3.jpg',
      postImage: 'images/post3.jpg',
    ),
    Post(
      title: 'I am happy to share I got promoted at Google',
      content: 'Im excited to announce that Ive been promoted at my company! 🎉 It is a tremendous honor to be acknowledged for my hard work and dedication, and I am happy for the opportunity to take on additional duties and tasks. Im enthusiastic to keep growing, learning, and having a great effect in my work. Thank you to all of my fantastic coworkers and mentors for their encouragement and support along the journey. Heres to the next chapter of success and progress! 💼✨ #promotion #grateful #excitedforthejourney',
      author: 'Emily Johnson',
      profileImage: 'images/person4.jpg',
      postImage: 'images/post4.jpg',
    ),
    Post(
      title: 'Getting a new position at my Company',
      content: 'Im excited to announce that I have accepted a new position as a Junior Developer! 🚀 After much hard work and effort, Im eager to begin this next chapter in my career. Im excited to bring my knowledge to the table, collaborate with talented colleagues, and make significant contributions to new projects. Thank you to everyone who has encouraged me along the journey. Cheers to new beginnings and infinite potential! 🌟. #newjob #seniordeveloper #excitedforthejourney',
      author: 'David Wilson',
      profileImage: 'images/person5.jpg',
      postImage: 'images/post5.jpg',
    ),
    Post(
      title: 'Getting My New Job',
      content: 'Im excited to announce that I have accepted a new position as a Manager! 🚀 After much hard work and effort, Im eager to begin this next chapter in my career. Im excited to bring my knowledge to the table, collaborate with talented colleagues, and make significant contributions to new projects. Thank you to everyone who has encouraged me along the journey. Cheers to new beginnings and infinite potential! 🌟. #newjob #seniordeveloper #excitedforthejourney',
      author: 'Sophia Martinez',
      profileImage: 'images/person6.jpg',
      postImage: 'images/post6.jpg',
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
          return AnimatedPostCard(post: posts[index]);
        },
      ),
    );
  }
}

class AnimatedPostCard extends StatefulWidget {
  final Post post;

  AnimatedPostCard({required this.post});

  @override
  _AnimatedPostCardState createState() => _AnimatedPostCardState();
}

class _AnimatedPostCardState extends State<AnimatedPostCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: SlideTransition(
              position: _slideAnimation,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(widget.post.profileImage),
                        ),
                        title: Text(
                          widget.post.author,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Posted 1 hour ago'),
                        trailing: IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.post.title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(widget.post.content),
                      SizedBox(height: 8),
                      if (widget.post.postImage.isNotEmpty)
                        Image.asset(
                          widget.post.postImage,
                          width: double.infinity,
                          height: 600,
                          fit: BoxFit.cover,
                        ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {

                            },
                          ),
                          Text('Like'),
                          SizedBox(width: 16),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {

                            },
                          ),
                          Text('Comment'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
