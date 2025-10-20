import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class IconsPage extends StatelessWidget {
  const IconsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const IconsPage());
  }

  static const Map<String, IconData> icons = {
    'bell': TemplateAppIcons.bell,
    'book': TemplateAppIcons.book,
    'cancel': TemplateAppIcons.cancel,
    'canine': TemplateAppIcons.canine,
    'chemistry': TemplateAppIcons.chemistry,
    'close': TemplateAppIcons.close,
    'down': TemplateAppIcons.down,
    'endocrinology': TemplateAppIcons.endocrinology,
    'equine': TemplateAppIcons.equine,
    'feline': TemplateAppIcons.feline,
    'folder': TemplateAppIcons.folder,
    'hematology': TemplateAppIcons.hematology,
    'immunology': TemplateAppIcons.immunology,
    'info': TemplateAppIcons.info,
    'left': TemplateAppIcons.left,
    'mark_read': TemplateAppIcons.mark_read,
    'mark_unread': TemplateAppIcons.mark_unread,
    'microbiology': TemplateAppIcons.microbiology,
    'molecular_diagnostics': TemplateAppIcons.molecular_diagnostics,
    'more': TemplateAppIcons.more,
    'no_connection': TemplateAppIcons.no_connection,
    'other_service_category': TemplateAppIcons.other_service_category,
    'other_species': TemplateAppIcons.other_species,
    'parasitology': TemplateAppIcons.parasitology,
    'pathology': TemplateAppIcons.pathology,
    'question_mark': TemplateAppIcons.question_mark,
    'right': TemplateAppIcons.right,
    'sereology': TemplateAppIcons.serology,
    'settings': TemplateAppIcons.settings,
    'share_android': TemplateAppIcons.share_android,
    'share_ios': TemplateAppIcons.share_ios,
    'theraputics': TemplateAppIcons.theraputics,
    'up': TemplateAppIcons.up,
    'radiology': TemplateAppIcons.radiology,
    'urinalysis': TemplateAppIcons.urinalysis,
    'alert': TemplateAppIcons.alert,
    'search': TemplateAppIcons.search,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icons')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.one),
        child: ListView.builder(
          itemCount: icons.length,
          itemBuilder: (context, index) {
            final entry = icons.entries.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.oneAndHalf,
                horizontal: AppSpacing.two,
              ),
              child: _IconShowcase(
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

class _IconShowcase extends StatelessWidget {
  const _IconShowcase({
    required this.title,
    required this.iconData,
  });

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final themeExtension = Theme.of(context).themeExtension;
    final iconTheme = themeExtension.iconTheme;

    final styles = [
      iconTheme.extraSmall,
      iconTheme.small,
      iconTheme.medium,
      iconTheme.large,
      iconTheme.extraLarge,
    ];

    final icons = <Widget>[];
    for (final style in styles) {
      icons.add(
        IconTheme(
          data: style,
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
