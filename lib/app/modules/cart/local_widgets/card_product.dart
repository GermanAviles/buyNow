
import 'package:buy_now/app/modules/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart' show required;

class ProductCard {

  String  nombre;
  int     cantidad;
  int     precio;
  double  width;
  double  height;
  int     index;
  String  url;

  ProductCard({
    @required this.url,
    @required this.nombre,
    @required this.cantidad,
    @required this.precio,
    @required this.width,
    @required this.height,
    @required this.index,
  });

  Widget build() {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only( bottom: 10 ),
      padding: EdgeInsets.only( right: 10, bottom: 20 ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide( color: Colors.black12, width: 1 )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: Container(
              child: Image.network( url ),
            )
          ),
          Flexible(
            flex: 9,
            child: Container(
              padding: EdgeInsets.only( left: 10 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: GetBuilder<CartController>(
                      builder: (_){
                        return Stack(
                          children: [
                            Text(
                              '${nombre ?? ''}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.ubuntu(
                                fontSize: 17
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete_outline_sharp,
                                  color: Colors.red,
                                ),
                                onPressed: () => _.eliminarProducto(index)
                              )
                            ),
                          ],
                        );
                      },
                    )
                  ),
                  Flexible(
                    flex: 3,
                    child: GetBuilder<CartController>(
                      builder: (_){
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 80,
                                child: TextFormField(
                                  onChanged: (value) => _.actualizarCantidad(index, value),
                                  initialValue: '$cantidad',
                                  textAlign: TextAlign.center,
                                  obscureText: false,
                                  style: GoogleFonts.ubuntu(
                                    height: 1,
                                    fontSize: 15
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric( vertical: 0, horizontal: 10 ),
                                    labelStyle: GoogleFonts.ubuntu(),
                                    hintStyle: GoogleFonts.ubuntu(),
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
                                child: Text(
                                  '\$ $precio',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }

}