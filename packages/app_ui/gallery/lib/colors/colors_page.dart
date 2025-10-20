import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const ColorsPage());
  }

  @override
  Widget build(BuildContext context) {
    const colorItems = [
      _ColorItem(name: 'Black', color: AppColors.black),
      _ColorItem(name: 'White', color: AppColors.white),
      _ColorItem(name: 'Transparent', color: AppColors.transparent),
      _ColorItem(name: 'Teal', color: AppColors.teal),
      _ColorItem(name: 'Neutral', color: AppColors.neutral),
      _ColorItem(name: 'Yellow', color: AppColors.yellow),
      _ColorItem(name: 'Green', color: AppColors.green),
      _ColorItem(name: 'Red', color: AppColors.red),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Colors')),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: colorItems,
      ),
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(name),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: color is MaterialColor
                  ? _MaterialColorView(color: color as MaterialColor)
                  : _ColorSquare(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialColorView extends StatelessWidget {
  const _MaterialColorView({required this.color});

  static const List<int> shades = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
  ];

  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: shades.map((shade) {
        if (color[shade] != null) {
          return _ColorSquare(color: color[shade]!);
        }
        return const SizedBox();
      }).toList(),
    );
  }
}

class _ColorSquare extends StatelessWidget {
  const _ColorSquare({required this.color});

  final Color color;

  TextStyle get textStyle {
    return TextStyle(
      color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
    );
  }

  String get hexCode {
    if (color.value.toRadixString(16).length <= 2) {
      return '--';
    } else {
      return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Stack(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, border: Border.all()),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: Text(hexCode, style: textStyle)),
          ),
        ],
      ),
    );
  }
}
