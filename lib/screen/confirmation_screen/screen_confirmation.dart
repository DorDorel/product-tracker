import 'package:flutter/material.dart';
import 'package:product_tracker/screen/home_screen.dart';

class Confirmation extends StatefulWidget {
  final String productId;
  Confirmation({this.productId});
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confiram Activate')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              Icon(
                Icons.verified,
                size: 120,
                color: Colors.green[600],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text("Success!",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.w800)),
                ),
              ),
              Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.all(7.0),
                        padding: const EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: SelectableText(
                          widget.productId,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.greenAccent),
                          child: Text(
                            ' Product ID ',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.grey[500],
                  child: Text(
                    'Finish',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  onPressed: () {
                    //todo: send Warranty to client email
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
