import 'package:flutter/material.dart';
import '../models/candidate.dart'; // Import the Candidate model
import 'candidate.dart'; // Import the CandidatesScreen
import 'candidate_detail.dart'; // Import the CandidateDetailScreen
import 'job_detail.dart';
import 'job_listings.dart';
import '../models/JobListing.dart'; // Import the Candidate model

class HomeScreen extends StatefulWidget {
  final List<Candidate> connectedCandidates;

  HomeScreen({required this.connectedCandidates});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.people), // Icon for navigating to CandidatesScreen
            onPressed: () {
              // Navigate to CandidatesScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CandidatesScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Candidates'),
              onTap: () {
                // Navigate to CandidatesScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidatesScreen()),
                );
              },
            ),ListTile(
              title: Text('Posts'),
              onTap: () {
                // Navigate to CandidatesScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidatesScreen()),
                );
              },
            ),ListTile(
              title: Text('Job Listing'),
              onTap: () {
                // Navigate to JobDetailScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobListingsScreen()),
                );
              },
            ),
            // Add more list items for other screens if needed
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Set background color
      body: widget.connectedCandidates.isEmpty
          ? Center(
        child: Text(
          'No connected candidates yet!',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: widget.connectedCandidates.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0), // Add padding
            child: Card(
              elevation: 3, // Add elevation for a raised effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Add rounded corners
              ),
              child: ListTile(
                title: Text(widget.connectedCandidates[index].name),
                subtitle: Text(widget.connectedCandidates[index].role),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      widget.connectedCandidates[index].imageUrl),
                ),
                onTap: () {
                  // Navigate to candidate detail screen
                  _navigateToCandidateDetailScreen(widget.connectedCandidates[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToCandidateDetailScreen(Candidate candidate) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CandidateDetailScreen(candidate: candidate)),
    );

    if (result != null && result is Candidate) {
      setState(() {
        // Add the connected candidate to the list if it doesn't already exist
        if (!widget.connectedCandidates.contains(result)) {
          widget.connectedCandidates.add(result);
        }
      });
    }
  }
}
