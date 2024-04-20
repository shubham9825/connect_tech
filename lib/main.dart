import 'package:flutter/material.dart';
import 'package:connect_tech/screens/home_screen.dart';
import 'package:connect_tech/screens/candidate.dart';
import 'package:connect_tech/screens/job_listings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Tech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(connectedCandidates: []),
      routes: {
        '/candidates': (context) => CandidatesScreen(),
        '/joblistings': (context) => JobListingsScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: null,
            ),
            ListTile(
              title: Text('Candidates'),
              onTap: () {
                Navigator.pushNamed(context, '/candidates');
              },
            ),
            ListTile(
              title: Text('JobListings'),
              onTap: () {
             //   Navigator.pushNamed(context, '/joblistings');
              },
            ),

          ],
        ),
      ),
      body: const Center(
        child: Text('Main Content'),
      ),
    );
  }
}
