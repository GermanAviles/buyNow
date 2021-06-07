// import 'package:dio/dio.dart';
import 'package:buy_now/app/data/services/database_products.dart';
import 'package:buy_now/app/data/services/database_shopping_cart.dart';
import 'package:get/get.dart';

class DependencyInjection{

  static void init() {
    Get.lazyPut(() => DatabaseProducts(), fenix: true );
    Get.lazyPut(() => DatabaseShoppingCart(), fenix: true );
    // Get.lazyPut(() => (), fenix: true );
  }
}