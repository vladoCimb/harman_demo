import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const TabBarPage());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar page'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Tab item 2',
              ),
              Tab(
                text: 'Tab item 3',
              ),
              Tab(
                text: 'Tab item 4',
              ),
              Tab(
                text: 'Tab item 5',
              ),
              Tab(
                text: 'Tab item 6',
              ),
            ],
          ),
        ),
        body: const SizedBox.shrink(),
      ),
    );
  }
}
