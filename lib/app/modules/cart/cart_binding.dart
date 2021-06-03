
import 'package:buy_now/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {

  @override
  void dependencies() {

    // Get.lazyPut<HomeController>(() => HomeController( HomeRepository(MyApiGetConnect())) );
  }
}