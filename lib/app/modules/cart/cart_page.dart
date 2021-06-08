
import 'package:buy_now/app/global_widgets/loading.dart';
import 'package:buy_now/app/modules/cart/cart_controller.dart';
import 'package:buy_now/app/modules/cart/local_widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  // const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (_){
        _.updateContext(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Carrito',
                style: GoogleFonts.ubuntu(),
              ),
            ),
            body: Stack(
              children: [
                body( _ ),
                Obx((){
                  return _.cargando.value ? Loading(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height
                  ).build() : Center();
                })
              ],
            ),
          )
        );
      }
    );
  }

  Widget body( CartController _ ) {
    final width = MediaQuery.of(_.context).size.width;
    final height = MediaQuery.of(_.context).size.height;

    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(_.context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: GetBuilder<CartController>(
                id: 'lista-productos',
                builder: (_){
                  final products = _.cart.value.productos;
                  return ListView.builder(
                    padding: EdgeInsets.symmetric( vertical: 10, horizontal: 5 ),
                    itemCount: products?.length ?? 0,
                    itemBuilder: (BuildContext context, index) {
                      return ProductCard(
                        nombre: products[index]['nombre'],
                        cantidad: products[index]['cantidad'],
                        precio: products[index]['precio'],
                        width: width,
                        height: 150,
                        index: index
                      ).build();
                    },
                  );
                },
              )
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: width,
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
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, -1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric( horizontal: 10, vertical: 10 ),
                      margin: EdgeInsets.only( bottom: 10 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Total',
                              style: GoogleFonts.ubuntu(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          GetBuilder<CartController>(
                            id: 'total-compra',
                            builder: (_){
                              return Container(
                                child: Text(
                                  '\$ ${ _.cart.value.total != null ? _.cart.value.total.toStringAsFixed(0) : ''  }',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              );
                            }
                          )
                          // Obx((){
                          //   return ;
                          // })
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.9,
                      height: 40,
                      // padding: EdgeInsets.only( bottom: 10 ),
                      // margin: EdgeInsets.only( bottom: 10 ),
                      child: MaterialButton(
                        onPressed: _.crearOrden,
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Pagar ahora',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}