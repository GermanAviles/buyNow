import 'package:buy_now/app/modules/cart/cart_binding.dart';
import 'package:buy_now/app/modules/cart/cart_page.dart';
import 'package:buy_now/app/modules/home/home_binding.dart';
import 'package:buy_now/app/modules/home/home_page.dart';
import 'package:buy_now/app/modules/order-detail/order_detail_binding.dart';
import 'package:buy_now/app/modules/order-detail/order_detail_page.dart';
import 'package:buy_now/app/modules/orders-list/orders_list_binding.dart';
import 'package:buy_now/app/modules/orders-list/orders_list_page.dart';
import 'package:buy_now/app/modules/product-detail/product_detail_binding.dart';
import 'package:buy_now/app/modules/product-detail/product_detail_page.dart';
import 'package:get/get.dart';

part './routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.CART,
      page: () => CartPage(),
      binding: CartBinding()
    ),
    GetPage(
      name: Routes.ORDERDETAIL,
      page: () => OrderDetailPage(),
      binding: OrderDetailBinding()
    ),
    GetPage(
      name: Routes.ORDERLIST,
      page: () => OrderListPage(),
      binding: OrderListBinding()
    ),
    GetPage(
      name: Routes.PRODUCTDETAIL,
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding()
    ),
  ];
}
