import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {

  OrderModel({
    this.id,
    this.fechaCompra,
    this.totalCompra,
    this.numero,
    this.productos
  });

  String                        id;
  DateTime                      fechaCompra;
  int                           totalCompra;
  String                        numero;
  List< dynamic >  productos;

  OrderModel.fromDocumentSnapshot( DocumentSnapshot doc ) {
    id           = doc.id;
    fechaCompra  = (doc['fechaCompra'] as Timestamp).toDate();
    totalCompra  = doc['total'];
    numero       = doc['numero'];
    productos    = doc['productos'];
  }

  OrderModel.formJson( Map<String, Object> json ) : this(
    id:           (json['id']           as String),
    fechaCompra:  (json['fechaCompra']  as Timestamp).toDate(),
    totalCompra:  (json['total']        as int),
    numero:       (json['numero']       as String),
    productos:    (json['productos']    as List).cast< dynamic >()
  );

  Map<String, Object> toJson() {
    return {
      "id"           : id,
      "fechaCompra"  : fechaCompra,
      "total"        : totalCompra,
      "numero"       : numero,
      "productos"    : productos,
    };
  }

}
