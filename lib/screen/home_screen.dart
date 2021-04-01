import 'package:flutter/material.dart';
import 'package:product_tracker/database/models/activateProductModel.dart';
import 'package:product_tracker/screen/activate_new_product/screen_activate_new_product.dart';
import 'package:product_tracker/screen/user_profile.dart';
import 'package:product_tracker/widget/drawer_screen.dart';
import 'package:product_tracker/widget/home_page_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final activateProduct = Provider.of<List<ActivateProductModel>>(context);
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.red[200],
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              })
        ],
        title: Text(
          'Company Name',
        ),
      ),
      body: (activateProduct != null)
          ? ListView.builder(
              itemCount: activateProduct.length,
              itemBuilder: (context, index) {
                return HomePageCard(
                    activateProduct: activateProduct, index: index);
              },
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red[200],
        elevation: 7.0,
        icon: Icon(
          Icons.add,
          size: 20.0,
        ),
        label: Text(
          'Activate',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ActivateNewProduct()));
        },
      ),
    );
  }
}
