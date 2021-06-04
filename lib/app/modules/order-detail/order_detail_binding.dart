
import 'package:buy_now/app/modules/order-detail/order_detail_controller.dart';
import 'package:get/get.dart';

class OrderDetailBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<OrderDetailController>(() => OrderDetailController() );
  }
}