
import 'package:buy_now/app/modules/order-detail/local_widgets/card_detalle.dart';
import 'package:buy_now/app/modules/order-detail/local_widgets/item_product.dart';
import 'package:buy_now/app/modules/order-detail/order_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      builder: (_) {
        _.updateContext(context);
        return WillPopScope(
          onWillPop: () => _.onBackPressed(),
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Detalle de la compra',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              body: body(_),
            )
          ),
        );
      }
    );
  }

  body(OrderDetailController _) {
    final width = MediaQuery.of( _.context ).size.width;
    final height = MediaQuery.of( _.context ).size.height;

    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10, vertical: 10 ),
      width: width,
      height: height,
      child: Column(

        children: [
          Flexible(
            flex: 3,
            child: Obx((){
              return CardDetalle(
                numero: _.order.numero ?? '',
                fecha: DateFormat('dd/MM/yyyy').format( _.order.fechaCompra ?? DateTime.now() ),
                total: _.order.totalCompra ?? 0
              ).build();
            })
          ),
          Flexible(
            flex: 6,
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.only( top: 20, left: 20, right: 20, bottom: 20 ),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // margin: EdgeInsets.only( bottom: 20 ),
                      child: Text(
                        'Producto(s)',
                        style: GoogleFonts.ubuntu(
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Obx((){
                      return ListView.builder(
                        itemCount: _.order.productos?.length ?? 0,
                        itemBuilder: (BuildContext context, index){
                          return ItemProduc(
                            width: width,
                            height: 90,
                            cantidad: _.order.productos[ index ]['cantidad'],
                            nombre: _.order.productos[ index ]['nombre'],
                            valor: _.order.productos[ index ]['precio']

                          ).build();
                        }
                      );
                    })
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}