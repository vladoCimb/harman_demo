import 'package:flutter/material.dart';

/// Defines the color palette for the App UI Kit.
abstract class AppColors {
  /// White color
  static const Color white = Colors.white;

  /// Black color
  static const Color black = Colors.black;

  /// Transparent color
  static const Color transparent = Colors.transparent;

  /// The teal primary color and swatch.
  static const MaterialColor teal = MaterialColor(
    0xFF00A7B5,
    <int, Color>{
      50: Color(0xFFE5F6F7),
      100: Color(0xFFCCEDF0),
      200: Color(0xFFAEE5EA),
      300: Color(0xFF88D8DF),
      400: Color(0xFF33BFCC),
      500: Color(0xFF00A7B5),
      600: Color(0xFF008490),
      700: Color(0xFF006973),
      800: Color(0xFF004F57),
      900: Color(0xFF00363C),
    },
  );

  /// The neutral color and swatch.
  static const MaterialColor neutral = MaterialColor(
    0xFF97999B,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF4F6F7),
      200: Color(0xFFE6E8EA),
      300: Color(0xFFBABDBF),
      400: Color(0xFF97999B),
      500: Color(0xFF6A6B6D),
      600: Color(0xFF3C3D3E),
      700: Color(0xFF2D2E2F),
      800: Color(0xFF1E1F1F),
      900: Color(0xFF0F0F10),
    },
  );

  /// The red color and swatch.
  static const MaterialColor red = MaterialColor(
    0xFFF9423A,
    <int, Color>{
      50: Color(0xFFFCF0F0),
      100: Color(0xFFFFEDE9),
      200: Color(0xFFFFDAD4),
      300: Color(0xFFFF9796),
      400: Color(0xFFFA5B52),
      500: Color(0xFFF9423A),
      600: Color(0xFFF42E35),
      700: Color(0xFFD8292F),
      800: Color(0xFFA61E22),
      900: Color(0xFF680003),
    },
  );

  /// The yellow color and swatch.
  static const MaterialColor yellow = MaterialColor(
    0xFFE6BB48,
    <int, Color>{
      50: Color(0xFFFFFBF7),
      100: Color(0xFFFFEFCB),
      200: Color(0xFFFFE196),
      300: Color(0xFFF3DA98),
      400: Color(0xFFEBC96D),
      500: Color(0xFFE6BB48),
      600: Color(0xFFCFA841),
      700: Color(0xFF947C37),
      800: Color(0xFF81650D),
      900: Color(0xFF775A00),
    },
  );

  /// The green color and swatch.
  static const MaterialColor green = MaterialColor(
    0xFF59B730,
    <int, Color>{
      50: Color(0xFFF6FFE8),
      100: Color(0xFFCDFFAD),
      200: Color(0xFFADF08F),
      300: Color(0xFF9BDA8C),
      400: Color(0xFF7BD355),
      500: Color(0xFF59B730),
      600: Color(0xFF42991C),
      700: Color(0xFF377C2A),
      800: Color(0xFF135200),
      900: Color(0xFF0A3900),
    },
  );
}
