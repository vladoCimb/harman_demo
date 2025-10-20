// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockIconThemeData extends Mock implements IconThemeData {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) =>
      super.toString();
}

void main() {
  group('TemplateIconTheme', () {
    late IconThemeData extraSmall;
    late IconThemeData small;
    late IconThemeData medium;
    late IconThemeData large;
    late IconThemeData extraLarge;

    setUp(() {
      extraSmall = _MockIconThemeData();
      small = _MockIconThemeData();
      medium = _MockIconThemeData();
      large = _MockIconThemeData();
      extraLarge = _MockIconThemeData();
    });

    test('can be instantiated', () {
      expect(
        TemplateIconTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        ),
        isA<TemplateIconTheme>(),
      );
    });

    group('copyWith', () {
      test('returns normally', () {
        expect(
          () => TemplateIconTheme(
            extraSmall: extraSmall,
            small: small,
            medium: medium,
            large: large,
            extraLarge: extraLarge,
          ).copyWith(),
          returnsNormally,
        );
      });

      test('does nothing when no properties are defined', () {
        final theme = TemplateIconTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        );
        final newTheme = theme.copyWith();
        expect(
          theme.extraSmall,
          equals(newTheme.extraSmall),
        );
        expect(
          theme.small,
          equals(newTheme.small),
        );
        expect(
          theme.medium,
          equals(newTheme.medium),
        );
        expect(
          theme.large,
          equals(newTheme.large),
        );
        expect(
          theme.extraLarge,
          equals(newTheme.extraLarge),
        );
      });

      test('correctly copies properties', () {
        final iconThemeData = IconThemeData();
        final newThemeData = TemplateIconTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        ).copyWith(
          extraSmall: iconThemeData,
          small: iconThemeData,
          medium: iconThemeData,
          large: iconThemeData,
          extraLarge: iconThemeData,
        );
        expect(
          newThemeData.extraSmall,
          equals(iconThemeData),
        );
        expect(
          newThemeData.small,
          equals(iconThemeData),
        );
        expect(
          newThemeData.medium,
          equals(iconThemeData),
        );
        expect(
          newThemeData.large,
          equals(iconThemeData),
        );
        expect(
          newThemeData.extraLarge,
          equals(iconThemeData),
        );
      });
    });

    group('lerp', () {
      test('returns normally', () {
        final themeData = TemplateIconTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        );
        expect(
          () => themeData.lerp(themeData, 1),
          returnsNormally,
        );
      });

      test(
        'returns another TemplateIconThemeData '
        'when lerping to a TemplateIconThemeData',
        () {
          final theme = TemplateIconTheme(
            extraSmall: extraSmall,
            small: small,
            medium: medium,
            large: large,
            extraLarge: extraLarge,
          );
          final anotherTheme = TemplateIconTheme(
            extraSmall: IconThemeData(),
            small: IconThemeData(),
            medium: IconThemeData(),
            large: IconThemeData(),
            extraLarge: IconThemeData(),
          );
          expect(
            theme.lerp(anotherTheme, 1),
            isNot(equals(theme)),
          );
        },
      );

      test('does nothing when lerping to null', () {
        final theme = TemplateIconTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        );

        expect(
          theme.lerp(null, 1),
          equals(theme),
        );
      });
    });
  });
}
