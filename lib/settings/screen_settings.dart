import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seeings')),
      body: Center(
        child: Column(
          children: [
            Text('build',style: TextStyle(color:Colors.cyan),)
            //  Switch(value: null, onChanged: null)
          ],
        ),
      ),
    );
  }
}
