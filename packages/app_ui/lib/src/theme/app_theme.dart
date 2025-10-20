import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _iconTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      snackBarTheme: _snackBarTheme,
      appBarTheme: _appBarTheme,
      dividerTheme: _dividerTheme,
      dialogTheme: _dialogTheme.data,
      extensions: {_extension},
      tabBarTheme: _tabBarTheme.data,
      colorScheme: _colorScheme.copyWith(surface: _backgroundColor),
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.light(
      primary: AppColors.teal.shade500,
      secondary: AppColors.teal.shade400,
      surface: AppColors.neutral.shade100,
      surfaceContainerHighest: AppColors.neutral.shade100,
      error: AppColors.red.shade500,
      onPrimary: AppColors.neutral.shade50,
      onSurface: AppColors.neutral.shade800,
      onError: AppColors.neutral.shade50,
      onSurfaceVariant: AppColors.neutral.shade500,
    );
  }

  Color get _backgroundColor => _colorScheme.surface;

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(color: AppColors.white);
  }

  IconThemeData get _iconTheme => _templateIconTheme.medium;

  TextTheme get _textTheme {
    return TextTheme(
      displaySmall: AppTextStyle.headline3,
      headlineMedium: AppTextStyle.headline4,
      headlineSmall: AppTextStyle.headline5,
      titleLarge: AppTextStyle.headline6,
      titleMedium: AppTextStyle.subtitle1,
      titleSmall: AppTextStyle.subtitle2,
      bodyLarge: AppTextStyle.body1,
      bodyMedium: AppTextStyle.body2,
      labelLarge: AppTextStyle.button,
      labelSmall: AppTextStyle.overline,
    ).apply(
      bodyColor: AppColors.black,
      displayColor: AppColors.black,
      decorationColor: AppColors.black,
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    final buttonStyle =
        TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSpacing.threeEighths),
            ),
          ),
          textStyle: _textTheme.labelLarge,
          splashFactory: NoSplash.splashFactory,
          elevation: 2,
        ).merge(
          ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.pressed)) {
                return _colorScheme.secondary;
              } else if (states.contains(WidgetState.disabled)) {
                return AppColors.neutral.shade200;
              }

              return _colorScheme.primary;
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return AppColors.neutral.shade300;
              }

              return AppColors.white;
            }),
          ),
        );

    return ElevatedButtonThemeData(style: buttonStyle);
  }

  DialogTheme get _dialogTheme {
    final textTheme = _textTheme;

    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.threeQuarter),
      ),
      backgroundColor: _colorScheme.surface,
      titleTextStyle: textTheme.headlineSmall!.copyWith(
        color: _colorScheme.onSurface,
      ),
      contentTextStyle: textTheme.bodyLarge!.copyWith(
        color: _colorScheme.onSurfaceVariant,
      ),
    );
  }

  /// This is build for tappable text
  TextButtonThemeData get _textButtonTheme {
    final buttonStyle =
        TextButton.styleFrom(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
          textStyle: _textTheme.headlineSmall,
        ).merge(
          ButtonStyle(
            overlayColor: WidgetStateProperty.all(AppColors.transparent),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.pressed)) {
                return _colorScheme.secondary;
              } else if (states.contains(WidgetState.disabled)) {
                return AppColors.neutral.shade300;
              }

              return _colorScheme.primary;
            }),
          ),
        );

    return TextButtonThemeData(style: buttonStyle);
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: _textTheme.bodyLarge!.copyWith(color: AppColors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.half),
      ),
      actionTextColor: AppColors.teal.shade300,
      backgroundColor: AppColors.black,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme.copyWith(color: AppColors.neutral),
      titleTextStyle: _textTheme.displaySmall,
      backgroundColor: _colorScheme.surface,
      elevation: 0,
    );
  }

  DividerThemeData get _dividerTheme {
    return DividerThemeData(
      color: AppColors.neutral.shade200,
      space: AppSpacing.eighth,
      thickness: AppSpacing.oneThirtySecond,
    );
  }

  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.threeQuarter,
      ),
      labelStyle: _textTheme.titleMedium,
      labelColor: _colorScheme.onSurface,
      unselectedLabelStyle: _textTheme.titleMedium,
      unselectedLabelColor: _colorScheme.onSurfaceVariant,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(AppColors.transparent),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: _colorScheme.primary, width: 3),
        ),
      ),
    );
  }

  ThemeDataExtension get _extension {
    return ThemeDataExtension(
      iconTheme: _templateIconTheme,
      iconDecorationTheme: _iconDecorationTheme,
    );
  }

  TemplateIconTheme get _templateIconTheme {
    return TemplateIconTheme(
      extraSmall: IconThemeData(size: 12, color: _colorScheme.onSurfaceVariant),
      small: IconThemeData(size: 16, color: _colorScheme.onSurfaceVariant),
      medium: IconThemeData(size: 20, color: _colorScheme.onSurfaceVariant),
      large: IconThemeData(size: 24, color: _colorScheme.onSurfaceVariant),
      extraLarge: IconThemeData(size: 32, color: _colorScheme.onSurfaceVariant),
    );
  }

  IconDecorationTheme get _iconDecorationTheme {
    final iconTheme = _templateIconTheme;
    final colorScheme = _colorScheme;
    final backgroundColor = colorScheme.primary;
    final iconColor = colorScheme.onPrimary;

    return IconDecorationTheme(
      extraSmall: IconDecorationThemeData(
        backgroundColor: backgroundColor,
        iconTheme: iconTheme.extraSmall.copyWith(color: iconColor),
        spacing: AppSpacing.threeEighths,
      ),
      small: IconDecorationThemeData(
        backgroundColor: backgroundColor,
        iconTheme: iconTheme.small.copyWith(color: iconColor),
        spacing: AppSpacing.half,
      ),
      medium: IconDecorationThemeData(
        backgroundColor: backgroundColor,
        iconTheme: iconTheme.medium.copyWith(color: iconColor),
        spacing: AppSpacing.threeQuarter,
      ),
      large: IconDecorationThemeData(
        backgroundColor: backgroundColor,
        iconTheme: iconTheme.large.copyWith(color: iconColor),
        spacing: AppSpacing.threeQuarter,
      ),
      extraLarge: IconDecorationThemeData(
        backgroundColor: backgroundColor,
        iconTheme: iconTheme.extraLarge.copyWith(color: iconColor),
        spacing: AppSpacing.threeQuarter,
      ),
    );
  }
}

/// {@template app_dark_theme}
/// Dark Mode App [ThemeData].
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  @override
  ColorScheme get _colorScheme {
    return const ColorScheme.dark().copyWith(
      primary: AppColors.teal.shade500,
      secondary: AppColors.teal.shade400,
      surface: AppColors.neutral.shade900,
      surfaceContainerHighest: AppColors.neutral.shade700,
      error: AppColors.red.shade400,
      onPrimary: AppColors.neutral.shade50,
      onSurface: AppColors.neutral.shade100,
      onError: AppColors.neutral.shade50,
      onSurfaceVariant: AppColors.neutral.shade400,
    );
  }

  @override
  TextTheme get _textTheme {
    return super._textTheme.apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      decorationColor: AppColors.white,
    );
  }

  @override
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: super._elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.pressed)) {
            return _colorScheme.secondary;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.neutral.shade600;
          }

          return _colorScheme.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.neutral.shade500;
          }

          return AppColors.white;
        }),
      ),
    );
  }

  @override
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: super._textButtonTheme.style?.copyWith(
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return _colorScheme.secondary;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.neutral.shade500;
          }

          return _colorScheme.primary;
        }),
      ),
    );
  }

  @override
  DividerThemeData get _dividerTheme {
    return super._dividerTheme.copyWith(color: AppColors.neutral.shade600);
  }
}

/// {@template app_theme_extensions}
/// TEMPLATE_APP [ThemeData].
///
/// This is a [ThemeData] that adds some additional properties to Material's
/// [ThemeData].
///
/// It is recommended that you access it using [ThemeDataX]:
/// `Theme.of(context).themeExtension`.
/// {@endtemplate}
class ThemeDataExtension extends ThemeExtension<ThemeDataExtension> {
  /// {@macro app_theme_extensions}
  const ThemeDataExtension({
    required this.iconTheme,
    required this.iconDecorationTheme,
  });

  /// {@macro vet_connect_plus_icon_theme}
  final TemplateIconTheme iconTheme;

  /// {@macro icon_decoration_theme}
  final IconDecorationTheme iconDecorationTheme;

  @override
  ThemeDataExtension copyWith({
    TemplateIconTheme? iconTheme,
    IconDecorationTheme? iconDecorationTheme,
  }) {
    return ThemeDataExtension(
      iconTheme: iconTheme ?? this.iconTheme,
      iconDecorationTheme: iconDecorationTheme ?? this.iconDecorationTheme,
    );
  }

  @override
  ThemeDataExtension lerp(ThemeExtension<ThemeDataExtension>? other, double t) {
    if (other is! ThemeDataExtension) return this;
    return ThemeDataExtension(
      iconTheme: iconTheme.lerp(other.iconTheme, t),
      iconDecorationTheme: iconDecorationTheme.lerp(
        other.iconDecorationTheme,
        t,
      ),
    );
  }
}

/// {@template theme_data_x}
/// Provides access to [ThemeDataExtension].
///
/// It can be seen as syntactic sugar. However, in comparison with:
/// `Theme.of(context).extension<ThemeDataExtension>()`, it ensures that the
/// null check is handled in a single place.
/// {@endtemplate}
extension ThemeDataX on ThemeData {
  /// {@macro theme_data_x}
  ThemeDataExtension get themeExtension => extension<ThemeDataExtension>()!;
}
