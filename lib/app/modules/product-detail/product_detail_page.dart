
import 'package:buy_now/app/modules/product-detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final FocusNode _focusCantidad = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (_){
        _.updateContext( context );
        return SafeArea(
          child: Scaffold(
            appBar: appbar(),
            body: body(_),
          )
        );
      },
    );
  }

  Widget appbar() {
    return AppBar(
      title: Text('Producto'),
      actions: [
        IconButton(
          tooltip: 'Carrito compras',
          icon: Icon( Icons.shopping_cart_outlined ),
          onPressed: (){}
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
                Container(
                  // height: 50,
                  margin: EdgeInsets.only( bottom: 25 ),
                  width: width,
                  // decoration: BoxDecoration(
                  //   color: Colors.blue
                  // ),
                  child: Text(
                    'Reloj para mujer cassio con diamantes de 30 kilates',
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,

                    ),
                  ),
                ),
                Container(
                  // height: 50,
                  width: width,
                  margin: EdgeInsets.only( bottom: 10 ),
                  // decoration: BoxDecoration(
                  //   color: Colors.blue
                  // ),
                  child: Text(
                    '\$ 200.000',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only( top: 30 ),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
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
                      onPressed: (){},
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Comprar ahora',
                        style: TextStyle(
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
                      onPressed: (){},
                      color: Colors.blue[50],
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Agregar al carrito',
                        style: TextStyle(
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
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por e',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}