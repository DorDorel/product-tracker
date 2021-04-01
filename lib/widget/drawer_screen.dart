import 'package:flutter/material.dart';
import 'package:product_tracker/auth/auth.dart';
import 'package:product_tracker/screen/about.dart';
import 'package:product_tracker/screen/add_new_product/screen_add_new_product.dart';
import 'package:product_tracker/screen/find_client/screen_find_client.dart';
import 'package:product_tracker/settings/screen_settings.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add_box,
              color: Colors.green,
            ),
            title: Text('Add new product'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddNewProduct())),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.amber,
            ),
            title: Text('Find Client '),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FindClient()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text('Settings'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text('Logout'),
            onTap: () => {
              context.read<AuthenticationService>().signOut()
              // Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutPage()))
            },
          ),
        ],
      ),
    );
  }
}
