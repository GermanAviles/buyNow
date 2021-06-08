
import 'package:buy_now/app/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseOrders {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<OrderModel>> getOrders() {
    return _firestore.collection('pedidos').withConverter(
      fromFirestore: (snapshots, _) => OrderModel.formJson( snapshots.data() ),
      toFirestore: (producto, _) => producto.toJson()
    ).snapshots();
  }

  Future<OrderModel> getOrder( String uid ) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('pedidos').doc( uid ).get();
      return OrderModel.fromDocumentSnapshot( doc );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<String> createOrder( Map<String, dynamic> order ) async {
    String uidOrder = _firestore.collection('pedidos').doc().id.toString();
    order['id'] = uidOrder;
    await _firestore.collection('pedidos').doc(uidOrder).set( order );
    return uidOrder;
  }

}