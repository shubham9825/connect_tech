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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(candidate.imageUrl),
          ),
          const SizedBox(height: 20),
          Text(
            candidate.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              candidate.description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
