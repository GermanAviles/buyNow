
import 'package:buy_now/app/modules/orders-list/orders_list_controller.dart';
import 'package:get/get.dart';

class OrderListBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<OrderListController>(() => OrderListController() );
  }
}