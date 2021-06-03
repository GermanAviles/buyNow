
import 'package:buy_now/app/modules/home/home_repository.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart' show required;
import 'package:get/get.dart';

class HomeController extends GetxController {

  // final HomeRepository _homeRepository = Get.find<HomeRepository>();
  BuildContext _context;

  get context => _context;

  updateContext( BuildContext context ) {
    _context = context;
  }
  // Rx<>
  // final _obj = ''.obs;

  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
}