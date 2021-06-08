
import 'dart:math';

import 'package:buy_now/app/data/models/cart_model.dart';
import 'package:buy_now/app/data/services/database_orders.dart';
import 'package:buy_now/app/data/services/database_products.dart';
import 'package:buy_now/app/data/services/database_shopping_cart.dart';
import 'package:buy_now/app/routes/pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  BuildContext  _context;
  final         shoppingCartService   = Get.find<DatabaseShoppingCart>();
  final         productsService       = Get.find<DatabaseProducts>();
  final         orderService          = Get.find<DatabaseOrders>();
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
    update(['lista-productos']);
  }

  actualizarCantidad( int indexProducto, String value ){
    final product = _cart.value.productos[ indexProducto ];
    product['cantidad'] = value.length > 0 ? int.parse( value ) : 0;
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

  crearOrden()async {

    Map<String, dynamic> orden = {
      'fechaCompra' : Timestamp.fromDate( DateTime.now() ),
      'numero'      : '${Random().nextInt(1000)}',
      'total'       : _cart.value.total.toInt(),
      'productos'   : _cart.value.productos
    };

    final orderId = await orderService.createOrder( orden );
    await shoppingCartService.updateStateShoppingCart(_cart.value.carritoId, 'completed');
    print(orderId);
    Navigator.pushNamed(context, Routes.ORDERDETAIL, arguments: { 'uid': orderId, 'goHome': true });
  }

  eliminarProducto( int indexProduct ) {
    final idProd = _cart.value.productos[indexProduct]['producto_id'];
    final List<Map<String,dynamic>> productosFinales = [];

    for( final prod in _cart.value.productos ) {
      if (prod['producto_id'] != idProd) {
        print('');
        productosFinales.add(prod);
      }
    }
    _cart.value.productos = productosFinales;
    calcularTotal(productosFinales);
    update(['lista-productos']);
    shoppingCartService.addProductToShoppingCart(_cart.value.id, productosFinales);
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