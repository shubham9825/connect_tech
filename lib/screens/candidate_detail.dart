import 'package:flutter/material.dart';
import '../models/candidate.dart';

class CandidateDetailScreen extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailScreen({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Detail'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(candidate.imageUrl),
                  ),
                  SizedBox(height: 20),
                  Text(
                    candidate.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF191919)),
                  ),
                  Text(
                    candidate.role,
                    style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  ),
                  Text(
                    candidate.education,
                    style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  ),
                  Text(
                    candidate.location,
                    style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    candidate.description,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
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
          ),
        ),
      ),
    );
  }
}
