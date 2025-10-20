import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const TextFieldPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text fields')),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Padding(
          padding: EdgeInsets.all(AppSpacing.four),
          child: ScrollableColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Label text',
                ),
              ),
              SizedBox(height: AppSpacing.one),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Obscure',
                ),
                obscureText: true,
              ),
              SizedBox(height: AppSpacing.one),
            ],
          ),
        ),
      ),
    );
  }
}
