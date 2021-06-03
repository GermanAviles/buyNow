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

}
