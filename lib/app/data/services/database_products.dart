
// import 'package:buy_now/app/data/models/product_model.dart';
import 'package:buy_now/app/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseProducts {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<ProductModel>> obtenerProductos() {
    return _firestore.collection('productos').withConverter(
      fromFirestore: (snapshots, _) => ProductModel.formJson( snapshots.data() ),
      toFirestore: (producto, _) => producto.toJson()
    ).snapshots();
  }

  Future<ProductModel> getProduct( String uid ) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('productos').doc( uid ).get();
      return ProductModel.fromDocumentSnapshot( doc );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}