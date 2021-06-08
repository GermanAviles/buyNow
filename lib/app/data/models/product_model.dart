// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {

  ProductModel({
    this.id,
    this.nombre,
    this.descripcion,
    this.precio,
    this.sku,
    this.imgURL
  });

  String id;
  String imgURL;
  String nombre;
  String descripcion;
  int precio;
  String sku;

  ProductModel.fromDocumentSnapshot( DocumentSnapshot doc ) {
    id           = doc.id;
    nombre       = doc["nombre"];
    descripcion  = doc["descripcion"];
    precio       = doc["precio"];
    sku          = doc["sku"];
    imgURL       = doc["imgURL"];
  }

  ProductModel.formJson( Map<String, Object> json ) : this(
    // precios: (json['id'] as List).cast<String>(),
    id:           (json['id'] as String),
    nombre:       (json['nombre'] as String),
    precio:       (json['precio'] as int),
    descripcion:  (json['descripcion'] as String),
    sku:          (json['sku'] as String),
    imgURL:       (json['imgURL'] as String)
  );

  Map<String, Object> toJson() {
    return {
      'id':          id,
      'nombre':      nombre,
      'precio':      precio,
      'descripcion': descripcion,
      'sku':         sku,
      'imgURL':      imgURL
    };
  }

}
