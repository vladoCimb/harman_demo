// ignore_for_file: lines_longer_than_80_chars

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockTemplateIconThemeData extends Mock implements TemplateIconTheme {}

class _MockIconDecorationTheme extends Mock implements IconDecorationTheme {}

void main() {
  group('AppTheme', () {
    group('themeData', () {
      test('primary color is teal.shade500', () {
        expect(
          const AppTheme().themeData.colorScheme.primary,
          AppColors.teal.shade500,
        );
      });

      test('secondary color is teal.shade400', () {
        expect(
          const AppTheme().themeData.colorScheme.secondary,
          AppColors.teal.shade400,
        );
      });

      test('background color is neutral.shade50', () {
        expect(
          const AppTheme().themeData.colorScheme.surface,
          AppColors.neutral.shade100,
        );
      });

      test('progress indicator color is white', () {
        expect(
          const AppTheme().themeData.progressIndicatorTheme.color,
          AppColors.white,
        );
      });

      test('has a single ThemeDataExtension', () {
        const appTheme = AppTheme();

        expect(
          () => appTheme.themeData.extension<ThemeDataExtension>(),
          returnsNormally,
        );
        expect(appTheme.themeData.extensions.length, equals(1));
      });

      group('Elevated button', () {
        test('elevated button theme background disabled color', () {
          expect(
            const AppTheme()
                .themeData
                .elevatedButtonTheme
                .style!
                .backgroundColor!
                .resolve({WidgetState.disabled}),
            AppColors.neutral.shade200,
          );
        });

        test('elevated button theme background pressed color', () {
          expect(
            const AppTheme()
                .themeData
                .elevatedButtonTheme
                .style!
                .backgroundColor!
                .resolve({WidgetState.pressed}),
            AppColors.teal.shade400,
          );
        });

        test(
          'elevated button theme all other then pressed and disabled state background colors',
          () {
            expect(
              const AppTheme()
                  .themeData
                  .elevatedButtonTheme
                  .style!
                  .backgroundColor!
                  .resolve({
                    WidgetState.hovered,
                    WidgetState.focused,
                    WidgetState.dragged,
                    WidgetState.scrolledUnder,
                    WidgetState.error,
                  }),
              AppColors.teal.shade500,
            );
          },
        );

        test('elevated button theme disabled foreground color', () {
          expect(
            const AppTheme()
                .themeData
                .elevatedButtonTheme
                .style!
                .foregroundColor!
                .resolve({WidgetState.disabled}),
            AppColors.neutral.shade300,
          );
        });
      });

      group('Text button', () {
        test('text button theme foreground disabled color', () {
          expect(
            const AppTheme().themeData.textButtonTheme.style!.foregroundColor!
                .resolve({WidgetState.disabled}),
            AppColors.neutral.shade300,
          );
        });

        test('text button theme foreground pressed color', () {
          expect(
            const AppTheme().themeData.textButtonTheme.style!.foregroundColor!
                .resolve({WidgetState.pressed}),
            AppColors.teal.shade400,
          );
        });

        test(
          'text button theme all other then pressed and disabled state foreground colors',
          () {
            expect(
              const AppTheme().themeData.textButtonTheme.style!.foregroundColor!
                  .resolve({
                    WidgetState.hovered,
                    WidgetState.focused,
                    WidgetState.dragged,
                    WidgetState.scrolledUnder,
                    WidgetState.error,
                  }),
              AppColors.teal.shade500,
            );
          },
        );
      });
    });
  });

  group('AppDarkTheme', () {
    group('themeData', () {
      test('primary color is teal.shade500', () {
        expect(
          const AppDarkTheme().themeData.colorScheme.primary,
          AppColors.teal.shade500,
        );
      });

      test('secondary color is teal.shade400', () {
        expect(
          const AppDarkTheme().themeData.colorScheme.secondary,
          AppColors.teal.shade400,
        );
      });

      test('background color is neutral.shade900', () {
        expect(
          const AppDarkTheme().themeData.canvasColor,
          AppColors.neutral.shade900,
        );
      });

      test('progress indicator color is white', () {
        expect(
          const AppDarkTheme().themeData.progressIndicatorTheme.color,
          AppColors.white,
        );
      });

      test('has a single ThemeDataExtension', () {
        const appTheme = AppDarkTheme();

        expect(
          () => appTheme.themeData.extension<ThemeDataExtension>(),
          returnsNormally,
        );
        expect(appTheme.themeData.extensions.length, equals(1));
      });

      group('elevated button', () {
        test('elevated button background disabled color', () {
          expect(
            const AppDarkTheme()
                .themeData
                .elevatedButtonTheme
                .style!
                .backgroundColor!
                .resolve({WidgetState.disabled}),
            AppColors.neutral.shade600,
          );
        });

        test('elevated button background pressed color', () {
          expect(
            const AppDarkTheme()
                .themeData
                .elevatedButtonTheme
                .style!
                .backgroundColor!
                .resolve({WidgetState.pressed}),
            AppColors.teal.shade400,
          );
        });

        test(
          'elevated button all other then pressed and disabled state background colors',
          () {
            expect(
              const AppDarkTheme()
                  .themeData
                  .elevatedButtonTheme
                  .style!
                  .backgroundColor!
                  .resolve({
                    WidgetState.hovered,
                    WidgetState.focused,
                    WidgetState.dragged,
                    WidgetState.scrolledUnder,
                    WidgetState.error,
                  }),
              AppColors.teal.shade500,
            );
          },
        );

        test('elevated button theme disabled foreground color', () {
          expect(
            const AppDarkTheme()
                .themeData
                .elevatedButtonTheme
                .style!
                .foregroundColor!
                .resolve({WidgetState.disabled}),
            AppColors.neutral.shade500,
          );
        });
      });

      group('Text button', () {
        test('text button theme foreground disabled color', () {
          expect(
            const AppDarkTheme()
                .themeData
                .textButtonTheme
                .style!
                .foregroundColor!
                .resolve({WidgetState.disabled}),
            AppColors.neutral.shade500,
          );
        });

        test('text button theme foreground pressed color', () {
          expect(
            const AppDarkTheme()
                .themeData
                .textButtonTheme
                .style!
                .foregroundColor!
                .resolve({WidgetState.pressed}),
            AppColors.teal.shade400,
          );
        });

        test(
          'text button theme all other then pressed and disabled state foreground colors',
          () {
            expect(
              const AppDarkTheme()
                  .themeData
                  .textButtonTheme
                  .style!
                  .foregroundColor!
                  .resolve({
                    WidgetState.hovered,
                    WidgetState.focused,
                    WidgetState.dragged,
                    WidgetState.scrolledUnder,
                    WidgetState.error,
                  }),
              AppColors.teal.shade500,
            );
          },
        );
      });
    });
  });

  group('ThemeDataExtension', () {
    late TemplateIconTheme iconTheme;
    late IconDecorationTheme iconDecorationTheme;

    setUp(() {
      iconTheme = _MockTemplateIconThemeData();
      iconDecorationTheme = _MockIconDecorationTheme();
    });

    test('can be instantiated', () {
      expect(
        ThemeDataExtension(
          iconTheme: iconTheme,
          iconDecorationTheme: iconDecorationTheme,
        ),
        isA<ThemeDataExtension>(),
      );
    });

    group('copyWith', () {
      test('returns normally', () {
        expect(
          () => ThemeDataExtension(
            iconTheme: iconTheme,
            iconDecorationTheme: iconDecorationTheme,
          ).copyWith(),
          returnsNormally,
        );
      });

      test('does nothing when no properties are defined', () {
        final themeData = ThemeDataExtension(
          iconTheme: iconTheme,
          iconDecorationTheme: iconDecorationTheme,
        );
        final copiedThemeData = themeData.copyWith();

        expect(themeData.iconTheme, equals(copiedThemeData.iconTheme));

        expect(
          themeData.iconDecorationTheme,
          equals(copiedThemeData.iconDecorationTheme),
        );
      });

      test('correctly copies properties', () {
        final themeData = ThemeDataExtension(
          iconTheme: iconTheme,
          iconDecorationTheme: iconDecorationTheme,
        );
        final newThemeData = ThemeDataExtension(
          iconTheme: _MockTemplateIconThemeData(),
          iconDecorationTheme: _MockIconDecorationTheme(),
        );
        final copiedThemeData = themeData.copyWith(
          iconTheme: newThemeData.iconTheme,
          iconDecorationTheme: newThemeData.iconDecorationTheme,
        );

        expect(copiedThemeData.iconTheme, equals(newThemeData.iconTheme));

        expect(
          copiedThemeData.iconDecorationTheme,
          equals(newThemeData.iconDecorationTheme),
        );
      });
    });

    group('lerp', () {
      test('return normally', () {
        const t = 1.0;
        final themeData = ThemeDataExtension(
          iconTheme: iconTheme,
          iconDecorationTheme: iconDecorationTheme,
        );

        when(() => iconTheme.lerp(iconTheme, t)).thenReturn(iconTheme);

        when(
          () => iconDecorationTheme.lerp(iconDecorationTheme, t),
        ).thenReturn(iconDecorationTheme);

        expect(() => themeData.lerp(themeData, 1), returnsNormally);
      });

      test('lerps when lerping to an InputDecorations', () {
        const t = 1.0;
        final themeData = ThemeDataExtension(
          iconTheme: iconTheme,
          iconDecorationTheme: iconDecorationTheme,
        );

        when(() => iconTheme.lerp(iconTheme, t)).thenReturn(iconTheme);

        when(
          () => iconDecorationTheme.lerp(iconDecorationTheme, t),
        ).thenReturn(iconDecorationTheme);

        themeData.lerp(themeData, t);

        verify(() => iconTheme.lerp(themeData.iconTheme, t)).called(1);

        verify(
          () => iconDecorationTheme.lerp(themeData.iconDecorationTheme, t),
        ).called(1);
      });

      test('returns the same InputDecorations when lerping to null', () {
        final themeData = ThemeDataExtension(
          iconTheme: iconTheme,
          iconDecorationTheme: iconDecorationTheme,
        );
        expect(themeData.lerp(null, 1), equals(themeData));
      });
    });
  });
}
