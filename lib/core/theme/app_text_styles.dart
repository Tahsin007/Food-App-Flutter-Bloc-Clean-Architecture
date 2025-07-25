import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {


  static TextStyle h1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    // color: Colors.black,
  );
  static TextStyle h2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle h3 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.5,
  );

  //body text
  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  //button text
  static TextStyle buttonLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,

  );
  
  static TextStyle buttonMedium = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static TextStyle buttonSmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  //Label text

  static TextStyle labelMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );



}