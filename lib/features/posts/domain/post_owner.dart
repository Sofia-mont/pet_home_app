import 'package:equatable/equatable.dart';

class PostOwner extends Equatable {
  const PostOwner({
    required this.id,
    required this.name,
    required this.userType,
  });

  final int id;
  final String name;
  final String userType;

  PostOwner copyWith({
    int? id,
    String? name,
    String? userType,
  }) {
    return PostOwner(
      id: id ?? this.id,
      name: name ?? this.name,
      userType: userType ?? this.userType,
    );
  }

  factory PostOwner.fromJson(Map<String, dynamic> json) {
    return PostOwner(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      userType: json['userType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'userType': userType,
      };

  @override
  String toString() {
    return '$id, $name, $userType, ';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        userType,
      ];
}
