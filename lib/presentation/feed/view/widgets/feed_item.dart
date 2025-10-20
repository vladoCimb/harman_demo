import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:harman_demo/presentation/feed/view/widgets/video_player_placeholder.dart';

class FeedItem extends StatefulWidget {
  final FeedModel feed;
  final bool isVideoFocused;
  final bool isInfoFocused;
  final bool isTitleFocused;
  final bool isDescriptionFocused;
  final bool isLikeFocused;
  final VoidCallback? onLikeTap;

  const FeedItem({
    super.key,
    required this.feed,
    this.isVideoFocused = false,
    this.isInfoFocused = false,
    this.isTitleFocused = false,
    this.isDescriptionFocused = false,
    this.isLikeFocused = false,
    this.onLikeTap,
  });

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final onSurface = cs.onSurface;
    final onSurfaceVariant = cs.onSurfaceVariant;

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final totalHeight = constraints.maxHeight;

        final videoHeight = totalHeight;
        final videoWidthByHeight = videoHeight * 9 / 16;

        double videoWidth = videoWidthByHeight;
        double videoHeightFinal = videoHeight;
        if (videoWidthByHeight > totalWidth) {
          videoWidth = totalWidth;
          videoHeightFinal = videoWidth * 16 / 9;
        }

        final videoCenterX = totalWidth / 2;
        final infoLeft = (videoCenterX + videoWidth / 2).clamp(0.0, totalWidth);

        return Stack(
          children: [
            // --- Centered 9:16 Video ---
            Align(
              alignment: Alignment.center,
              child: Focus(
                child: Container(
                  decoration: BoxDecoration(
                    border: widget.isVideoFocused
                        ? Border.all(color: Colors.yellow, width: 4)
                        : null,
                  ),
                  width: videoWidth,
                  height: videoHeightFinal,
                  child: const AspectRatio(
                    aspectRatio: 9 / 16,
                    child: VideoPlayerPlaceholder(),
                  ),
                ),
              ),
            ),

            // --- Right-side Info Panel ---
            Positioned(
              left: infoLeft,
              right: 0,
              top: 0,
              bottom: 0,
              child: IgnorePointer(
                ignoring: false,
                child: Focus(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Title
                        Focus(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.threeQuarter,
                              vertical: AppSpacing.half,
                            ),
                            decoration: BoxDecoration(
                              color: widget.isTitleFocused
                                  ? onSurface.withAlpha(40)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.feed.title,
                              style: AppTextStyle.headline6.copyWith(
                                color: widget.isTitleFocused
                                    ? onSurface
                                    : onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),

                        SizedBox(height: AppSpacing.threeQuarter),

                        // Description
                        Focus(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.threeQuarter,
                              vertical: AppSpacing.half,
                            ),
                            decoration: BoxDecoration(
                              color: widget.isDescriptionFocused
                                  ? onSurface.withAlpha(40)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.feed.description,
                              style: AppTextStyle.subtitle2.copyWith(
                                color: widget.isDescriptionFocused
                                    ? onSurface
                                    : onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),

                        SizedBox(height: AppSpacing.one),

                        // Like Button
                        Focus(
                          child: InkWell(
                            onTap: widget.onLikeTap,
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.threeQuarter,
                                vertical: AppSpacing.half,
                              ),
                              decoration: BoxDecoration(
                                color: widget.isLikeFocused
                                    ? onSurface.withAlpha(60)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    widget.feed.likedByUser
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: widget.isLikeFocused
                                        ? onSurface
                                        : (widget.feed.likedByUser
                                              ? Colors.red
                                              : onSurfaceVariant),
                                    size: 20,
                                  ),
                                  SizedBox(width: AppSpacing.half),
                                  Text(
                                    widget.feed.likedByUser ? 'Liked' : 'Like',
                                    style: AppTextStyle.body2.copyWith(
                                      color: widget.isLikeFocused
                                          ? onSurface
                                          : onSurfaceVariant,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
