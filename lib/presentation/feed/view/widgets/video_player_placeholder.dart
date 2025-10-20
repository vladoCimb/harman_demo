import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Placeholder for video player - replace with actual video player implementation
class VideoPlayerPlaceholder extends StatelessWidget {
  const VideoPlayerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        color: AppColors.neutral.shade800,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_circle_outline,
                size: 80,
                color: AppColors.white.withAlpha(178),
              ),
              SizedBox(height: AppSpacing.one),
              Text(
                'Video',
                style: AppTextStyle.headline3.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: AppSpacing.half),
              Text(
                'Vertical Video (9:16)',
                style: AppTextStyle.headline6.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
