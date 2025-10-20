import 'dart:ui' as ui;

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template icon_theme}
/// A theme for [Icon].
///
/// You can adjust all [Icon] appearances by adjusting
/// [ThemeDataExtension.iconTheme].
///
/// [Icon] doesn't provide a style argument, so you need to nest it in a
/// [TemplateIconTheme].
///
/// For example:
/// ```dart
/// final themeExtension = Theme.of(context).themeExtension;
///
/// IconTheme(
///  data: themeExtension.iconsTheme.extraLarge,
///  child: const Icon(TemplateAppIcons.bell),
/// ),
///```
/// {@endtemplate}
@immutable
class TemplateIconTheme {
  /// {@macro vet_connect_plus_icon_theme}
  const TemplateIconTheme({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  /// An extra small icon.
  final IconThemeData extraSmall;

  /// A small icon.
  final IconThemeData small;

  /// A medium icon.
  ///
  /// All [Icon]s in the app use this icon size by default.
  final IconThemeData medium;

  /// A large icon.
  final IconThemeData large;

  /// An extra large icon.
  final IconThemeData extraLarge;

  /// Creates a copy of this theme with the given parameters replaced with
  /// the new values.
  TemplateIconTheme copyWith({
    IconThemeData? extraSmall,
    IconThemeData? small,
    IconThemeData? medium,
    IconThemeData? large,
    IconThemeData? extraLarge,
  }) {
    return TemplateIconTheme(
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
    );
  }

  /// Linear interpolation between two [TemplateIconTheme].
  TemplateIconTheme lerp(
    TemplateIconTheme? other,
    double t,
  ) {
    if (other is! TemplateIconTheme) return this;
    return TemplateIconTheme(
      extraSmall: extraSmall.lerp(other.extraSmall, t),
      small: small.lerp(other.small, t),
      medium: medium.lerp(other.medium, t),
      large: large.lerp(other.large, t),
      extraLarge: extraLarge.lerp(other.extraLarge, t),
    );
  }
}

/// {@template icon_theme_data_lerp}
/// Linear interpolation between two [IconThemeData]..
/// {@endtemplate}
extension IconThemeDataLerp on IconThemeData {
  /// {@macro icon_theme_data_lerp}
  IconThemeData lerp(IconThemeData b, double t) {
    return IconThemeData(
      color: Color.lerp(color, b.color, t),
      opacity: ui.lerpDouble(opacity, b.opacity, t),
      size: ui.lerpDouble(size, b.size, t),
    );
  }
}
