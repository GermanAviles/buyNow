
import 'package:buy_now/app/data/services/database_orders.dart';
import 'package:buy_now/app/modules/orders-list/orders_list_controller.dart';
import 'package:get/get.dart';

class OrderListBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<OrderListController>(() => OrderListController() );
    Get.lazyPut<DatabaseOrders>(() => DatabaseOrders() );
  }
}