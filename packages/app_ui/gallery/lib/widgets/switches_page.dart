import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SwitchesPage extends StatefulWidget {
  const SwitchesPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const SwitchesPage());
  }

  @override
  State<SwitchesPage> createState() => _SwitchesPageState();
}

class _SwitchesPageState extends State<SwitchesPage> {
  bool switch1 = true;
  bool switch2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switches page')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.four),
        child: ScrollableColumn(
          children: [
            Switch(
              value: switch1,
              onChanged: (value) {
                setState(() {
                  switch1 = value;
                });
              },
            ),
            Switch(
              value: switch2,
              onChanged: (value) {
                setState(() {
                  switch2 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
