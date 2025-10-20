import 'package:equatable/equatable.dart';

class FeedModel extends Equatable {
  final String title;
  final String description;
  final String videoUrl;
  final bool likedByUser;

  const FeedModel({
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.likedByUser,
  });

  FeedModel copyWith({
    String? title,
    String? description,
    String? videoUrl,
    bool? likedByUser,
  }) {
    return FeedModel(
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      likedByUser: likedByUser ?? this.likedByUser,
    );
  }

  @override
  List<Object?> get props => [title, description, videoUrl, likedByUser];
}
