import 'package:flutter/material.dart';
import 'package:gallery/widgets/widgets.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const WidgetsPage());
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <ListItem>[
      ListItem(
        icon: const Icon(Icons.square),
        title: const Text('Icons'),
        onTap: () => Navigator.of(context).push<void>(IconsPage.route()),
      ),
      ListItem(
        icon: const Icon(Icons.square),
        title: const Text('Icon Decoration'),
        onTap: () =>
            Navigator.of(context).push<void>(IconDecorationPage.route()),
      ),
      ListItem(
        icon: const Icon(Icons.square),
        title: const Text('Button'),
        onTap: () => Navigator.of(context).push<void>(ButtonPage.route()),
      ),
      ListItem(
        icon: const Icon(Icons.square),
        title: const Text('Text buttons'),
        onTap: () => Navigator.of(context).push<void>(TextButtonPage.route()),
      ),
      ListItem(
        icon: const Icon(Icons.square),
        title: const Text('Text fields'),
        onTap: () => Navigator.of(context).push<void>(TextFieldPage.route()),
      ),
      ListItem(
        icon: const Icon(Icons.safety_divider),
        title: const Text('Dividers'),
        onTap: () => Navigator.of(context).push<void>(DividerPage.route()),
      ),
      ListItem(
        icon: const Icon(Icons.chat_bubble_outline_sharp),
        title: const Text('TabBar'),
        onTap: () => Navigator.of(context).push<void>(TabBarPage.route()),
      ),
      ListItem(
        icon: const Icon(Icons.switch_left_rounded),
        title: const Text('Switches'),
        onTap: () => Navigator.of(context).push<void>(
          SwitchesPage.route(),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Widgets')),
      body: ListView.separated(
        itemCount: widgets.length,
        itemBuilder: (_, index) => widgets[index],
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final VoidCallback onTap;
  final Widget icon;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconTheme.merge(
        data: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
        child: icon,
      ),
      title: title,
      trailing: const Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
