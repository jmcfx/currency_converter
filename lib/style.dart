import 'package:flutter/material.dart';
//Custom OutLine InputBorder....
OutlineInputBorder customOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.black,
      width: 2.0,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

// Custom Text ButtonStyleFrom....
ButtonStyle? customTextButtonStyleFrom() {
  return TextButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
