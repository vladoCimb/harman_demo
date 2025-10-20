import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:feed_repository/repositories/feed_repository.dart';
import 'package:flutter/services.dart';
import 'package:harman_demo/presentation/feed/utils/feed_logical_key.dart';

part 'feed_event.dart';
part 'feed_state.dart';

enum FocusArea { video, title, description, like, sideMenu, language, theme }

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({required this.feedRepository}) : super(FeedInitial()) {
    on<FeedKeyEvent>(_onFeedKeyEvent);
    on<LoadFeedEvent>(_onLoadFeedEvent);
    on<ToggleLikeEvent>(_onToggleLikeEvent);
    on<ChangePageEvent>(_onChangePageEvent);

    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  final FeedRepository feedRepository;

  bool _handleKeyEvent(KeyEvent key) {
    if (key is! KeyUpEvent) {
      return false;
    }

    final feedKey = FeedLogicalKey.fromKeyEvent(key);
    if (feedKey != null) {
      add(FeedKeyEvent(feedKey));
      return true;
    }
    return false;
  }

  FutureOr<void> _onLoadFeedEvent(
    LoadFeedEvent event,
    Emitter<FeedState> emit,
  ) async {
    emit(FeedLoading());

    final feedEntities = await feedRepository.getFeedData();

    emit(
      FeedLoaded(
        feeds: feedEntities,
        currentIndex: 0,
        currentFocus: FocusArea.video,
        isSideMenuVisible: false,
      ),
    );
  }

  FutureOr<void> _onToggleLikeEvent(
    ToggleLikeEvent event,
    Emitter<FeedState> emit,
  ) {
    if (state is FeedLoaded) {
      final currentState = state as FeedLoaded;
      final updatedFeeds = List<FeedModel>.from(currentState.feeds);
      updatedFeeds[event.index] = updatedFeeds[event.index].copyWith(
        likedByUser: !updatedFeeds[event.index].likedByUser,
      );

      emit(currentState.copyWith(feeds: updatedFeeds));
    }
  }

  FutureOr<void> _onChangePageEvent(
    ChangePageEvent event,
    Emitter<FeedState> emit,
  ) {
    if (state is FeedLoaded) {
      final currentState = state as FeedLoaded;
      final newIndex = event.newIndex.clamp(0, currentState.feeds.length - 1);

      emit(
        currentState.copyWith(
          currentIndex: newIndex,
          currentFocus: FocusArea.video,
        ),
      );
    }
  }

  FutureOr<void> _onFeedKeyEvent(
    FeedKeyEvent event,
    Emitter<FeedState> emit,
  ) async {
    if (state is! FeedLoaded) return;

    final currentState = state as FeedLoaded;

    switch (event.key) {
      case FeedLogicalKey.left:
        _handleLeftKey(currentState, emit);
        break;
      case FeedLogicalKey.right:
        _handleRightKey(currentState, emit);
        break;
      case FeedLogicalKey.up:
        _handleUpKey(currentState, emit);
        break;
      case FeedLogicalKey.down:
        _handleDownKey(currentState, emit);
        break;
      case FeedLogicalKey.center:
        _handleCenterKey(currentState, emit);
        break;
      case FeedLogicalKey.back:
        _handleBackKey(currentState, emit);
        break;
    }
  }

  void _handleLeftKey(FeedLoaded currentState, Emitter<FeedState> emit) {
    switch (currentState.currentFocus) {
      case FocusArea.video:
        emit(
          currentState.copyWith(
            isSideMenuVisible: true,
            currentFocus: FocusArea.language,
          ),
        );
        break;
      case FocusArea.title:
      case FocusArea.description:
      case FocusArea.like:
        emit(currentState.copyWith(currentFocus: FocusArea.video));
        break;
      case FocusArea.sideMenu:
      case FocusArea.language:
      case FocusArea.theme:
        // Already in side menu, do nothing
        break;
    }
  }

  void _handleRightKey(FeedLoaded currentState, Emitter<FeedState> emit) {
    switch (currentState.currentFocus) {
      case FocusArea.video:
        emit(currentState.copyWith(currentFocus: FocusArea.title));
        break;

      case FocusArea.title:
      case FocusArea.description:
      case FocusArea.like:
        // Stay in info area
        break;
      case FocusArea.sideMenu:
      case FocusArea.language:
      case FocusArea.theme:
        emit(
          currentState.copyWith(
            isSideMenuVisible: false,
            currentFocus: FocusArea.video,
          ),
        );
        break;
    }
  }

  void _handleUpKey(FeedLoaded currentState, Emitter<FeedState> emit) {
    switch (currentState.currentFocus) {
      case FocusArea.video:
        // Navigate to previous video (like YouTube Shorts)
        if (currentState.currentIndex > 0) {
          add(ChangePageEvent(currentState.currentIndex - 1));
        }
        break;

      case FocusArea.title:
        // Stay on title
        break;
      case FocusArea.description:
        emit(currentState.copyWith(currentFocus: FocusArea.title));
        break;
      case FocusArea.like:
        emit(currentState.copyWith(currentFocus: FocusArea.description));
        break;
      case FocusArea.sideMenu:
      case FocusArea.language:
        emit(currentState.copyWith(currentFocus: FocusArea.language));
        break;
      case FocusArea.theme:
        emit(currentState.copyWith(currentFocus: FocusArea.language));
        break;
    }
  }

  void _handleDownKey(FeedLoaded currentState, Emitter<FeedState> emit) {
    switch (currentState.currentFocus) {
      case FocusArea.video:
        // Navigate to next video (like YouTube Shorts)
        if (currentState.currentIndex < currentState.feeds.length - 1) {
          add(ChangePageEvent(currentState.currentIndex + 1));
        }
        break;

      case FocusArea.title:
        emit(currentState.copyWith(currentFocus: FocusArea.description));
        break;
      case FocusArea.description:
        emit(currentState.copyWith(currentFocus: FocusArea.like));
        break;
      case FocusArea.like:
        // Stay on like
        break;
      case FocusArea.sideMenu:
      case FocusArea.language:
        emit(currentState.copyWith(currentFocus: FocusArea.theme));
        break;
      case FocusArea.theme:
        // Stay on theme
        break;
    }
  }

  void _handleCenterKey(FeedLoaded currentState, Emitter<FeedState> emit) {
    switch (currentState.currentFocus) {
      case FocusArea.like:
        add(ToggleLikeEvent(currentState.currentIndex));
        break;
      case FocusArea.language:
        // Handle language change
        break;
      case FocusArea.theme:
        break;
      default:
        // Do nothing for other areas
        break;
    }
  }

  void _handleBackKey(FeedLoaded currentState, Emitter<FeedState> emit) {
    if (currentState.isSideMenuVisible) {
      emit(
        currentState.copyWith(
          isSideMenuVisible: false,
          currentFocus: FocusArea.video,
        ),
      );
    }
  }
}
