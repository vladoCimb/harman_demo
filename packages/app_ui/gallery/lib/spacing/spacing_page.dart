import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const SpacingPage());
  }

  @override
  Widget build(BuildContext context) {
    const spacingList = [
      _SpacingItem(spacing: AppSpacing.eighth, name: 'eighth'),
      _SpacingItem(spacing: AppSpacing.quarter, name: 'quarter'),
      _SpacingItem(spacing: AppSpacing.threeEighths, name: 'threeEighths'),
      _SpacingItem(spacing: AppSpacing.half, name: 'half'),
      _SpacingItem(spacing: AppSpacing.threeQuarter, name: 'three quarter'),
      _SpacingItem(spacing: AppSpacing.one, name: 'one'),
      _SpacingItem(spacing: AppSpacing.oneAndHalf, name: 'one and half'),
      _SpacingItem(spacing: AppSpacing.two, name: 'two'),
      _SpacingItem(spacing: AppSpacing.four, name: 'four'),
      _SpacingItem(spacing: AppSpacing.six, name: 'six'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Spacing')),
      body: ListView(shrinkWrap: true, children: spacingList),
    );
  }
}

class _SpacingItem extends StatelessWidget {
  const _SpacingItem({required this.spacing, required this.name});

  final double spacing;
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.half),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: AppColors.black,
                width: AppSpacing.eighth,
                height: AppSpacing.half,
              ),
              Container(
                width: spacing,
                height: AppSpacing.one,
                color: theme.colorScheme.primary,
              ),
              Container(
                color: AppColors.black,
                width: AppSpacing.eighth,
                height: AppSpacing.half,
              ),
            ],
          ),
          const SizedBox(width: AppSpacing.half),
          Text(name),
        ],
      ),
    );
  }
}
