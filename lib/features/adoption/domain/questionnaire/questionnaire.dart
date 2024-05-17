import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionnaire.freezed.dart';
part 'questionnaire.g.dart';

@freezed
class Questionnaire with _$Questionnaire {
  factory Questionnaire({
    String? allergic,
    String? needsEconomically,
    String? hoursAlone,
    String? availableTime,
    String? allergyHappened,
    String? pregnancyHappened,
    String? petsBefore,
    String? reason,
    String? houseType,
    String? destinedPlace,
    String? patioTerraceCover,
    String? ownRent,
    String? regulationAllow,
    String? mindedProtections,
  }) = _Questionnaire;

  factory Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFromJson(json);
}
