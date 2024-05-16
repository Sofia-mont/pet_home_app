import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_composition.freezed.dart';
part 'family_composition.g.dart';

@freezed
class FamilyComposition with _$FamilyComposition {
  factory FamilyComposition({
    required int adultsHome,
    required int kidsHome,
    required int babiesHome,
    required String ages,
    required String composition,
  }) = _FamilyComposition;

  factory FamilyComposition.fromJson(Map<String, dynamic> json) =>
      _$FamilyCompositionFromJson(json);
}
