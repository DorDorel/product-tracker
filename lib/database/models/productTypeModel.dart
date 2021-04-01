import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductTypeModel {
  String type;
  ProductTypeModel({@required this.type});

  Map<String, dynamic> toMap() {
    return {"type": type};
  }

  factory ProductTypeModel.fromMap(Map<String, dynamic> fireStoreObj) {
    ProductTypeModel currentType = ProductTypeModel(type: fireStoreObj['type']);
    return currentType;
  }
}
