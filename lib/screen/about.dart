import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: Column(
          children: [
            Text('Git Repo: *link*'),
            Text('Made With Love In FLUTTER'),
          ],
        ),
      ),
    );
  }
}
