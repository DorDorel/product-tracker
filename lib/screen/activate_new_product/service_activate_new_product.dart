import 'package:product_tracker/database/database.dart';
import 'package:product_tracker/database/models/activateProductModel.dart';
import 'package:product_tracker/database/models/clientModel.dart';

Future<String> activateNewProduct(
    {String clientId,
    String clientName,
    String clientEmail,
    String clinetPhone,
    String product}) async {
  ActivateProductModel newProduct = ActivateProductModel(
      clientId: clientId,
      clientName: clientName,
      clientEmail: clientEmail,
      clientPhone: clinetPhone,
      product: product);

  dynamic activeDocRef = await DatabaseService().activateNewProduct(newProduct);
  dynamic verification =
      await DatabaseService().findActivateProductById(activeDocRef);
  if (verification.id == activeDocRef) {
    addClient(newProduct);
    return verification.id;
  }
  return null;
}

Future<List> productListLoader() async {
  List productList = [];
  List pl = await DatabaseService().getProductList();
  pl.forEach((element) {
    productList.add(element.name);
  });
  return productList;
}

void addClient(ActivateProductModel newProduct) async {
  ClientModel checkClient =
      await DatabaseService().findClientByClientId(newProduct.clientId);
  print("irepow" + checkClient.clientId);

  // if (checkClient != null || checkClient.clientId != newProduct.clientId) {
  //   ClientModel client = ClientModel(
  //       clientId: newProduct.clientId,
  //       clientName: newProduct.clientName,
  //       clientEmail: newProduct.clientEmail,
  //       clientPhone: newProduct.clientPhone);
  //   DatabaseService().addClient(client);
  // }
}
