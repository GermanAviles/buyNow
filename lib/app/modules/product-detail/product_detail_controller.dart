import 'package:buy_now/app/data/models/product_model.dart';
import 'package:buy_now/app/data/services/database_products.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductDetailController extends GetxController {

  BuildContext _context;

  final            firestoreService   = Get.find<DatabaseProducts>();
  Rx<ProductModel> _productModel      = ProductModel().obs;

  BuildContext get context => _context;
  ProductModel get product => _productModel.value;

  updateContext( BuildContext context) {
    _context = context;
  }

  getProduct( String uid ) async {
   _productModel.value = await firestoreService.getProduct(uid);
  }

  @override
  void onInit() {
    super.onInit();
    final parametro = Get.parameters;
    getProduct( parametro['id'] );
  }

  @override
  void onReady() {
    super.onReady();
    print('HomeController renderizado - Listo.');
  }

  @override
  void onClose() {
    super.onClose();
    print('HomeController eliminandose de memoria.');
  }
}