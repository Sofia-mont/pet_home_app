import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class PostRequest extends Equatable {
  const PostRequest({
    required this.department,
    required this.city,
    required this.petName,
    required this.petHistory,
    required this.petType,
    required this.petSex,
    required this.petAge,
    required this.petSize,
    required this.vaccinated,
    required this.dewormed,
    required this.neutered,
    required this.images,
  });

  final String petName;
  final String petHistory;
  final String petAge;
  final String department;
  final String city;
  final String petType;
  final String petSex;
  final String petSize;
  final bool vaccinated;
  final bool dewormed;
  final bool neutered;
  final List<MultipartFile> images;

  @override
  List<Object?> get props => [
        department,
        city,
        petName,
        petHistory,
        petType,
        petSex,
        petAge,
        petSize,
        vaccinated,
        dewormed,
        neutered,
        images,
      ];
}
