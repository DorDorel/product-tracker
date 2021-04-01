import 'package:flutter/material.dart';
import 'package:product_tracker/database/database.dart';

class FindClient extends StatefulWidget {
  @override
  _FindClientState createState() => _FindClientState();
}

class _FindClientState extends State<FindClient> {
  String clientId;

  String clientPhone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Client Id'),
              onChanged: (value) => clientId = value,
            ),
            RaisedButton(
              color: Colors.red[200],
              onPressed: () {
                DatabaseService().findClientByClientId(clientId);
              },
              child: Text('Find by Id'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Client Phone'),
              onChanged: (value) => clientPhone = value,
            ),
            RaisedButton(
              color: Colors.red[200],
              onPressed: () {
                DatabaseService().findClientByPhoneNumber(clientPhone);
              },
              child: Text('Find by Phone'),
            )
          ],
        ),
      ),
    );
  }
}
