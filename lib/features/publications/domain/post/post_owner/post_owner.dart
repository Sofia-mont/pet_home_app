import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_owner.freezed.dart';
part 'post_owner.g.dart';

@freezed
class PostOwner with _$PostOwner {
  factory PostOwner({
    required int id,
    required String name,
    required String userType,
  }) = _PostOwner;

  factory PostOwner.fromJson(Map<String, dynamic> json) =>
      _$PostOwnerFromJson(json);
}
