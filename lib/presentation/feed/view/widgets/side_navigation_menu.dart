import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harman_demo/l10n/l10n.dart';
import 'package:harman_demo/locale_control/locale_control_bloc/locale_control_bloc.dart';

import 'package:harman_demo/theme_selector/bloc/theme_mode_bloc.dart';
import 'package:app_ui/app_ui.dart';

class CycleThemeIntent extends Intent {
  const CycleThemeIntent();
}

class CycleLanguageIntent extends Intent {
  const CycleLanguageIntent();
}

class SideNavigationMenu extends StatefulWidget {
  final bool isVisible;
  final bool isLanguageFocused;
  final bool isThemeFocused;

  const SideNavigationMenu({
    super.key,
    this.isVisible = false,
    this.isLanguageFocused = false,
    this.isThemeFocused = false,
  });

  @override
  State<SideNavigationMenu> createState() => _SideNavigationMenuState();
}

class _SideNavigationMenuState extends State<SideNavigationMenu> {
  late final FocusNode _languageFocusNode;
  late final FocusNode _themeFocusNode;

  @override
  void initState() {
    super.initState();
    _languageFocusNode = FocusNode(debugLabel: 'language_focus');
    _themeFocusNode = FocusNode(debugLabel: 'theme_focus');
  }

  @override
  void didUpdateWidget(covariant SideNavigationMenu oldWidget) {
    super.didUpdateWidget(oldWidget);

    // When app state says a row is focused, request Flutter focus so it gets DPAD keys.
    if (widget.isVisible) {
      if (widget.isThemeFocused && !_themeFocusNode.hasFocus) {
        _themeFocusNode.requestFocus();
      } else if (widget.isLanguageFocused && !_languageFocusNode.hasFocus) {
        _languageFocusNode.requestFocus();
      }
    } else {
      // Release focus when menu hides
      if (_themeFocusNode.hasFocus) _themeFocusNode.unfocus();
      if (_languageFocusNode.hasFocus) _languageFocusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _languageFocusNode.dispose();
    _themeFocusNode.dispose();
    super.dispose();
  }

  ThemeMode _nextThemeMode(ThemeMode current) {
    switch (current) {
      case ThemeMode.system:
        return ThemeMode.dark;
      case ThemeMode.dark:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.system;
    }
  }

  Locale _nextLocale(Locale current) {
    final code = current.languageCode.toLowerCase();
    return code == 'cs' ? const Locale('en') : const Locale('cs');
  }

  bool _isCenterActivateKey(LogicalKeyboardKey key) {
    return key == LogicalKeyboardKey.select ||
        key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.space ||
        key == LogicalKeyboardKey.numpadEnter ||
        key == LogicalKeyboardKey.gameButtonA;
  }

  void _cycleTheme(BuildContext context) {
    final bloc = context.read<ThemeModeBloc>();
    final current = bloc.state;
    final next = _nextThemeMode(current);
    bloc.add(ThemeModeChanged(next));
  }

  void _cycleLanguage(BuildContext context) {
    final bloc = context.read<LocaleControlBloc>();
    final current = bloc.state;
    final next = _nextLocale(current);
    bloc.add(LocaleChanged(next));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: widget.isVisible ? 0 : -300,
      top: 0,
      bottom: 0,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(5, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    l10n.settings,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // ---------------- LANGUAGE (focus + shortcuts + raw key) ----------------
                    Shortcuts(
                      shortcuts: <ShortcutActivator, Intent>{
                        LogicalKeySet(LogicalKeyboardKey.select):
                            CycleLanguageIntent(),
                        LogicalKeySet(LogicalKeyboardKey.enter):
                            CycleLanguageIntent(),
                        LogicalKeySet(LogicalKeyboardKey.space):
                            CycleLanguageIntent(),
                        LogicalKeySet(LogicalKeyboardKey.numpadEnter):
                            CycleLanguageIntent(),
                        LogicalKeySet(LogicalKeyboardKey.gameButtonA):
                            CycleLanguageIntent(),
                      },
                      child: Actions(
                        actions: <Type, Action<Intent>>{
                          CycleLanguageIntent:
                              CallbackAction<CycleLanguageIntent>(
                                onInvoke: (intent) {
                                  _cycleLanguage(context);
                                  return null;
                                },
                              ),
                        },
                        child: Focus(
                          focusNode: _languageFocusNode,

                          onKeyEvent: (node, event) {
                            if (event is KeyDownEvent &&
                                _isCenterActivateKey(event.logicalKey)) {
                              _cycleLanguage(context);
                              return KeyEventResult.handled;
                            }
                            return KeyEventResult.ignored;
                          },
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => _cycleLanguage(context),
                            child: Builder(
                              builder: (context) {
                                final locale = context
                                    .watch<LocaleControlBloc>()
                                    .state;
                                final lang =
                                    (locale.languageCode.toLowerCase() == 'cs')
                                    ? 'CS'
                                    : 'EN';

                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: widget.isLanguageFocused
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: widget.isLanguageFocused
                                          ? Colors.yellow
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color: widget.isLanguageFocused
                                            ? theme.colorScheme.onSurface
                                            : Colors.grey,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        '${l10n.language}: $lang',
                                        style: TextStyle(
                                          color: widget.isLanguageFocused
                                              ? theme.colorScheme.onSurface
                                              : Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ---------------- THEME (focus + shortcuts + raw key) ----------------
                    Shortcuts(
                      shortcuts: <ShortcutActivator, Intent>{
                        LogicalKeySet(LogicalKeyboardKey.select):
                            CycleThemeIntent(),
                        LogicalKeySet(LogicalKeyboardKey.enter):
                            CycleThemeIntent(),
                        LogicalKeySet(LogicalKeyboardKey.space):
                            CycleThemeIntent(),
                        LogicalKeySet(LogicalKeyboardKey.numpadEnter):
                            CycleThemeIntent(),
                        LogicalKeySet(LogicalKeyboardKey.gameButtonA):
                            CycleThemeIntent(),
                      },
                      child: Actions(
                        actions: <Type, Action<Intent>>{
                          CycleThemeIntent: CallbackAction<CycleThemeIntent>(
                            onInvoke: (intent) {
                              _cycleTheme(context);
                              return null;
                            },
                          ),
                        },
                        child: Focus(
                          focusNode: _themeFocusNode,

                          onKeyEvent: (node, event) {
                            if (event is KeyDownEvent &&
                                _isCenterActivateKey(event.logicalKey)) {
                              _cycleTheme(context);
                              return KeyEventResult.handled;
                            }
                            return KeyEventResult.ignored;
                          },
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => _cycleTheme(context),
                            child: Builder(
                              builder: (context) {
                                final mode = context
                                    .watch<ThemeModeBloc>()
                                    .state;
                                final modeLabel = switch (mode) {
                                  ThemeMode.dark => l10n.darkModeOption,
                                  ThemeMode.light => l10n.lightModeOption,
                                  ThemeMode.system => l10n.systemOption,
                                };

                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: widget.isThemeFocused
                                        ? Colors.white.withAlpha(10)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: widget.isThemeFocused
                                          ? Colors.yellow
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.palette,
                                        color: widget.isThemeFocused
                                            ? theme.colorScheme.onSurface
                                            : Colors.grey,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        '${l10n.theme}: $modeLabel',
                                        style: TextStyle(
                                          color: widget.isThemeFocused
                                              ? theme.colorScheme.onSurface
                                              : Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer with Harman Logo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 1)),
              ),
              child: Center(
                child: Assets.png.harmanLogo.image(
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
