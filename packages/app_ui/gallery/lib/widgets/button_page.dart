import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const ButtonPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text buttons')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.four),
        child: ScrollableColumn(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
            const SizedBox(height: AppSpacing.one),
            const ElevatedButton(
              onPressed: null,
              child: Text('Button'),
            ),
            const SizedBox(height: AppSpacing.one),
            const ElevatedButton(
              onPressed: null,
              child: Text('Button'),
            ),
            const SizedBox(height: AppSpacing.one),
            const ElevatedButton(
              onPressed: null,
              child: Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
