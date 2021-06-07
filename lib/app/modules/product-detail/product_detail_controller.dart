import 'package:buy_now/app/data/models/product_model.dart';
import 'package:buy_now/app/data/services/database_products.dart';
import 'package:buy_now/app/data/services/database_shopping_cart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductDetailController extends GetxController {

  BuildContext _context;

  int              _cantidadComprar   = 1;
  final            firestoreService   = Get.find<DatabaseProducts>();
  final            carritoService     = Get.find<DatabaseShoppingCart>();
  Rx<ProductModel> _productModel      = ProductModel().obs;

  BuildContext get context          => _context;
  ProductModel get product          => _productModel.value;
  int          get cantidadComprar  => _cantidadComprar;

  updateContext( BuildContext context) {
    _context = context;
  }

  updateCantidadComprar( String nuevoValor ){
    _cantidadComprar = int.parse( nuevoValor );
    if (_cantidadComprar == 0) {
      _cantidadComprar = 1;
    }
  }

  agregarProductoCarrito() async {
    final List<Map<String, dynamic>> productosDelCarrito = [];

    Map<String, dynamic> productJson = {
      'cantidad': cantidadComprar,
      'precio': _productModel.value.precio,
      'producto_id': _productModel.value.id
    };

    final carritos = await carritoService.getPendingCart();

    if (carritos.docs.length > 0) {
      final idCarritoActual = carritos.docs.first.id;
      final carritosProducto = await carritoService.getShoppingCart( idCarritoActual );
      final carrito = carritosProducto.docs.first.data();

      for( final producto in carrito['productos'] ) {
        if ( producto['producto_id'] != _productModel.value.id ) {
          productosDelCarrito.add(producto);
        }
      }

      productosDelCarrito.add( productJson );
      carrito['productos'] = productosDelCarrito;
      await carritoService.addProductToShoppingCart(carritosProducto.docs.first.id, productosDelCarrito);
    } else {
      productosDelCarrito.add( productJson );
      final uids = await carritoService.createShoppingCart();
      carritoService.addProductToShoppingCart(uids['uidProductsCart'], productosDelCarrito);
    }
  }


  getProduct( String uid ) async {
   _productModel.value = await firestoreService.getProduct(uid);
  }

  @override
  void onInit() {
    super.onInit();
    final parametro = Get.parameters;
    getProduct( parametro['id'] );
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