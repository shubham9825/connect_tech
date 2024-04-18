import 'package:flutter/material.dart';
import '../widgets/candidate_card.dart';
import 'candidate_detail.dart';
import '../models/candidate.dart';

class CandidatesScreen extends StatelessWidget {
  final List<Candidate> candidates = [
    Candidate(
      name: "John Doe",
      imageUrl: "images/person1.jpg",
      description: "Experienced professional with expertise in...",
    ),
    Candidate(
      name: "Jane Smith",
      imageUrl: "images/person2.jpg",
      description: "Skilled in various technologies including...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CandidateDetailScreen(candidate: candidates[index]),
                ),
              );
            },
            child: CandidateCard(candidate: candidates[index]),
          );
        },
      ),
    );
  }
}
