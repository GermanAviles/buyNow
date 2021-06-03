
import 'package:buy_now/app/modules/orders-list/orders_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListController>(
      builder: (_){
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Compras'),
            ),
          )
        );
      },
    );
  }
}