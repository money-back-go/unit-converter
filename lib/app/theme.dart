import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFFFFAE14);
  static const Color secondary = Color(0xFF15203D);
  static const Color tertiary = Color(0xFFFFAE14);
  static const Color alternate = Color(0xFFFF5963);
  
  static const Color primaryText = Color(0xFF14181B);
  static const Color secondaryText = Color(0xFF57636C);
  static const Color primaryBackground = Color(0xFFF0F1F7);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFDC3545);
  static const Color info = Color(0xFF17A2B8);

  // TextStyles
  static TextStyle get displayLarge => GoogleFonts.nunito(
        fontSize: 57.0,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  static TextStyle get displayMedium => GoogleFonts.nunito(
        fontSize: 45.0,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  static TextStyle get displaySmall => GoogleFonts.nunito(
        fontSize: 36.0,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  static TextStyle get headlineLarge => GoogleFonts.nunito(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  static TextStyle get headlineMedium => GoogleFonts.nunito(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  static TextStyle get headlineSmall => GoogleFonts.nunito(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  static TextStyle get titleLarge => GoogleFonts.nunito(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get titleMedium => GoogleFonts.nunito(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get titleSmall => GoogleFonts.nunito(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get bodyLarge => GoogleFonts.nunito(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: primaryText,
      );

  static TextStyle get bodyMedium => GoogleFonts.nunito(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: primaryText,
      );

  static TextStyle get bodySmall => GoogleFonts.nunito(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: primaryText,
      );

  static TextStyle get labelLarge => GoogleFonts.nunito(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get labelMedium => GoogleFonts.nunito(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get labelSmall => GoogleFonts.nunito(
        fontSize: 11.0,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );
}

