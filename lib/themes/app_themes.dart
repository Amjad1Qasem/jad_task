import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jad/themes/app_colors.dart';
import 'package:jad/themes/extentions/bg_category_theme_extention.dart';

abstract class AppThemes {
  static ThemeData get light => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          background: AppColors.white,
          primary: AppColors.primaryGreen,
          secondary: AppColors.secondaryGreen,
          onPrimary: AppColors.primaryBlue,
          onSecondary: AppColors.secondaryBlue,
          tertiary: AppColors.darkGreen,
          onTertiary: AppColors.lightGreen,
          primaryContainer: AppColors.aqua,
          onPrimaryContainer: AppColors.red,
          onSecondaryContainer: AppColors.aqua),
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
          ),
        ),
        bodySmall: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryGreen,
          ),
        ),
        bodyLarge: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBlue,
          ),
        ),
        labelMedium: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.grey,
          ),
        ),
        labelSmall: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryGreen,
          ),
        ),
        titleSmall: GoogleFonts.leckerliOne(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        titleMedium: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBlue,
          ),
        ),
        displaySmall: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        displayLarge: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.navyBlue,
          ),
        ),
      ),
      extensions: const {ColorsThemeExtention.light});
}
