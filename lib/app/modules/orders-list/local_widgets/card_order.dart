

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

class CardOrder{

  String id;
  int totalCompra;
  DateTime fechaCompra;
  double width;
  double height;

  CardOrder({
    @required this.id,
    @required this.totalCompra,
    @required this.fechaCompra,
    @required this.width,
    @required this.height
  });

  Widget build() {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only( bottom: 20 ),
      decoration: BoxDecoration(
        // color: Colors.blue,
        border: Border(
          bottom: BorderSide( color: Colors.black12, width: 1 )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 29,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                'Pedido: ',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16
                                ),
                              ),
                              Text(
                                id,
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                        )
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Fecha solicitud: ',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  DateFormat('dd/MM/yyyy').format( fechaCompra ),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          )
                        )
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only( top: 20 ),
                    child: Row(
                      children: [
                        Text(
                          'Total: ',
                          style: GoogleFonts.ubuntu(
                            fontSize: 16
                          ),
                        ),
                        Text(
                          '\$ $totalCompra',
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    )
                    // child: Text(
                    //   'Total: \$ $totalCompra',
                    //   style: GoogleFonts.ubuntu(
                    //     fontSize: 16
                    //   ),
                    // ),
                    // child: ,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}