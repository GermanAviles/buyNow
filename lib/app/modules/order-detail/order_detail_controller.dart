import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderDetailController extends GetxController {

  BuildContext _context;

  get context => _context;

  updateContext( BuildContext context ) {
    _context = context;
  }

  @override
  void onInit() {
    super.onInit();
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