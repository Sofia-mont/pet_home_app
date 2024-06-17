import 'package:equatable/equatable.dart';
import 'package:pet_home/features/posts/domain/post_owner.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    required this.department,
    required this.city,
    required this.petName,
    required this.petHistory,
    required this.petPersonality,
    required this.petType,
    required this.petSex,
    required this.petAge,
    required this.petSize,
    required this.vaccinated,
    required this.dewormed,
    required this.neutered,
    required this.postState,
    required this.createdAt,
    required this.postOwner,
    required this.petImages,
  });

  final int id;
  final String department;
  final String city;
  final String petName;
  final String petHistory;
  final String petPersonality;
  final String petType;
  final String petSex;
  final String petAge;
  final String petSize;
  final bool vaccinated;
  final bool dewormed;
  final bool neutered;
  final String postState;
  final DateTime? createdAt;
  final PostOwner? postOwner;
  final List<String> petImages;

  Post copyWith({
    int? id,
    String? department,
    String? city,
    String? petName,
    String? petHistory,
    String? petPersonality,
    String? petType,
    String? petSex,
    String? petAge,
    String? petSize,
    bool? vaccinated,
    bool? dewormed,
    bool? neutered,
    String? postState,
    DateTime? createdAt,
    PostOwner? postOwner,
    List<String>? petImages,
  }) {
    return Post(
      id: id ?? this.id,
      department: department ?? this.department,
      city: city ?? this.city,
      petName: petName ?? this.petName,
      petHistory: petHistory ?? this.petHistory,
      petPersonality: petPersonality ?? this.petPersonality,
      petType: petType ?? this.petType,
      petSex: petSex ?? this.petSex,
      petAge: petAge ?? this.petAge,
      petSize: petSize ?? this.petSize,
      vaccinated: vaccinated ?? this.vaccinated,
      dewormed: dewormed ?? this.dewormed,
      neutered: neutered ?? this.neutered,
      postState: postState ?? this.postState,
      createdAt: createdAt ?? this.createdAt,
      postOwner: postOwner ?? this.postOwner,
      petImages: petImages ?? this.petImages,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      department: json['department'] ?? '',
      city: json['city'] ?? '',
      petName: json['petName'] ?? '',
      petHistory: json['petHistory'] ?? '',
      petPersonality: json['petPersonality'] ?? '',
      petType: json['petType'] ?? '',
      petSex: json['petSex'] ?? '',
      petAge: json['petAge'] ?? '',
      petSize: json['petSize'] ?? '',
      vaccinated: json['vaccinated'] ?? false,
      dewormed: json['dewormed'] ?? false,
      neutered: json['neutered'] ?? false,
      postState: json['postState'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      postOwner: json['postOwner'] == null
          ? null
          : PostOwner.fromJson(json['postOwner']),
      petImages: json['petImages'] == null
          ? []
          : List<String>.from(json['petImages']!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
        'city': city,
        'petName': petName,
        'petHistory': petHistory,
        'petPersonality': petPersonality,
        'petType': petType,
        'petSex': petSex,
        'petAge': petAge,
        'petSize': petSize,
        'vaccinated': vaccinated,
        'dewormed': dewormed,
        'neutered': neutered,
        'postState': postState,
        'createdAt': createdAt?.toIso8601String(),
        'postOwner': postOwner?.toJson(),
        'petImages': petImages.map((x) => x).toList(),
      };

  @override
  String toString() {
    return '$id, $department, $city, $petName, $petHistory, $petPersonality, $petType, $petSex, $petAge, $petSize, $vaccinated, $dewormed, $neutered, $postState, $createdAt, $postOwner, $petImages, ';
  }

  @override
  List<Object?> get props => [
        id,
        department,
        city,
        petName,
        petHistory,
        petPersonality,
        petType,
        petSex,
        petAge,
        petSize,
        vaccinated,
        dewormed,
        neutered,
        postState,
        createdAt,
        postOwner,
        petImages,
      ];
}
