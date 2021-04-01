import 'package:flutter/material.dart';

class OkButton extends StatelessWidget {
  final String title;
  final Function tap;
  OkButton({this.title, this.tap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.greenAccent,
        color: Colors.green,
        elevation: 7.0,
        child: TextButton(
            onPressed: tap,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            )),
      ),
    );
  }
}
