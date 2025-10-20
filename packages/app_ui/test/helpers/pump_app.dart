import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

extension AppTester on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    ThemeData? theme,
    MockNavigator? navigator,
  }) async {
    await pumpWidget(
      MaterialApp(
        theme: theme,
        home: navigator == null
            ? Scaffold(
                body: widgetUnderTest,
              )
            : MockNavigatorProvider(
                navigator: navigator,
                child: Scaffold(
                  body: widgetUnderTest,
                ),
              ),
      ),
    );
    await pump();
  }

  /// A [pumpWidget] wrapper that adds a [subject] to the widget
  /// tree with its required ancestors.
  Future<void> pumpSubject(
    Widget subject, {
    ThemeData? themeData,
    MockNavigator? navigator,
  }) async {
    await pumpWidget(
      MaterialApp(
        theme: themeData ?? const AppTheme().themeData,
        home: navigator == null
            ? Scaffold(
                body: Directionality(
                  textDirection: TextDirection.ltr,
                  child: subject,
                ),
              )
            : MockNavigatorProvider(
                navigator: navigator,
                child: Scaffold(
                  body: Directionality(
                    textDirection: TextDirection.ltr,
                    child: subject,
                  ),
                ),
              ),
      ),
    );
    await pump();
  }
}
