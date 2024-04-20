import 'package:flutter/material.dart';
import 'package:connect_tech/models/JobListing.dart';

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
              textAlign: TextAlign.center,
            ),
            Text(
              jobListing.company,
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Applied Successfully through your Resume!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Apply Through Resume'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully Applied through the portal'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Apply through Our Recruitment Portal'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
