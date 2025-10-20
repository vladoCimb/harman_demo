import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TextButtonPage extends StatelessWidget {
  const TextButtonPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const TextButtonPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text buttons')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.four),
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              child: const Text('Default active'),
              onPressed: () {},
            ),
            const SizedBox(height: AppSpacing.one),
            const TextButton(
              onPressed: null,
              child: Text('Default disabled'),
            ),
            const SizedBox(height: AppSpacing.one),
          ],
        ),
      ),
    );
  }
}
