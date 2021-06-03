import 'package:buy_now/app/modules/home/home_controller.dart';
import 'package:buy_now/app/modules/home/local_widgets/card_producto.dart';
import 'package:buy_now/app/modules/home/local_widgets/drawer_menu.dart';
import 'package:buy_now/app/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              title: Text('Compras PRO'),
              actions: [
                IconButton(
                  tooltip: 'Carrito compras',
                  icon: Icon( Icons.shopping_cart_outlined ),
                  onPressed: (){}
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
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){ Get.toNamed( Routes.PRODUCTDETAIL ); },
            child: CardProducto(
              height: 150,
              width: width,
              nombre: 'Reloj Casio',
              precio: 100000,
              descripcion: 'Probando descripción'
            ).build(),
          );
        }
      ),
    );
  }
}