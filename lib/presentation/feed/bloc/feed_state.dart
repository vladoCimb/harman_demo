part of 'feed_bloc.dart';

sealed class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

final class FeedInitial extends FeedState {}

final class FeedLoading extends FeedState {}

final class FeedLoaded extends FeedState {
  final List<FeedModel> feeds;
  final int currentIndex;
  final FocusArea currentFocus;
  final bool isSideMenuVisible;

  const FeedLoaded({
    required this.feeds,
    required this.currentIndex,
    required this.currentFocus,
    required this.isSideMenuVisible,
  });

  FeedLoaded copyWith({
    List<FeedModel>? feeds,
    int? currentIndex,
    FocusArea? currentFocus,
    bool? isSideMenuVisible,
  }) {
    return FeedLoaded(
      feeds: feeds ?? this.feeds,
      currentIndex: currentIndex ?? this.currentIndex,
      currentFocus: currentFocus ?? this.currentFocus,
      isSideMenuVisible: isSideMenuVisible ?? this.isSideMenuVisible,
    );
  }

  @override
  List<Object> get props => [
    feeds,
    currentIndex,
    currentFocus,
    isSideMenuVisible,
  ];
}
