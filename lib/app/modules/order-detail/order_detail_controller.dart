import 'package:buy_now/app/data/models/order_model.dart';
import 'package:buy_now/app/data/services/database_orders.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderDetailController extends GetxController {

  BuildContext    _context;
  final           firestoreService    = Get.find<DatabaseOrders>();
  Rx<OrderModel>  _order              = OrderModel().obs;

  BuildContext  get context => _context;
  OrderModel    get order   => _order.value;

  updateContext( BuildContext context ) {
    _context = context;
  }

  getOrder() async {
    final orderUID = Get.arguments;
    _order.value = await firestoreService.getOrder( orderUID );
  }

  @override
  void onInit() {
    super.onInit();
    getOrder();
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