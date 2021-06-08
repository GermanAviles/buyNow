import 'package:buy_now/app/modules/home/home_controller.dart';
import 'package:buy_now/app/modules/home/local_widgets/card_producto.dart';
import 'package:buy_now/app/modules/home/local_widgets/drawer_menu.dart';
import 'package:buy_now/app/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_){
        _.updateContext(context);
        return SafeArea(
          child: Scaffold(
            drawer: DrawerMenu().build(),
            appBar: AppBar(
              title: Text(
                'Compras PRO',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w500
                ),
              ),
              actions: [
                IconButton(
                  tooltip: 'Carrito compras',
                  icon: Icon( Icons.shopping_cart_outlined ),
                  onPressed: () => Navigator.pushNamed(context, Routes.CART)
                )
              ],
            ),
            body: body(_),
          ),
        );
      }
    );
  }

  Widget body( HomeController _ ) {
    final width = MediaQuery.of( _.context ).size.width;
    final height = MediaQuery.of( _.context ).size.height;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric( vertical: 10, horizontal: 10 ),
      child: Obx((){
        final productos = _.productos;
        return ListView.builder(
          itemCount: productos.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){ Get.toNamed( Routes.PRODUCTDETAIL, parameters: { "id": productos[index].id } ); },
              child: CardProducto(
                url: productos[index].imgURL,
                height: 150,
                width: width,
                nombre: productos[index].nombre,
                precio: productos[index].precio,
                descripcion: productos[index].descripcion
              ).build(),
            );
          }
        );
      })
    );
  }
}