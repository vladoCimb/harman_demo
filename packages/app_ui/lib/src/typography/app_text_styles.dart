import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_text_style}
/// App Text Style Definitions.
/// {@endtemplate}
abstract class AppTextStyle {
  /// {@macro app_text_style}

  static const _baseTextStyle = TextStyle(
    fontWeight: AppFontWeight.regular,
    height: 1,
    package: 'app_ui',
  );

  /// Headline3 semi bold Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 26,
    fontWeight: AppFontWeight.semiBold,
  );

  /// Headline4 regular Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 26,
    fontWeight: AppFontWeight.regular,
  );

  /// Headline5 semi bold Text Style
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 17,
    fontWeight: AppFontWeight.semiBold,
  );

  /// Headline6 regular Text Style
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontSize: 17,
    fontWeight: AppFontWeight.regular,
  );

  /// Subtitle1 semi bold Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppFontWeight.semiBold,
  );

  /// Subtitle2 semiBold Text Style
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 13,
    fontWeight: AppFontWeight.semiBold,
  );

  /// Body1 semi regular Text Style
  static final TextStyle body1 = _baseTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppFontWeight.regular,
  );

  /// Body2 regular Text Style
  static final TextStyle body2 = _baseTextStyle.copyWith(
    fontSize: 13,
    fontWeight: AppFontWeight.regular,
  );

  /// Button semi bold regular Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 17,
    fontWeight: AppFontWeight.semiBold,
  );

  /// Overline  Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: AppFontWeight.regular,
  );
}
