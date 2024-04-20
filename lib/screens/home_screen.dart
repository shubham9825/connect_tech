import 'package:flutter/material.dart';
import '../models/candidate.dart';
import 'candidate.dart';
import 'candidate_detail.dart';
import 'job_listings.dart';
import 'create_post_screen.dart';
import 'post_page.dart';


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
            icon: Icon(Icons.people),
            onPressed: () {

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

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidatesScreen()),
                );
              },
            ),ListTile(
              title: Text('Posts'),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage()),
                );
              },
            ),ListTile(
              title: Text('Job Listing'),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobListingsScreen()),
                );
              },
            ),ListTile(
              title: Text('Add Job to Portal'),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePostScreen()),
                );
              },
            ),

          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
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
                vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(widget.connectedCandidates[index].name),
                subtitle: Text(widget.connectedCandidates[index].role),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      widget.connectedCandidates[index].imageUrl),
                ),
                onTap: () {

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

        if (!widget.connectedCandidates.contains(result)) {
          widget.connectedCandidates.add(result);
        }
      });
    }
  }
}
