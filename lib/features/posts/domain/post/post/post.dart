import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_home/features/posts/domain/post/post_owner/post_owner.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required int id,
    required String department,
    required String city,
    required String petName,
    required String petHistory,
    required String petType,
    required String petSex,
    required String petAge,
    required String petSize,
    required String postState,
    required bool vaccinated,
    required bool dewormed,
    required bool neutered,
    required DateTime createdAt,
    required PostOwner postOwner,
    required List<String> petImages,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
