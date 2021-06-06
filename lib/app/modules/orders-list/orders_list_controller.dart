import 'package:buy_now/app/data/models/order_model.dart';
import 'package:buy_now/app/data/services/database_orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderListController extends GetxController {

  BuildContext       _context;
  final              firestoreService  = Get.find<DatabaseOrders>();
  RxList<OrderModel> _orders           = <OrderModel>[].obs;

  BuildContext        get context => _context;
  RxList<OrderModel>  get orders  => _orders;

  updateContext( BuildContext context ) {
    _context = context;
  }

  getOrders() {
    final Stream<QuerySnapshot<OrderModel>> docs = firestoreService.getOrders();
    docs.listen((event) {
      _orders.clear();
      for( final doc in event.docs ) {
        _orders.add( doc.data() );
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getOrders();
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