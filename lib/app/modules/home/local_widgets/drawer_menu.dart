import 'package:buy_now/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu {

  Widget build() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Icon( Icons.perm_identity_rounded ),
                ),
                Container(
                  padding: EdgeInsets.symmetric( horizontal: 10 ),
                  child: Text(
                    'Usuario pro',
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: null,
            leading: Icon(
              Icons.home_outlined,
              size: 28,
            ),
            title: Text(
              'Inicio',
              style: GoogleFonts.ubuntu(
                fontSize: 18
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
            ),
            title: Text(
              'Carrito',
              style: GoogleFonts.ubuntu(
                fontSize: 18
              ),
            ),
          ),
            ListTile(
              leading: Icon(
                Icons.history_rounded,
                size: 28,
              ),
              title: Text(
                'Compras',
                style: GoogleFonts.ubuntu(
                  fontSize: 18
                ),
              ),
              onTap: (){
                Get.toNamed( Routes.ORDERLIST );
              }
            ),
        ],
      ),
    );
  }

}