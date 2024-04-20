import 'package:flutter/material.dart';
import '../widgets/candidate_card.dart';
import 'candidate_detail.dart';
import '../models/candidate.dart';

class CandidatesScreen extends StatelessWidget {
  final List<Candidate> candidates = [
    Candidate(
      name: "John Doe",
      imageUrl: "images/person1.jpg",
      description: "I graduated from the Computer Science Department at Waterloo University. "
          "Currently, I'm working at Meta in London, "
          "but I also have prior programming experience at startups and Amazon.",
      role: "React Js Developer, Meta",
      location: "London, England, United Kingdom",
      education: "Waterloo University",
    ),
    Candidate(
      name: "Emily Smith",
      imageUrl: "images/person2.jpg",
      description: "I am a passionate software engineer with a strong background in computer science. "
          "I have a keen interest in backend development and have honed my skills as a Node.js Developer. "
          "My experience includes working on various projects that involve building scalable and "
          "efficient server-side applications.",
      role: "Node Js Developer, Amazon",
      location: "Sydney, Australia",
      education: "The University of Western",
    ),
    Candidate(
      name: "Jai Maurya",
      imageUrl: "images/person3.jpg",
      description: "I am a recent graduate in Computer Engineering from Stanford University."
          "I have a strong foundation in software development "
          "and am eager to apply my skills in a professional environment. "
          "My interests include machine learning, data science, and web development.",
      role: "Software Engineer Intern, Google",
      location: "Toronto, Ontario, Canada",
      education: "University of Waterloo",
    ),
    Candidate(
      name: "Prof Nickolas",
      imageUrl: "images/person4.jpg",
      description: "I am an experienced full-stack developer with over 5 years of experience. "
          "I have worked on a variety of projects ranging from small startups to large corporations. "
          "My expertise includes front-end technologies such as React and Angular, "
          "as well as backend frameworks like Node.js and Django.",
      role: "Full Stack Developer, Microsoft",
      location: "Waterloo, Canada",
      education: "University of Toronto",
    ),
    Candidate(
      name: "Shubham Sheliya",
      imageUrl: "images/person5.jpg",
      description: "I am a software engineer specializing in full-stack development, proficient in languages such "
          "as JavaScript, Python, and Java. I have a strong foundation in data structures and algorithms, "
          "and I am experienced in building scalable web applications using frameworks like React and Django. "
          "My passion lies in solving complex problems and delivering high-quality software solutions that meet "
          "user needs and exceed expectations.",
      role: "UX Designer, Apple",
      location: "Kitchener, Ontario",
      education: "Laurier Wildfier University",
    ),
    Candidate(
      name: "Michael Jackson",
      imageUrl: "images/person6.jpg",
      description: "I am a cybersecurity analyst with a keen eye for detail and a passion for keeping systems secure. "
          "My background in network security and cryptography enables me to assess vulnerabilities, "
          "develop robust security protocols, and mitigate risks effectively. "
          "With proficiency in tools like Wireshark and Metasploit, I am dedicated to staying ahead "
          "of emerging threats and safeguarding sensitive information in today's digital landscape",
      role: "Data Scientist, Facebook",
      location: "Menlo Park, California, United States",
      education: "Stanford University",
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
              _navigateToCandidateDetail(context, candidates[index]);
            },
            child: CandidateCard(candidate: candidates[index]),
          );
        },
      ),
    );
  }

  void _navigateToCandidateDetail(BuildContext context, Candidate candidate) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: CandidateDetailScreen(candidate: candidate),
          );
        },
      ),
    );
  }
}