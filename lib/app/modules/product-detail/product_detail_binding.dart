
import 'package:buy_now/app/modules/product-detail/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController() );
  }
}