// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {

  ProductModel({
    this.id,
    this.nombre,
    this.descripcion,
    this.precio,
  });

  String id;
  String nombre;
  String descripcion;
  int precio;

  ProductModel.fromDocumentSnapshot( DocumentSnapshot doc ) {
    id           = doc.id;
    nombre       = doc["nombre"];
    descripcion  = doc["descripcion"];
    precio       = doc["precio"];
  }

  ProductModel.formJson( Map<String, Object> json ) : this(
    // precios: (json['id'] as List).cast<String>(),
    id:           (json['id'] as String),
    nombre:       (json['nombre'] as String),
    precio:       (json['precio'] as int),
    descripcion:  (json['descripcion'] as String)
  );

  Map<String, Object> toJson() {
    return {
      'id':          id,
      'nombre':      nombre,
      'precio':      precio,
      'descripcion': descripcion
    };
  }

}
