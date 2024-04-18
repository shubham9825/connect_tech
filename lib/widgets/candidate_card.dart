import 'package:flutter/material.dart';
import '../models/candidate.dart';

class CandidateCard extends StatelessWidget {
  final Candidate candidate;

  CandidateCard({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(candidate.imageUrl),
        ),
        title: Text(candidate.name),
        subtitle: Text(candidate.role),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Connected successfully'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Text('Connect'),
        ),
      ),
    );
  }
}
