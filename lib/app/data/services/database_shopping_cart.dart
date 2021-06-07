

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseShoppingCart {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future< QuerySnapshot<Map<String, dynamic>> > getPendingCart() {
    try {
      return _firestore.collection('carritos').where('status', isEqualTo: 'pending').get();
    } catch (e) {
      rethrow;
    }
  }

  Future< QuerySnapshot<Map<String, dynamic>> > getShoppingCart( uidShoppingCart ) {
    try {
      return _firestore.collection('productos_carrito').where('carrito_id', isEqualTo: uidShoppingCart).get();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateStateShoppingCart( String uid, String newState ) {
    return _firestore.collection('carritos').doc( uid ).update({ 'status': newState });
  }

  Future<Map<String, String>> createShoppingCart() async {
    String uidCarrito = _firestore.collection('carritos').doc().id.toString();
    String uidProductsCart = '';

    await _firestore.collection('carritos').doc( uidCarrito ).set({
      "createAt": Timestamp.fromDate( DateTime.now() ),
      "id": uidCarrito,
      "status": "pending"
    });

    uidProductsCart = _firestore.collection('productos_carrito').doc().id.toString();
    await _firestore.collection('productos_carrito').doc( uidProductsCart ).set({
      "carrito_id": uidCarrito,
      "id": uidProductsCart,
      "productos": []
    });

    return { "uidCarrito": uidCarrito, "uidProductsCart": uidProductsCart };
  }

  Future<void> addProductToShoppingCart( String uidProductCart, List<Map<String, dynamic>> productos ) {
    return _firestore.collection('productos_carrito').doc( uidProductCart ).update({
      "productos": productos
    });
  }

}