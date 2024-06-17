import 'package:equatable/equatable.dart';

class PostsResponseQuery extends Equatable {
  const PostsResponseQuery({
    this.petType,
    this.petSex,
    this.petSize,
    this.department,
    this.city,
  });

  final String? petType;
  final String? petSex;
  final String? petSize;
  final String? department;
  final String? city;

  PostsResponseQuery copyWith({
    String? petType,
    String? petSex,
    String? petSize,
    String? department,
    String? city,
  }) {
    return PostsResponseQuery(
      petType: petType ?? this.petType,
      petSex: petSex ?? this.petSex,
      petSize: petSize ?? this.petSize,
      department: department ?? this.department,
      city: city ?? this.city,
    );
  }

  factory PostsResponseQuery.fromJson(Map<String, dynamic> json) {
    return PostsResponseQuery(
      petType: json['petType'],
      petSex: json['petSex'],
      petSize: json['petSize'],
      department: json['department'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() => {
        'petType': petType,
        'petSex': petSex,
        'petSize': petSize,
        'department': department,
        'city': city,
      };

  @override
  String toString() {
    return '$petType, $petSex, $petSize, $department, $city, ';
  }

  @override
  List<Object?> get props => [
        petType,
        petSex,
        petSize,
        department,
        city,
      ];
}
