import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';

class AppTextStyle {
  static final appTitleName = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
  );
  static final categorytitle = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 12, color: AppColors.blackColor));
  static final offertitle = GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.blackColor));
  static final offerDescription = GoogleFonts.montserrat(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400));

  static final headingTitle = GoogleFonts.montserrat(
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300));
  static final tabtitle = GoogleFonts.montserrat(
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500));
  static final headingBold = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColors.blackColor));
  static final headingDescription = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 10,
          color: AppColors.blackColor));
  static final applyButton = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: AppColors.whiteColor));
  static final coupuntitle = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: AppColors.blackColor));

  static final onExitText1 = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final onExitText2 = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final bottombarText = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppColors.blackColor));
  static final produxtTitleName = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.whiteColor));
}
