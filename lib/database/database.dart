import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_tracker/database/models/clientModel.dart';
import 'package:product_tracker/database/models/productTypeModel.dart';
import 'models/activateProductModel.dart';
import 'models/productModel.dart';

class DatabaseService {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  //collections reference
  final CollectionReference productCollection = _db.collection('product');
  final CollectionReference clientCollection = _db.collection('client');
  final CollectionReference activateProductCollection =
      _db.collection('activateProduct');
  final CollectionReference productTypeCollection =
      _db.collection('productType');

  Future<void> newProduct(ProductModel product) async {
    try {
      return await productCollection.add(product.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ProductModel>> getProductList() async {
    List<ProductModel> productList = [];
    try {
      QuerySnapshot snapshot = await productCollection.get();
      snapshot.docs.forEach((element) {
        productList.add(ProductModel.fromMap(element.data()));
      });
    } catch (e) {
      print(e.toString());
    }
    return productList;
  }

  Future<String> activateNewProduct(ActivateProductModel product) async {
    String activateDocRef = '';
    try {
      return await activateProductCollection
          .add(product.toMap())
          .then((DocumentReference docRef) => activateDocRef = docRef.id);
    } catch (e) {
      print(e.toString());
      activateDocRef = e.toString();
    }
    return activateDocRef;
  }

  Future<void> addClient(ClientModel client) async {
    try {
      return await clientCollection.add(client.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addProductType(ProductTypeModel productType) async {
    try {
      return await productTypeCollection.add(productType.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ProductTypeModel>> getProductTypeList() async {
    List<ProductTypeModel> productTypeList = [];
    try {
      QuerySnapshot snapshot = await productTypeCollection.get();
      snapshot.docs.forEach((element) {
        productTypeList.add(ProductTypeModel.fromMap(element.data()));
      });
    } catch (e) {
      print(e.toString());
    }
    return productTypeList;
  }

  Stream<List<ActivateProductModel>> streamTodayActivated() {
    try {
      return activateProductCollection.snapshots().map((snapshot) => snapshot
          .docs
          .map((doc) => ActivateProductModel.fromMap(doc.data()))
          .toList());
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<DocumentSnapshot> findActivateProductById(String docRef) async {
    return await activateProductCollection.doc(docRef).get();
  }

  Future<ClientModel> findClientByClientId(String clientId) async {
    try {
      QuerySnapshot currentClient =
          await clientCollection.where('clientId', isEqualTo: clientId).get();
      return ClientModel.fromMap(currentClient.docs.first.data());
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<ClientModel> findClientByPhoneNumber(String clientPhoneNumber) async {
    try {
      QuerySnapshot currentClient = await clientCollection
          .where('clientPhone', isEqualTo: clientPhoneNumber)
          .get();
      return ClientModel.fromMap(currentClient.docs.first.data());
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
} // end database.dart file
