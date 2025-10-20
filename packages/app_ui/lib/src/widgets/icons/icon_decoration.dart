import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template icon_decoration}
/// A TemplateAppIcons-style icon decoration.
///
/// Used to decorate an icon with a circular colored background.
///
/// If a [ThemeDataExtension.iconDecorationTheme] is defined in the [Theme],
/// then you can style the icon decoration as follows:
///
/// ```dart
/// IconDecoration(
///   style: Theme.of(context).themeExtension.iconDecorationTheme.large,
///   child: Icon(Icons.abc),
/// );
/// ```
///
/// See also:
///
/// * [Icon], a graphical icon widget drawn with a glyph from a font.
/// * [IconDecorationThemeData], used to style the icon decoration.
/// * [CircleAvatar], a circle that represents a user.
/// {@endtemplate}
class IconDecoration extends StatelessWidget {
  /// {@macro icon_decoration}
  const IconDecoration({
    super.key,
    this.style,
    this.backgroundColor,
    required this.child,
  });

  /// The icon to display.
  ///
  /// The [Icon] is styled according to [IconDecorationThemeData.iconTheme],
  /// unless it defines [Icon.size] or/and [Icon.color].
  final Icon child;

  /// If non-null, the style used to style this icon decoration.
  ///
  /// Defaults to [IconDecorationTheme.medium].
  final IconDecorationThemeData? style;

  /// Color used to fill the circular background behind the icon.
  ///
  /// If null, defaults to the [style]'s background color.
  ///
  /// This can be considered a convenient property, similar to
  /// [Container.color], since [IconDecorationThemeData.copyWith] can also be
  /// used to modify the [style]'s background color.
  ///
  /// There is no foreground color property since this can be specified directly
  /// via [Icon.color] or by modifying [IconDecorationThemeData.iconTheme].
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final style = this.style ??
        Theme.of(context).themeExtension.iconDecorationTheme.medium;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? style.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(style.spacing),
        child: IconTheme(
          data: style.iconTheme,
          child: child,
        ),
      ),
    );
  }
}

/// {@template icon_decoration_theme_data}
/// Defines the color, spacing and iconTheme of an [IconDecoration].
///
/// See also:
///
/// * [IconDecorationTheme], a theme for [IconDecoration].
/// {@endtemplate}
class IconDecorationThemeData {
  /// {@macro icon_decoration_theme_data}
  const IconDecorationThemeData({
    required this.backgroundColor,
    required this.spacing,
    required this.iconTheme,
  });

  /// Color used to fill the circular background behind the icon.
  final Color backgroundColor;

  /// The space between the icon and the circumference of the circle.
  final double spacing;

  /// The style of the icon.
  final IconThemeData iconTheme;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  IconDecorationThemeData copyWith({
    Color? backgroundColor,
    double? spacing,
    IconThemeData? iconTheme,
  }) {
    return IconDecorationThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      spacing: spacing ?? this.spacing,
      iconTheme: iconTheme ?? this.iconTheme,
    );
  }

  /// Linearly interpolate between two [IconDecorationThemeData]s.
  IconDecorationThemeData lerp(IconDecorationThemeData? other, double t) {
    return other is IconDecorationThemeData
        ? IconDecorationThemeData(
            backgroundColor: Color.lerp(
              backgroundColor,
              other.backgroundColor,
              t,
            )!,
            spacing: lerpDouble(spacing, other.spacing, t)!,
            iconTheme: iconTheme.lerp(other.iconTheme, t),
          )
        : this;
  }
}

/// {@template icon_decoration_theme}
/// A theme for [IconDecoration].
/// {@endtemplate}
class IconDecorationTheme {
  /// {@macro icon_decoration_theme}
  const IconDecorationTheme({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  /// An extra small icon decoration.
  final IconDecorationThemeData extraSmall;

  /// A small icon decoration.
  final IconDecorationThemeData small;

  /// A medium icon decoration.
  final IconDecorationThemeData medium;

  /// A large icon decoration.
  final IconDecorationThemeData large;

  /// An extra large icon decoration.
  final IconDecorationThemeData extraLarge;

  /// Creates a copy of this theme data with the given parameters replaced with
  /// the new values.
  IconDecorationTheme copyWith({
    IconDecorationThemeData? extraSmall,
    IconDecorationThemeData? small,
    IconDecorationThemeData? medium,
    IconDecorationThemeData? large,
    IconDecorationThemeData? extraLarge,
  }) {
    return IconDecorationTheme(
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
    );
  }

  /// Linear interpolation between two [IconDecorationTheme].
  IconDecorationTheme lerp(
    IconDecorationTheme? other,
    double t,
  ) {
    return other is IconDecorationTheme
        ? IconDecorationTheme(
            extraSmall: extraSmall.lerp(other.extraSmall, t),
            small: small.lerp(other.small, t),
            medium: medium.lerp(other.medium, t),
            large: large.lerp(other.large, t),
            extraLarge: extraLarge.lerp(other.extraLarge, t),
          )
        : this;
  }
}
