import 'package:equatable/equatable.dart';

class FamilyComposition extends Equatable {
  const FamilyComposition({
    required this.adultsHome,
    required this.kidsHome,
    required this.babiesHome,
    required this.ages,
    required this.composition,
  });

  final int adultsHome;
  final int kidsHome;
  final int babiesHome;
  final String ages;
  final String composition;

  FamilyComposition copyWith({
    int? adultsHome,
    int? kidsHome,
    int? babiesHome,
    String? ages,
    String? composition,
  }) {
    return FamilyComposition(
      adultsHome: adultsHome ?? this.adultsHome,
      kidsHome: kidsHome ?? this.kidsHome,
      babiesHome: babiesHome ?? this.babiesHome,
      ages: ages ?? this.ages,
      composition: composition ?? this.composition,
    );
  }

  factory FamilyComposition.fromJson(Map<String, dynamic> json) {
    return FamilyComposition(
      adultsHome: json['adultsHome'] ?? 0,
      kidsHome: json['kidsHome'] ?? 0,
      babiesHome: json['babiesHome'] ?? 0,
      ages: json['ages'] ?? '',
      composition: json['composition'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'adultsHome': adultsHome,
        'kidsHome': kidsHome,
        'babiesHome': babiesHome,
        'ages': ages,
        'composition': composition,
      };

  @override
  String toString() {
    return '$adultsHome, $kidsHome, $babiesHome, $ages, $composition, ';
  }

  @override
  List<Object?> get props => [
        adultsHome,
        kidsHome,
        babiesHome,
        ages,
        composition,
      ];
}
