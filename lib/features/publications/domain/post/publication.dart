import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Publication;

  factory Publication.fromJson(Map<String, dynamic> json) =>
      _$PublicationFromJson(json);
}
