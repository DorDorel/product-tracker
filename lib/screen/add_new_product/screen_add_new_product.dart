import 'package:flutter/material.dart';
import 'package:product_tracker/screen/add_new_product/service_add_new_product.dart';
import 'package:product_tracker/widget/ok_button.dart';

class AddNewProduct extends StatefulWidget {
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  String id;
  String name;
  String type;
  String model;
  bool newType = false;
  void closeNewType() {
    setState(() {
      newType = false;
    });
  }

  void setType(String typeSelect) {
    type = typeSelect;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(hintText: ' Product ID'),
              onChanged: (value) => {id = value},
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Product Name'),
              onChanged: (value) => {name = value},
            ),
            SelectType(typeSelect: setType),
            TextButton(
              onPressed: () {
                setState(() {
                  newType = !newType;
                });
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child:
                    Text('New type?', style: TextStyle(color: Colors.red[200])),
              ),
            ),
            Container(
                child: newType
                    ? AddType(
                        closeAdd: closeNewType,
                      )
                    : null),
            TextField(
              decoration: InputDecoration(hintText: 'Product Model'),
              onChanged: (value) => {model = value},
            ),
            SizedBox(
              height: 20.0,
            ),
            OkButton(
              title: 'Save',
              tap: () {
                addNewProduct(id, name, type, model);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

class AddType extends StatelessWidget {
  final Function closeAdd;
  AddType({this.closeAdd});
  @override
  Widget build(BuildContext context) {
    String currentType;
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'New type'),
          onChanged: (val) => {currentType = val},
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            onPressed: () {
              addProductType(currentType);
              closeAdd();
            },
            color: Colors.red[200],
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

class SelectType extends StatefulWidget {
  final Function typeSelect;
  SelectType({this.typeSelect});
  @override
  _SelectTypeState createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  String selectedType;
  List types = List();
  Future getTypes() async {
    var response = await typeListLoader();
    setState(() {
      types = response;
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
          // underline:,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
          value: selectedType,
          hint: Text('Select Type'),
          items: types.map((list) {
            return DropdownMenuItem(child: Text(list), value: list);
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedType = value;
              widget.typeSelect(value);
            });
          }),
    );
  }
}
