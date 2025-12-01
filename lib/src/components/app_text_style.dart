import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {

  // MAIN POPPINS STYLE
  static TextStyle poppins({
    double size = 14,
    Color color = Colors.black,
    FontWeight weight = FontWeight.normal,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: weight,
    );
  }

  // READY MADE STYLES FOR EASY USE

  static TextStyle bigTitle = poppins(size: 24, weight: FontWeight.bold);

  static TextStyle title = poppins(size: 20, weight: FontWeight.w600);

  static TextStyle body = poppins(size: 16);

  static TextStyle small = poppins(size: 12, color: Colors.grey);

}
