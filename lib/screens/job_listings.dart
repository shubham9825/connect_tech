import 'package:flutter/material.dart';
import 'package:connect_tech/models/JobListing.dart';
import 'job_detail.dart';

class JobListingsScreen extends StatelessWidget {
  final List<JobListing> jobListings = [
    JobListing(
      title: "Software Developer",
      company: "Google",
      logoUrl: "images/Google.jpg",
      location: "Mountain View, CA",
      description:
      "Are you ready to revolutionize the digital world? Google is seeking a highly skilled and passionate Software Developer to join our dynamic team. As a Software Developer at Google, you will have the opportunity to work on groundbreaking projects that shape the future of technology and redefine how people interact with information.",
    ),
    JobListing(
      title: "Product Manager",
      company: "Facebook",
      logoUrl: "images/facebook.jpg",
      location: "Menlo Park, CA",
      description:
      "Are you prepared to make an unforgettable imprint on the digital landscape? Facebook is looking for imaginative designers to join our dynamic team and play a key role in creating the future of social media. As a member of our design team, you'll be able to express your creativity, push boundaries, and create remarkable user experiences that touch billions of people across the world..",
    ),
    JobListing(
      title: "Data Engineer",
      company: "Amazon",
      logoUrl: "images/amazon.jpg",
      location: "Seattle, WA",
      description:
      "Amazon is looking for visionary data engineers to join our acclaimed team and play a critical role in driving innovation through data. As a member of our data engineering team, you'll use cutting-edge technologies to unlock the potential of massive data sets and pioneer solutions that drive Amazon's constant pursuit of customer obsession and operational excellence.",
    ),
    JobListing(
      title: "Marketing Manager",
      company: "Apple",
      logoUrl: "images/apple.jpg",
      location: "Cupertino, CA",
      description:
      "Our organization is looking for a visionary Marketing Manager to lead our brand's ascension to new heights. As a key member of our team, you will use creative ideas, cutting-edge technologies, and infinite imagination to move our brand forward and engage consumers on a worldwide scale.",
    ),
    JobListing(
      title: "UX/UI Designer",
      company: "Microsoft",
      logoUrl: "images/microsoft.jpg",
      location: "Redmond, WA",
      description:
      "Microsoft is looking for imaginative UX/UI designers to join our acclaimed team and play a key role in creating the future of technology. As a member of our UX/UI design team, you'll be able to express your creativity, drive innovation, and create revolutionary user experiences that benefit billions of people across the world..",
    ),
    JobListing(
      title: "Full Stack Developer",
      company: "Netflix",
      logoUrl: "images/Netflix.jpg",
      location: "Los Gatos, CA",
      description:
      "Netflix is looking for outstanding Full Stack Developers to join our exceptional team and help us pursue innovation in streaming technology. As a member of our team, you will have the opportunity to impact the future of entertainment by developing cutting-edge applications and pushing the boundaries of what is possible in the world of streaming video.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: ListView.builder(
        itemCount: jobListings.length,
        itemBuilder: (context, index) {
          return HeavyAnimatedCard(
            jobListing: jobListings[index],
          );
        },
      ),
    );
  }
}

class HeavyAnimatedCard extends StatefulWidget {
  final JobListing jobListing;

  HeavyAnimatedCard({required this.jobListing});

  @override
  _HeavyAnimatedCardState createState() => _HeavyAnimatedCardState();
}

class _HeavyAnimatedCardState extends State<HeavyAnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: GestureDetector(
              onTap: () {
                _controller.reverse().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          JobDetailScreen(jobListing: widget.jobListing),
                    ),
                  );
                });
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(widget.jobListing.title),
                  subtitle: Text(widget.jobListing.company),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(widget.jobListing.logoUrl),
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
