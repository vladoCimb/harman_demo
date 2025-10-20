import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const TypographyPage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final textStyleList = [
      _TextItem(name: 'Title Large', style: textTheme.titleLarge!),
      _TextItem(name: 'Title Medium', style: textTheme.titleMedium!),
      _TextItem(name: 'Title Small', style: textTheme.titleSmall!),
      _TextItem(name: 'Body Large', style: textTheme.bodyLarge!),
      _TextItem(name: 'Body Medium', style: textTheme.bodyMedium!),
      _TextItem(name: 'Body Small', style: textTheme.bodySmall!),
      _TextItem(name: 'Label Large', style: textTheme.labelLarge!),
      _TextItem(name: 'Label Medium', style: textTheme.labelMedium!),
      _TextItem(name: 'Label Small', style: textTheme.labelSmall!),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Typography')),
      body: ListView(shrinkWrap: true, children: textStyleList),
    );
  }
}

class _TextItem extends StatelessWidget {
  const _TextItem({
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.half,
        vertical: AppSpacing.one,
      ),
      child: Text(name, style: style),
    );
  }
}
