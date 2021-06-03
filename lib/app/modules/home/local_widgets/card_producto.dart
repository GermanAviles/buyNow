import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show required;

class CardProducto{

  String  nombre;
  int     precio;
  String  descripcion;
  double width;
  double height;

  CardProducto({
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
              decoration: BoxDecoration(
                color: Colors.blue
              ),
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
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( bottom: 10 ),
                    child: Text(
                      '\$ ${this.precio}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      this.descripcion,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
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