import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart' show required;

class CardDetalle {

  String numero;
  String fecha;
  int    total;

  CardDetalle({
    @required this.numero,
    @required this.fecha,
    @required this.total
  });

  Widget build() {
    return Container(
      margin: EdgeInsets.only(top: 10),
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
          Container(
            margin: EdgeInsets.only( bottom: 20 ),
            child: Text(
              'Detalles del pedido',
              style: GoogleFonts.ubuntu(
                fontSize: 21,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only( bottom: 20 ),
                      child: Text(
                        'Pedido:',
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          color: Colors.black54
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only( bottom: 20 ),
                      child: Text(
                        'Fecha de solicitud:',
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          color: Colors.black54
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Total:',
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          color: Colors.black54
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only( bottom: 20 ),
                      child: Text(
                        numero,
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only( bottom: 20 ),
                      child: Text(
                        fecha,
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '\$ $total',
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}