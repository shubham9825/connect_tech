import 'package:flutter/material.dart';
import '../widgets/candidate_card.dart';
import 'candidate_detail.dart';
import '../models/candidate.dart';

class CandidatesScreen extends StatelessWidget {
  final List<Candidate> candidates = [
    Candidate(
      name: "John Doe",
      imageUrl: "images/person1.jpg",
      description: "I graduated the Computer Science Department from Waterloo university. I am working at Meta in London, but I also have some prior programming experience at start-ups and Amazon.",
      role:"React Js Developer, Meta ",
      location:"London, England, United Kingdom",
      education:"Waterloo University"
    ),
    Candidate(
      name: "Emily Smith",
      imageUrl: "images/person2.jpg",
      description: "I am a passionate software engineer with a strong background in computer science. I have a keen interest in backend development and have honed my skills as a Node.js Developer. My experience includes working on various projects that involve building scalable and efficient server-side applications",
      role:"Node Js Developer, Amazon ",
      location:"Sydney, Australia",
      education:"The University of Western"
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
