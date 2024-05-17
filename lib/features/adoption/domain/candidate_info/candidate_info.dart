import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_info.freezed.dart';
part 'candidate_info.g.dart';

@freezed
class CandidateInfo with _$CandidateInfo {
  factory CandidateInfo({
    required String fullname,
    required String age,
    required String department,
    required String city,
    required String neighborhood,
    required String address,
    required String phoneNumber,
    required String email,
    required String occupation,
  }) = _CandidateInfo;

  factory CandidateInfo.fromJson(Map<String, dynamic> json) =>
      _$CandidateInfoFromJson(json);
}
