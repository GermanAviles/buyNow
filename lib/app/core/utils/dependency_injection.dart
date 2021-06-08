// import 'package:dio/dio.dart';
import 'package:buy_now/app/data/services/database_orders.dart';
import 'package:buy_now/app/data/services/database_products.dart';
import 'package:buy_now/app/data/services/database_shopping_cart.dart';
import 'package:get/get.dart';

class DependencyInjection{

  static void init() {
    Get.lazyPut(() => DatabaseProducts() );
    Get.lazyPut(() => DatabaseShoppingCart() );
    Get.lazyPut(() => DatabaseOrders(), fenix: true);
    // Get.lazyPut(() => (), fenix: true );
  }
}