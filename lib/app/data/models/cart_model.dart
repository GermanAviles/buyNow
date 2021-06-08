import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {

  CartModel({
    this.id,
    this.carritoId,
    this.productos,
    this.total,
  });

  String         id;
  String         carritoId;
  double         total;
  List<dynamic>  productos;

  CartModel.fromDocumentSnapshot( DocumentSnapshot doc ) {
    id            = doc.id;
    carritoId     = (doc['carritoId'] as String);
    total         = doc['total'];
    productos     = (doc['productos'] as List).cast<dynamic>();
  }

  CartModel.formJson( Map<String, Object> json ) : this(
    id:           (json['id']           as String),
    carritoId:    (json['fechaCompra']  as String),
    total:        (json['total']        as double),
    productos:    (json['numero']       as List).cast<dynamic>(),
  );

  Map<String, Object> toJson() {
    return {
      "id"         : id,
      "carritoId"  : carritoId,
      "total"      : total,
      "productos"  : productos,
    };
  }

}
