part of 'feed_bloc.dart';

sealed class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class FeedKeyEvent extends FeedEvent {
  final FeedLogicalKey key;

  const FeedKeyEvent(this.key);

  @override
  List<Object> get props => [key];
}

class LoadFeedEvent extends FeedEvent {
  const LoadFeedEvent();

  @override
  List<Object> get props => [];
}

class ToggleLikeEvent extends FeedEvent {
  final int index;

  const ToggleLikeEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ChangePageEvent extends FeedEvent {
  final int newIndex;

  const ChangePageEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}
