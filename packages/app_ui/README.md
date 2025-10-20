# UI Kit (app_ui) 👨‍🎨

A UI Kit

## Table of Contents

- [Widgets](#widgets)
  - [Icons](#icons)
  - [Creating your first Widget](#creating-your-first-widget)

# Widgets

## Icons

[widgets__icons__template_app_icon_theme]: ./lib/src/widgets/icons/template_icon_theme.dart
[widgets__icons__gallery_icons_page_code]: ./gallery/lib/widgets/icons_page.dart
[widgets__icons__icon_styles_image]: ./art/docs/icon_styles.png
[widgets__icons__flutter_icon_link]: https://www.fluttericon.com/

### Basic usage 🚀

```dart
Icon(TemplateAppIcons.bell);
```

For more information, you can visit the [gallery example][widgets__icons__gallery_icons_page_code] or continue reading the upcoming sections.

### Theming 🎨

The theme provided by this package adds a [`TemplateIconTheme`][widgets__icons__template_app_icon_theme] that provides five different styles:

![icon styles][widgets__icons__icon_styles_image]

If you wish to theme the `Icon` widget, in other words, avoid having it themed to medium (since this is the default), you should wrap the `Icon` with an `IconTheme`.

For example, the following snippet of code makes the icon be extra large:

```dart
final themeExtension = Theme.of(context).themeExtension;

IconTheme(
  data: themeExtension.iconsTheme.extraLarge,
  child: const Icon(TemplateAppIcons.bell),
),
```

### Generating new Icons ⚙️

This package uses custom font icons. The icons have been converted from Scalable Vector Graphic's (SVGs) into a True Type Font (ttf) using [fluttericon][widgets__icons__flutter_icon_link].

Then, the generated ttf file is used to produce `IconData` classes to be used. The `codePoints` can be found on the downloadable zip file [fluttericon][widgets__icons__flutter_icon_link] generates.


## Creating your first Widget

[contributing__new_widgets__material]: https://docs.flutter.dev/development/ui/widgets/material

This section aims to describe and document the process of adding a new widget to `app_ui`.

### Before you start ✏️

Before creating a new widget, ensure that there is not already a widget in the [Material][contributing__new_widgets__material] library or in this package.

You should ensure that a design specification for this widget has been provided by the design team before implementing.

Once you have a design specification, create a new file named as your widget. Make sure to prefix "TemplateApp" if the widget is specific to the Template App design system.

The name of the widget should be provided by and consulted with the design team beforehand.

```
├── lib
│   ├── src
│   │   ├── widgets
│   │   │   ├── template_app_foo.dart
```

### Theming 🎨

This package should aim to provide a consistent theming strategy through all its widgets. Consistency speeds up development for users of this package.

All themable widgets should have a `style` property of type `FooTheme`. `FooThemeData` should hold `FooTheme`.`FooThemeData` should be added to `ThemeDataExtension`.

For example:

You're required to implement a themable polygon widget named `TemplateAppPolygon`. The design team requires the number of edges and background color to be themable. They have also designed three themable instances:

- Primary, which consists of 6 edges (hexagon) and its background color is green.
- Tertiary, which consists of 7 edges (heptagon) and its background color is yellow.
- Secondary, which consists of 8 edges (octagon) ad its background color is red.

You should define:

1. A `TemplateAppPolygonThemeData`, which may look as:
```dart
class TemplateAppPolygonThemeData {
  TemplateAppPolygonTheme({
    required this.edges,
    required this.backgroundColor,
  });

  final int edges;

  final Color backgroundColor;

  TemplateAppPolygonThemeData lerp(TemplateAppPolygonThemeData? other, double t) {
    // TODO: Implement lerp logic.
  }

  TemplateAppPolygonThemeData copyWith({
    int? edges,
    Color? backgroundColor,
  }) {
    return TemplateAppPolygonThemeData(
      edges: edges ?? this.edges,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
```

2. A `TemplateAppPolygonTheme`, which may look as:

```dart
class TemplateAppPolygonTheme {
  TemplateAppPolygonTheme({
    this.primary,
    this.secondary,
    this.tertiary,
  });

  final TemplateAppPolygonThemeData primary;
  final TemplateAppPolygonThemeData secondary;
  final TemplateAppPolygonThemeData tertiary;

  TemplateAppPolygonTheme lerp(
    TemplateAppPolygonTheme? other,
    double t,
  ) {
    // TODO: implement lerp.
  }

  TemplateAppPolygonTheme copyWith() {
    // TODO: implement copyWith.
  }
}
```

3. Add `TemplateAppPolygonTheme` to the existing `ThemeDataExtension`.

```dart
class ThemeDataExtension extends ThemeExtension<ThemeDataExtension> {
  ...

  final TemplateAppPolygonTheme polygonTheme;

  ...
}
```

> **NOTE**: Make sure you modify the `lerp` method in order to allow the Flutter framework to easily linearly interpolate themed widgets when animating.

> **NOTE**: If a `TemplateAppPolygonTheme` only had a single `TemplateAppPolygonThemeData` (in other words, there only exists a primary theme), then `TemplateAppPolygonThemeData` can be used instead of `TemplateAppPolygonTheme`.

4. Define a style property for your themable widget:

```dart
class TemplateAppPolygon extends StatelessWidget {
  const TemplateAppPolygon({super.key, this.style});

  /// If non-null, the style to use for this polygon.
  ///
  /// Defaults to [TemplateAppPolygonTheme.primary].
  final TemplateAppPolygonThemeData? style;

  @override
  Widget build(BuildContext context) {
    var style =
        this.style ?? Theme.of(context).themeExtension.polygonTheme.primary;

    // TODO: Implement polygon.
  }
}
```

> **NOTE**: Ensure the style documentation clearly defines the default style.

5. Use your widget:

```dart
final themeExtension = Theme.of(context).themeExtension;

TemplateAppPolygon(
  style: themeExtension.polygonTheme.secondary,
);
```
