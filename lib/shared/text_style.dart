import 'package:flutter/painting.dart';

import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static var blackPoppins =
      (double fonstSize, FontWeight weight) => GoogleFonts.poppins(
            color: AppColors.blackColor,
            fontSize: fonstSize,
            fontWeight: weight,
          );
  static var greyPoppins =
      (double fonstSize, FontWeight weight) => GoogleFonts.poppins(
            color: const Color(0xff696B76),
            fontSize: fonstSize,
            fontWeight: weight,
          );
  static var bluePoppins =
      (double fonstSize, FontWeight weight) => GoogleFonts.poppins(
            color: AppColors.lightBlueColor,
            fontSize: fonstSize,
            fontWeight: weight,
          );
  static var greenPoppins =
      (double fonstSize, FontWeight weight) => GoogleFonts.poppins(
            color: AppColors.darkGreenColor,
            fontSize: fonstSize,
            fontWeight: weight,
          );
  static var whitePoppins =
      (double fonstSize, FontWeight weight) => GoogleFonts.poppins(
            color: AppColors.whiteColor,
            fontSize: fonstSize,
            fontWeight: weight,
          );
  static var darkGreyPoppins =
      (double fonstSize, FontWeight weight) => GoogleFonts.poppins(
            color: AppColors.darkGreyColor,
            fontSize: fonstSize,
            fontWeight: weight,
          );
}
