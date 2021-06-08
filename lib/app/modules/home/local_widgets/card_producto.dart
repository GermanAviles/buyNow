import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

// final currencyFormat = new NumberFormat("#,##0.00", "es_CO");
// final formatCurrency = new NumberFormat.simpleCurrency();
// final currencyFormat = new NumberFormat.currency(locale: "es_CO", symbol: "");
final currencyFormat = new NumberFormat("#,##0", "es_CO");
class CardProducto{

  String  nombre;
  int     precio;
  String  descripcion;
  String  url;
  double width;
  double height;

  CardProducto({
    @required this.url,
    @required this.nombre,
    @required this.precio,
    @required this.descripcion,
    @required this.width,
    @required this.height
  });

  Widget build(){

    return Container(
      padding: EdgeInsets.symmetric( vertical: 15, horizontal: 5 ),
      width: this.width,
      height: this.height,
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              child: Image.network( url ),
            )
          ),
          Flexible(
            flex: 8,
            child: Container(
              padding: EdgeInsets.only( left: 15, top: 0, right: 5, bottom: 5 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only( bottom: 10 ),
                    child: Text(
                      this.nombre,
                      style: GoogleFonts.ubuntu(
                        fontSize: 18
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( bottom: 10 ),
                    child: Text(
                      '\$ ${ currencyFormat.format( precio ) }',
                      style: GoogleFonts.ubuntu(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      this.descripcion,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}