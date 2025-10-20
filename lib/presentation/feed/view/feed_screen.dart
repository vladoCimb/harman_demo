import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/repositories/feed_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harman_demo/presentation/feed/bloc/feed_bloc.dart';
import 'package:harman_demo/presentation/feed/utils/feed_logical_key.dart';
import 'package:harman_demo/presentation/feed/view/widgets/feed_item.dart';
import 'package:harman_demo/presentation/feed/view/widgets/side_navigation_menu.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late FeedBloc _feedBloc;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _feedBloc = FeedBloc(feedRepository: context.read<FeedRepository>());
    _pageController = PageController();

    _feedBloc.add(LoadFeedEvent());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => _feedBloc,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: BlocBuilder<FeedBloc, FeedState>(
          bloc: _feedBloc,

          builder: (context, state) {
            if (state is FeedLoaded) {
              // Sync PageController with current index
              if (_pageController.hasClients &&
                  _pageController.page?.round() != state.currentIndex) {
                _pageController.animateToPage(
                  state.currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }

              return Stack(
                children: [
                  // Main Feed Content with PageView
                  PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index) {
                      _feedBloc.add(ChangePageEvent(index));
                    },
                    itemCount: state.feeds.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: FeedItem(
                          feed: state.feeds[index],
                          isVideoFocused:
                              state.currentFocus == FocusArea.video &&
                              state.currentIndex == index,
                          isTitleFocused:
                              state.currentFocus == FocusArea.title &&
                              state.currentIndex == index,
                          isDescriptionFocused:
                              state.currentFocus == FocusArea.description &&
                              state.currentIndex == index,
                          isLikeFocused:
                              state.currentFocus == FocusArea.like &&
                              state.currentIndex == index,
                          onLikeTap: () {
                            _feedBloc.add(
                              const FeedKeyEvent(FeedLogicalKey.center),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  // Side Navigation Menu
                  SideNavigationMenu(
                    isVisible: state.isSideMenuVisible,
                    isLanguageFocused: state.currentFocus == FocusArea.language,
                    isThemeFocused: state.currentFocus == FocusArea.theme,
                  ),

                  // Debug Info
                  Positioned(
                    top: AppSpacing.two,
                    right: AppSpacing.one,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Focus: ${state.currentFocus.name}\n'
                        'Side Menu: ${state.isSideMenuVisible}\n'
                        'Current Index: ${state.currentIndex}',
                        style: AppTextStyle.body2,
                      ),
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
