// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {

  OrderModel({
    this.id,
    this.fechaCompra,
    this.totalCompra,
  });

  String id;
  String fechaCompra;
  int totalCompra;

  OrderModel.fromDocumentSnapshot( DocumentSnapshot doc ) {
    id           = doc.id;
    fechaCompra  = doc["fechaCompra"];
    totalCompra  = doc["totalCompra"];
  }

}
