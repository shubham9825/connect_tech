import 'package:flutter/material.dart';
import 'package:connect_tech/models/JobListing.dart'; // Import the JobListing model

class JobDetailScreen extends StatelessWidget {
  final JobListing jobListing;

  JobDetailScreen({required this.jobListing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(jobListing.logoUrl),
              ),
            ),
            SizedBox(height: 20),
            Text(
              jobListing.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              jobListing.company,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Location: ${jobListing.location}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              jobListing.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Connected successfully!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }
}