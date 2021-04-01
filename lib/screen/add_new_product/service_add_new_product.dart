import 'package:product_tracker/database/database.dart';
import 'package:product_tracker/database/models/productModel.dart';
import 'package:product_tracker/database/models/productTypeModel.dart';

void addNewProduct(String productId, String productName, String productType,
    String productModel) {
  if (productId == null || productName == null || productType == null) {
    print('error one or more is null -fix it');
  } else {
    ProductModel newProduct = ProductModel(
        id: productId,
        name: productName,
        type: productType,
        model: productModel);
    DatabaseService().newProduct(newProduct);
  }
}


Future<List> typeListLoader() async {
  List typeList = [];
  List pl = await DatabaseService().getProductTypeList();
  pl.forEach((element) {
    typeList.add(element.type);
  });
  return typeList;
}

void addProductType(String newProductType) {
  ProductTypeModel newType = ProductTypeModel(type: newProductType);
  DatabaseService().addProductType(newType);
}
