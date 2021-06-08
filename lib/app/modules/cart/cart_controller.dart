
import 'package:buy_now/app/data/models/cart_model.dart';
import 'package:buy_now/app/data/services/database_products.dart';
import 'package:buy_now/app/data/services/database_shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  BuildContext  _context;
  final         shoppingCartService   = Get.find<DatabaseShoppingCart>();
  final         productsService       = Get.find<DatabaseProducts>();
  Rx<CartModel> _cart                 = CartModel().obs;

  BuildContext  get context  => _context;
  Rx<CartModel> get cart     => _cart;

  updateContext( BuildContext context){
    _context = context;
  }

  cargarCarrito() async {
    final result = await shoppingCartService.getPendingCart();
    if (result.docs.length > 0) {
      final idCarritoActual = result.docs.first.id;
      final carritosProducto = await shoppingCartService.getShoppingCart( idCarritoActual );
      final carrito = carritosProducto.docs.first.data();

      _cart.value = CartModel(
        id: carritosProducto.docs.first.id,
        carritoId: carrito['carrito_id'],
        productos: carrito['productos'],
      );

      calcularTotal( carrito['productos'] );
    }
  }

  actualizarCantidad( int indexProducto, String value ){
    final product = _cart.value.productos[ indexProducto ];
    product['cantidad'] = int.parse( value );
    calcularTotal(_cart.value.productos);
  }

  calcularTotal( List<dynamic> productos ) {
    double total = 0;
    productos.forEach((element) {
      total += element['precio'] * element['cantidad'];
    });

    _cart.value.total = total;
    update(['total-compra']);
  }

  @override
  void onInit() {
    super.onInit();
    cargarCarrito();
  }

  @override
  void onReady() {
    super.onReady();
    print('HomeController renderizado - Listo.');
  }

  @override
  void onClose() {
    super.onClose();
    print('HomeController eliminandose de memoria.');
  }
}