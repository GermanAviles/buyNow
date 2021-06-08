import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show required;

class Loading {

  double width;
  double height;

  Loading({
    @required this.width,
    @required this.height,
  });

  Widget build() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black26
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}