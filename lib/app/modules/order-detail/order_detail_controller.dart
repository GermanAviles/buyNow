import 'package:buy_now/app/data/models/order_model.dart';
import 'package:buy_now/app/data/services/database_orders.dart';
import 'package:buy_now/app/routes/pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderDetailController extends GetxController {

  BuildContext    _context;
  final           firestoreService    = Get.find<DatabaseOrders>();
  Rx<OrderModel>  _order              = OrderModel().obs;
  Map<String, dynamic> paramsPage;

  BuildContext  get context => _context;
  OrderModel    get order   => _order.value;

  updateContext( BuildContext context ) {
    _context = context;
  }

  onBackPressed() {
    if (paramsPage['goHome']) {
      Navigator.pushReplacementNamed(context, Routes.HOME);
    } else {
      Navigator.pop(context);
    }
  }

  getOrder() async {
    paramsPage = Get.arguments;
    _order.value = await firestoreService.getOrder( paramsPage['uid'] );
  }

  @override
  void onInit() {
    super.onInit();
    getOrder();
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