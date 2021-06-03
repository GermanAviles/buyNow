
import 'package:buy_now/app/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> obtenerProductos() async {
    try {
      final productos = await _firestore.collection("productos").get();
      // final productossda = _firestore.collection("productos").snapshots();
      print(productos);
    } catch (e) {
      print(e);
    }
  }

}