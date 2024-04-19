import 'package:flutter/material.dart';
import 'package:connect_tech/models/JobListing.dart';
import 'job_detail.dart'; // Import the JobDetailScreen

class JobListingsScreen extends StatelessWidget {
  final List<JobListing> jobListings = [
    JobListing(
      title: "Software Engineer",
      company: "Google",
      logoUrl: "assets/google_logo.png",
      location: "Mountain View, CA",
      description:
      "We are looking for talented software engineers to join our team at Google.",
    ),
    JobListing(
      title: "Product Designer",
      company: "Facebook",
      logoUrl: "assets/facebook_logo.png",
      location: "Menlo Park, CA",
      description:
      "Join our design team at Facebook and help us create beautiful products.",
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
          return GestureDetector(
            onTap: () async {
              // Navigate to JobDetailScreen
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(jobListing: jobListings[index]),
                ),
              );

              // Handle the result if needed
              if (result != null && result is JobListing) {
                Navigator.pop(context, result);
              }
            },

            child: ListTile(
              title: Text(jobListings[index].title),
              subtitle: Text(jobListings[index].company),
              leading: CircleAvatar(
                backgroundImage: AssetImage(jobListings[index].logoUrl),
              ),
            ),
          );
        },
      ),
    );
  }
}
