
import 'package:buy_now/app/modules/orders-list/local_widgets/card_order.dart';
import 'package:buy_now/app/modules/orders-list/orders_list_controller.dart';
import 'package:buy_now/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListController>(
      builder: (_){
        _.updateContext(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Compras',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            body: body(_),
          )
        );
      },
    );
  }

  body( OrderListController _ ){
    final width = MediaQuery.of( _.context ).size.width;
    final height = MediaQuery.of( _.context ).size.height;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric( horizontal: 10, vertical: 20 ),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, index){
          return GestureDetector(
            onTap: () {
              Get.toNamed( Routes.ORDERDETAIL, arguments: '3904123' );
            },
            child: CardOrder(
              id: '3904123',
              fechaCompra: DateFormat('dd/MM/yyyy').format( DateTime.now() ),
              height: 100,
              width: width,
              totalCompra: 200000
            ).build(),
          );
        }
      ),
    );
  }
}