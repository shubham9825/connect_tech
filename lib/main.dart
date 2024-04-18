import 'package:flutter/material.dart';
import 'package:connect_tech/screens/candidate.dart';

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
      home: MainScreen(),
      routes: {
        '/candidates': (context) => CandidatesScreen(),
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
      drawer: Container(
        color: Color(0xFFFCFCFC),
        child: Drawer(
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
                  child: null
              ),
              ListTile(
                title: Text('Candidates'),
                onTap: () {
                  Navigator.pushNamed(context, '/candidates');
                },
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('Main Content'),
      ),
    );
  }
}
