// import 'package:dio/dio.dart';
import 'package:buy_now/app/data/services/database.dart';
import 'package:get/get.dart';

class DependencyInjection{

  static void init() {
    Get.lazyPut(() => Database() );
  }
}