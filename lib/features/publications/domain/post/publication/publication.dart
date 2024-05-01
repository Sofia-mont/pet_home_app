import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_home/features/publications/domain/post/post_owner/post_owner.dart';

part 'publication.freezed.dart';
part 'publication.g.dart';

@freezed
class Publication with _$Publication {
  factory Publication({
    required int id,
    required String department,
    required String city,
    required String petName,
    required String petHistory,
    required String petPersonality,
    required String petType,
    required String petSex,
    required String petAge,
    required String petSize,
    required String postState,
    required bool vaccinated,
    required bool dewormed,
    required bool neutered,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    PostOwner? user,
  }) = _Publication;

  factory Publication.fromJson(Map<String, dynamic> json) =>
      _$PublicationFromJson(json);
}
