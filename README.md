# Harman / Roon demo project

- Demo project created by Vladimír Čimbora for Harman / Roon to demonstrate the capabilities of building a TV application using Flutter. 
  The application is developed with Flutter 3.24.0 and Dart 3.9.2, demonstrating a simple TV interface inspired by YouTube Shorts. It uses Flutter Bloc for state management and illustrates several approaches to handling navigation and key events:
    1.	In feed_bloc, where key events are captured using HardwareKeyboard.instance.
    2.	In side_navigation_menu, where navigation is managed via Shortcuts and Actions.

 The codebase is intentionally kept clean and lightweight while still demonstrating solid architecture principles and best practices.

- Solution has dark and light mode. Please bear in mind that I didn't aim to make light mode looks good and I used random colors. I just wanted to demonstrate a fully themable solution.

- Application is prepared to support multiple languages. At this moment there is English and Czech.

- Part of the solution is app_ui which is design system that contains gallery application. In a gallery you can browse through the design system. Gallery can be distributed through github pages as web page.

- Application is fully buildable and functional on android TV simualtor. Please disable impeller for launching the application.
  Use flag  "--no-enable-impeller",

- Applications supports multiple flavors staging and production.
If there is any issues building the project make sure your launch.json in .vscode looks like this

```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "staging",
            "request": "launch",
            "type": "dart",
            "program": "lib/main/main_staging.dart",
            "args": [
                "--no-enable-impeller",
                "--flavor",
                "staging",
                "--target",
                "lib/main/main_staging.dart"
            ]
        },
        {
            "name": "production",
            "request": "launch",
            "type": "dart",
            "program": "lib/main/main_production.dart",
            "args": [
                "--no-enable-impeller",
                "--flavor",
                "production",
                "--target",
                "lib/main/main_production.dart"
            ]
        },
    ]
}
```

- If you found this interesting there another README in app_ui package that describe some practices and usage of app_ui: [app_ui README](./packages/app_ui/README.md) 

---

## Getting Started 🚀

This project contains 2 flavors:

- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Staging
$ flutter run --flavor staging --no-enable-impeller --target lib/main/main_staging.dart

# Production
$ flutter run --flavor production --no-enable-impeller --target lib/main/main_production.dart
```

---


## Working with Translations 🌐

This project relies on [flutter_localizations](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html) and follows the [official internationalization guide for Flutter](https://flutter.dev/docs/development/accessibility-and-localization/internationalization).

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:harman_demo/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

## Generating assets 🖼️

I am using [flutter_gen](https://pub.dev/packages/flutter_gen) to generate statically safe descriptions of image and font assets.

You need to install the `flutter_gen` tool via brew or pub, by following the [installation instruction](https://pub.dev/packages/flutter_gen/install). The configuration of the tool is stored in `pubspec.yaml`.

After that you can easily recreate the assets descriptions by calling:

```bash
$> fluttergen
```

Then to reference the asset you can call:

```dart
Assets.images.discord.image(height: 120),
```

If you're adding new assets to ui library, make sure to run `fluttergen` inside the package directory as well.


