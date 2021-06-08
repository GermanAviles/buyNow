
import 'package:buy_now/app/data/models/product_model.dart';
import 'package:buy_now/app/data/services/database_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart' show required;
import 'package:get/get.dart';

class HomeController extends GetxController {

  BuildContext         _context;
  final                firestoreService   = Get.find<DatabaseProducts>();
  RxList<ProductModel> _productos         = <ProductModel>[].obs;

  BuildContext          get context   => _context;
  RxList<ProductModel>  get productos => _productos;

  updateContext( BuildContext context ) {
    _context = context;
  }

  @override
  void onInit() {
    super.onInit();

    Stream<QuerySnapshot<ProductModel>> productos = this.firestoreService.obtenerProductos();
    productos.listen((event) {
      _productos.clear();
      for( final producEvent in event.docs ){
        _productos.add( producEvent.data() );
      }
    });

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}