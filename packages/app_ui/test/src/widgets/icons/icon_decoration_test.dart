// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

class _MockIconDecorationThemeData extends Mock
    implements IconDecorationThemeData {}

void main() {
  group('IconDecoration', () {
    late Icon child;

    setUp(() {
      child = Icon(Icons.abc);
    });

    test('can be instantiated', () {
      expect(
        IconDecoration(child: child),
        isA<IconDecoration>(),
      );
    });

    testWidgets('builds', (tester) async {
      final subject = IconDecoration(child: child);
      await tester.pumpSubject(subject);
      expect(
        find.byWidget(subject),
        findsOneWidget,
      );
    });

    testWidgets('builds child', (tester) async {
      final subject = IconDecoration(child: child);
      await tester.pumpSubject(subject);
      expect(
        find.byWidget(child),
        findsOneWidget,
      );
    });
  });

  group('IconDecorationThemeData', () {
    late Color backgroundColor;
    late double spacing;
    late IconThemeData iconTheme;

    setUp(() {
      backgroundColor = Colors.black;
      spacing = 0;
      iconTheme = IconThemeData();
    });

    test('can be instantiated', () {
      expect(
        IconDecorationThemeData(
          backgroundColor: backgroundColor,
          spacing: spacing,
          iconTheme: iconTheme,
        ),
        isA<IconDecorationThemeData>(),
      );
    });

    group('copy with', () {
      test('returns normally', () {
        expect(
          () => IconDecorationThemeData(
            backgroundColor: backgroundColor,
            spacing: spacing,
            iconTheme: iconTheme,
          ).copyWith(),
          returnsNormally,
        );
      });

      test('does nothing when no properties are defined', () {
        final themeData = IconDecorationThemeData(
          backgroundColor: backgroundColor,
          spacing: spacing,
          iconTheme: iconTheme,
        );
        final copiedThemeData = themeData.copyWith();

        expect(
          copiedThemeData.backgroundColor,
          equals(themeData.backgroundColor),
        );
        expect(
          copiedThemeData.spacing,
          equals(themeData.spacing),
        );
        expect(
          copiedThemeData.iconTheme,
          equals(themeData.iconTheme),
        );
      });

      test('correctly copies properties', () {
        final themeData = IconDecorationThemeData(
          backgroundColor: backgroundColor,
          spacing: spacing,
          iconTheme: iconTheme,
        );
        final newThemeData = IconDecorationThemeData(
          backgroundColor: Colors.red,
          spacing: 1,
          iconTheme: IconThemeData(color: Colors.red),
        );
        final copiedThemeData = themeData.copyWith(
          backgroundColor: newThemeData.backgroundColor,
          spacing: newThemeData.spacing,
          iconTheme: newThemeData.iconTheme,
        );

        expect(
          copiedThemeData.backgroundColor,
          equals(newThemeData.backgroundColor),
        );
        expect(
          copiedThemeData.spacing,
          equals(newThemeData.spacing),
        );
        expect(
          copiedThemeData.iconTheme,
          equals(newThemeData.iconTheme),
        );
      });
    });

    group('lerp', () {
      test('returns normally', () {
        final themeData = IconDecorationThemeData(
          backgroundColor: backgroundColor,
          spacing: spacing,
          iconTheme: iconTheme,
        );
        expect(
          () => themeData.lerp(themeData, 1),
          returnsNormally,
        );
      });

      test(
        'returns another IconDecorationThemeData '
        'when lerping to a IconDecorationThemeData',
        () {
          final themeData = IconDecorationThemeData(
            backgroundColor: backgroundColor,
            spacing: spacing,
            iconTheme: iconTheme,
          );
          final anotherThemeData = IconDecorationThemeData(
            backgroundColor: Colors.red,
            spacing: 1,
            iconTheme: IconThemeData(color: Colors.red),
          );
          expect(
            themeData.lerp(anotherThemeData, 1),
            isNot(equals(themeData)),
          );
        },
      );

      test('does nothing when lerping to null', () {
        final themeData = IconDecorationThemeData(
          backgroundColor: backgroundColor,
          spacing: spacing,
          iconTheme: iconTheme,
        );
        expect(
          themeData.lerp(null, 1),
          equals(themeData),
        );
      });
    });
  });

  group('IconDecorationTheme', () {
    late IconDecorationThemeData extraSmall;
    late IconDecorationThemeData small;
    late IconDecorationThemeData medium;
    late IconDecorationThemeData large;
    late IconDecorationThemeData extraLarge;

    setUp(() {
      extraSmall = _MockIconDecorationThemeData();
      small = _MockIconDecorationThemeData();
      medium = _MockIconDecorationThemeData();
      large = _MockIconDecorationThemeData();
      extraLarge = _MockIconDecorationThemeData();
    });

    test('can be instantiated', () {
      expect(
        IconDecorationTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        ),
        isA<IconDecorationTheme>(),
      );
    });

    group('copy with', () {
      test('returns normally', () {
        expect(
          () => IconDecorationTheme(
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
        final theme = IconDecorationTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        );
        final copiedTheme = theme.copyWith();

        expect(
          copiedTheme.extraSmall,
          equals(theme.extraSmall),
        );
        expect(
          copiedTheme.small,
          equals(theme.small),
        );
        expect(
          copiedTheme.medium,
          equals(theme.medium),
        );
        expect(
          copiedTheme.large,
          equals(theme.large),
        );
        expect(
          copiedTheme.extraLarge,
          equals(theme.extraLarge),
        );
      });

      test('correctly copies properties', () {
        final theme = IconDecorationTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        );
        final newTheme = IconDecorationTheme(
          extraSmall: _MockIconDecorationThemeData(),
          small: _MockIconDecorationThemeData(),
          medium: _MockIconDecorationThemeData(),
          large: _MockIconDecorationThemeData(),
          extraLarge: _MockIconDecorationThemeData(),
        );
        final copiedTheme = theme.copyWith(
          extraSmall: newTheme.extraSmall,
          small: newTheme.small,
          medium: newTheme.medium,
          large: newTheme.large,
          extraLarge: newTheme.extraLarge,
        );

        expect(
          copiedTheme.extraSmall,
          equals(newTheme.extraSmall),
        );
        expect(
          copiedTheme.small,
          equals(newTheme.small),
        );
        expect(
          copiedTheme.medium,
          equals(newTheme.medium),
        );
        expect(
          copiedTheme.large,
          equals(newTheme.large),
        );
        expect(
          copiedTheme.extraLarge,
          equals(newTheme.extraLarge),
        );
      });
    });

    group('lerp', () {
      test('returns normally', () {
        const t = 1.0;
        final theme = IconDecorationTheme(
          extraSmall: extraSmall,
          small: small,
          medium: medium,
          large: large,
          extraLarge: extraLarge,
        );
        when(
          () => extraSmall.lerp(extraSmall, t),
        ).thenReturn(extraSmall);
        when(
          () => small.lerp(small, t),
        ).thenReturn(small);
        when(
          () => medium.lerp(medium, t),
        ).thenReturn(medium);
        when(
          () => large.lerp(large, t),
        ).thenReturn(large);
        when(
          () => extraLarge.lerp(extraLarge, t),
        ).thenReturn(extraLarge);

        expect(
          () => theme.lerp(theme, t),
          returnsNormally,
        );
      });

      test(
        'lerps when lerping to an InputDecorations',
        () {
          const t = 1.0;
          final theme = IconDecorationTheme(
            extraSmall: extraSmall,
            small: small,
            medium: medium,
            large: large,
            extraLarge: extraLarge,
          );
          when(
            () => extraSmall.lerp(extraSmall, t),
          ).thenReturn(extraSmall);
          when(
            () => small.lerp(small, t),
          ).thenReturn(small);
          when(
            () => medium.lerp(medium, t),
          ).thenReturn(medium);
          when(
            () => large.lerp(large, t),
          ).thenReturn(large);
          when(
            () => extraLarge.lerp(extraLarge, t),
          ).thenReturn(extraLarge);

          theme.lerp(theme, t);

          verify(
            () => extraSmall.lerp(extraSmall, t),
          ).called(1);
          verify(
            () => small.lerp(small, t),
          ).called(1);
          verify(
            () => medium.lerp(medium, t),
          ).called(1);
          verify(
            () => large.lerp(large, t),
          ).called(1);
          verify(
            () => extraLarge.lerp(extraLarge, t),
          ).called(1);
        },
      );

      test('does nothing when lerping to null', () {
        final theme = IconDecorationTheme(
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
