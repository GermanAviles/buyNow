
import 'package:buy_now/app/modules/product-detail/product_detail_controller.dart';
import 'package:buy_now/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatelessWidget {
  final FocusNode _focusCantidad = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (_){
        _.updateContext( context );
        return SafeArea(
          child: Scaffold(
            appBar: appbar( context ),
            body: body(_),
          )
        );
      },
    );
  }

  Widget appbar( BuildContext context ) {
    return AppBar(
      title: Text('Producto'),
      actions: [
        IconButton(
          tooltip: 'Carrito compras',
          icon: Icon( Icons.shopping_cart_outlined ),
          onPressed: () => Navigator.pushNamed(context, Routes.CART)
        )
      ],
    );
  }

  Widget body( ProductDetailController _ ) {
    final width = MediaQuery.of(_.context).size.width;
    final height = MediaQuery.of(_.context).size.height;

    return GestureDetector(
      onTap: (){
        if(_focusCantidad.hasFocus) _focusCantidad.unfocus();
      },
      child: ListView(
        padding: EdgeInsets.only( bottom: 40 ),
        children: [
          Container(
            width: width,
            height: height * 0.3,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric( horizontal: 20 ),
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx((){
                  return Container(
                    // height: 50,
                    margin: EdgeInsets.only( bottom: 25 ),
                    width: width,
                    child: Text(
                      _.product.nombre ?? '',
                      // overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ubuntu(
                        fontSize: 20,
                      ),
                    ),
                  );
                }),
                Obx((){
                  return Container(
                    width: width,
                    margin: EdgeInsets.only( bottom: 10 ),
                    child: Text(
                      '\$ ${_.product.precio}' ?? '',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w500,
                        fontSize: 30
                      ),
                    ),
                  );
                }),

                Container(
                  margin: EdgeInsets.only( top: 30 ),
                  child: TextField(
                    obscureText: false,
                    focusNode: _focusCantidad,
                    onChanged: _.updateCantidadComprar,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.ubuntu(),
                      hintStyle: GoogleFonts.ubuntu(),
                      labelText: 'Cantidad a comprar: 1',
                      hintText: '1',
                      filled: true,
                      fillColor: Colors.grey[100],
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only( top: 30 ),
                  child: ButtonTheme(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    height: 45,
                    minWidth: width,
                    child: MaterialButton(
                      onPressed: () => _.agregarProductoCarrito(true),
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Comprar ahora',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only( top: 10, bottom: 20 ),
                  child: ButtonTheme(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    height: 45,
                    minWidth: width,
                    child: MaterialButton(
                      onPressed: () => _.agregarProductoCarrito( false ),
                      color: Colors.blue[50],
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Agregar al carrito',
                        style: GoogleFonts.ubuntu(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.only( bottom: 20 ),
                  child: Text(
                    'Descripción',
                    style: GoogleFonts.ubuntu(
                      fontSize: 20
                    ),
                  ),
                ),
                Obx((){
                  return Container(
                    child: Text(
                    _.product.descripcion ?? '',
                    style: GoogleFonts.ubuntu(
                      fontSize: 20
                    ),
                  ),
                  );
                }),
              ],
            )
          )
        ],
      ),
    );
  }
}