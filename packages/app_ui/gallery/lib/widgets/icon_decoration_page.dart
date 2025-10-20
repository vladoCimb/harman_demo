import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gallery/widgets/widgets.dart';

class IconDecorationPage extends StatelessWidget {
  const IconDecorationPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const IconDecorationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Decoration')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.one),
        child: ListView.builder(
          itemCount: IconsPage.icons.length,
          itemBuilder: (context, index) {
            final entry = IconsPage.icons.entries.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.oneAndHalf,
                horizontal: AppSpacing.two,
              ),
              child: _IconDecorationShowcase(
                title: entry.key,
                iconData: entry.value,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _IconDecorationShowcase extends StatelessWidget {
  const _IconDecorationShowcase({
    required this.title,
    required this.iconData,
  });

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).themeExtension.iconDecorationTheme;
    final styles = [
      theme.extraSmall,
      theme.small,
      theme.medium,
      theme.large,
      theme.extraLarge,
    ];

    final icons = <Widget>[];
    for (final style in styles) {
      icons.add(
        IconDecoration(
          style: style,
          child: Icon(iconData),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: icons,
        ),
      ],
    );
  }
}
