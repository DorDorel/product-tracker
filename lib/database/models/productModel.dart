import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String id;
  String type;
  String model;
  String name;

  ProductModel({@required this.id, @required this.model, this.type, this.name});

  Map<String, dynamic> toMap() {
    return {"id": id, "type": type, "model": model, "name": name};
  }

  factory ProductModel.fromMap(Map<String, dynamic> firestoreObj) {
    ProductModel productObj = ProductModel(
        id: firestoreObj['id'],
        model: firestoreObj['model'],
        name: firestoreObj['name'],
        type: firestoreObj['type']);
    return productObj;
  }
}
