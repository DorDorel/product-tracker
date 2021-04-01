import 'package:flutter/material.dart';
import 'package:product_tracker/database/models/activateProductModel.dart';

class HomePageCard extends StatelessWidget {
  final List<ActivateProductModel> activateProduct;
  final int index;
  HomePageCard({@required this.activateProduct, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
          title: Text(
            activateProduct[index].clientName,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.red[200]),
          ),
          subtitle: Text(
            activateProduct[index].product,
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(Icons.mode_edit, color: Colors.grey),
                onPressed: () {
                  print('TODO THIS!!');
                })
          ],
        ),
      ]),
    );
  }
}
