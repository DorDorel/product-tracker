import 'package:flutter/material.dart';
import 'package:product_tracker/screen/confirmation_screen/screen_confirmation.dart';
import 'package:product_tracker/widget/ok_button.dart';
import 'service_activate_new_product.dart';

class ActivateNewProduct extends StatefulWidget {
  @override
  _ActivateNewProduct createState() => _ActivateNewProduct();
}

class _ActivateNewProduct extends State<ActivateNewProduct> {
  String productName;
  String clientId;
  String clientName;
  String clientMail;
  String clintPhone;
  String productId;
  void setProduct(String product) {
    setState(() {
      productName = product;
    });
  }

  bool cheekForm() {
    if (productName != null &&
        clientId != null &&
        clientMail != null &&
        clintPhone != null &&
        clientName != null) {
      return true;
    }
    return false;
  }

  Future<void> active() async {
    // print(checkIfClientExists(clientId));
    String activeObj = await activateNewProduct(
        product: productName,
        clientName: clientName,
        clientId: clientId,
        clientEmail: clientMail,
        clinetPhone: clintPhone);
    if (activeObj != null) {
      print(activeObj);
      productId = activeObj;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activate new product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SelectProduct(setProduct: setProduct),
            TextField(
              decoration: InputDecoration(
                hintText: 'Client ID',
                hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              onChanged: (value) => {clientId = value},
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Client Name',
                hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              onChanged: (value) => {clientName = value},
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Client Mail',
                hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              onChanged: (value) => {clientMail = value},
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Client Phone',
                hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              onChanged: (value) => {clintPhone = value},
            ),
            SizedBox(
              height: 20.0,
            ),
            OkButton(
                title: 'Next',
                tap: () async {
                  if (cheekForm()) {
                    await active();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Confirmation(
                              productId: productId,
                            )));
                  } else {
                    Text('error');
                    //todo: build Error text widget
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class SelectProduct extends StatefulWidget {
  final Function setProduct;
  SelectProduct({this.setProduct});
  @override
  _SelectProductState createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  String selectedProduct;
  List products = List();
  Future getTypes() async {
    var response = await productListLoader();
    setState(() {
      products = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0),
      child: DropdownButton(
          icon: Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
          value: selectedProduct,
          hint: Text(
            'Select Product',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          items: products.map((list) {
            return DropdownMenuItem(child: Text(list), value: list);
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedProduct = value;
              widget.setProduct(value);
            });
          }),
    );
  }
}
