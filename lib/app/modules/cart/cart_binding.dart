
import 'package:buy_now/app/modules/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<CartController>(() => CartController() );
  }
}