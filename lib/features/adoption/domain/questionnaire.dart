import 'package:equatable/equatable.dart';

class Questionnaire extends Equatable {
  const Questionnaire({
    this.reason,
    this.houseType,
    this.ownRent,
    this.regulationAllow,
    this.patioTerraceCover,
    this.mindedProtections,
    this.destinedPlace,
    this.allergic,
    this.needsEconomically,
    this.hoursAlone,
    this.availableTime,
    this.allergyHappened,
    this.pregnancyHappened,
    this.petsBefore,
  });

  final String? reason;
  final String? houseType;
  final String? ownRent;
  final String? regulationAllow;
  final String? patioTerraceCover;
  final String? mindedProtections;
  final String? destinedPlace;
  final String? allergic;
  final String? needsEconomically;
  final String? hoursAlone;
  final String? availableTime;
  final String? allergyHappened;
  final String? pregnancyHappened;
  final String? petsBefore;

  Questionnaire copyWith({
    String? reason,
    String? houseType,
    String? ownRent,
    String? regulationAllow,
    String? patioTerraceCover,
    String? mindedProtections,
    String? destinedPlace,
    String? allergic,
    String? needsEconomically,
    String? hoursAlone,
    String? availableTime,
    String? allergyHappened,
    String? pregnancyHappened,
    String? petsBefore,
  }) {
    return Questionnaire(
      reason: reason ?? this.reason,
      houseType: houseType ?? this.houseType,
      ownRent: ownRent ?? this.ownRent,
      regulationAllow: regulationAllow ?? this.regulationAllow,
      patioTerraceCover: patioTerraceCover ?? this.patioTerraceCover,
      mindedProtections: mindedProtections ?? this.mindedProtections,
      destinedPlace: destinedPlace ?? this.destinedPlace,
      allergic: allergic ?? this.allergic,
      needsEconomically: needsEconomically ?? this.needsEconomically,
      hoursAlone: hoursAlone ?? this.hoursAlone,
      availableTime: availableTime ?? this.availableTime,
      allergyHappened: allergyHappened ?? this.allergyHappened,
      pregnancyHappened: pregnancyHappened ?? this.pregnancyHappened,
      petsBefore: petsBefore ?? this.petsBefore,
    );
  }

  factory Questionnaire.fromJson(Map<String, dynamic> json) {
    return Questionnaire(
      reason: json['reason'],
      houseType: json['houseType'],
      ownRent: json['ownRent'],
      regulationAllow: json['regulationAllow'],
      patioTerraceCover: json['patioTerraceCover'],
      mindedProtections: json['mindedProtections'],
      destinedPlace: json['destinedPlace'],
      allergic: json['allergic'],
      needsEconomically: json['needsEconomically'],
      hoursAlone: json['hoursAlone'],
      availableTime: json['availableTime'],
      allergyHappened: json['allergyHappened'],
      pregnancyHappened: json['pregnancyHappened'],
      petsBefore: json['petsBefore'],
    );
  }

  Map<String, dynamic> toJson() => {
        'reason': reason,
        'houseType': houseType,
        'ownRent': ownRent,
        'regulationAllow': regulationAllow,
        'patioTerraceCover': patioTerraceCover,
        'mindedProtections': mindedProtections,
        'destinedPlace': destinedPlace,
        'allergic': allergic,
        'needsEconomically': needsEconomically,
        'hoursAlone': hoursAlone,
        'availableTime': availableTime,
        'allergyHappened': allergyHappened,
        'pregnancyHappened': pregnancyHappened,
        'petsBefore': petsBefore,
      };

  @override
  String toString() {
    return '$reason, $houseType, $ownRent, $regulationAllow, $patioTerraceCover, $mindedProtections, $destinedPlace, $allergic, $needsEconomically, $hoursAlone, $availableTime, $allergyHappened, $pregnancyHappened, $petsBefore, ';
  }

  @override
  List<Object?> get props => [
        reason,
        houseType,
        ownRent,
        regulationAllow,
        patioTerraceCover,
        mindedProtections,
        destinedPlace,
        allergic,
        needsEconomically,
        hoursAlone,
        availableTime,
        allergyHappened,
        pregnancyHappened,
        petsBefore,
      ];
}
