import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart' show required;

class ItemProduc {

  String nombre;
  int    cantidad;
  int    valor;
  double width;
  double height;
  String  url;

  ItemProduc({
    @required this.url,
    @required this.nombre,
    @required this.cantidad,
    @required this.valor,
    @required this.width,
    @required this.height,
  });

  Widget build() {
    return Container(
      // decoration: BoxDecoration( color: Colors.red),
      margin: EdgeInsets.only( bottom: 10 ),
      // height: double.minPositive,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              width: 90,
              height: 90,
              child: Image.network( url ),
            ),
          ),
          Flexible(
            flex: 9,
            child: Container(
              margin: EdgeInsets.only( left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only( bottom: 10 ),
                    child: Text(
                      nombre,
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Cantidad:',
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$cantidad',
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( top: 3 ),
                    child: Text(
                      '\$ $valor',
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}