import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const DividerPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dividers')),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.four),
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Some random text placed above divider'),
            ),
            Divider(),
            SizedBox(height: AppSpacing.two),
            Divider(),
            SizedBox(height: AppSpacing.two),
            Divider(),
            SizedBox(height: AppSpacing.two),
            Divider(),
          ],
        ),
      ),
    );
  }
}
