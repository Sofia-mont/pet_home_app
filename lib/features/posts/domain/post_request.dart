import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class PostRequest extends Equatable {
  const PostRequest({
    this.department,
    this.city,
    this.petName,
    this.petHistory,
    this.petType,
    this.petSex,
    this.petAge,
    this.petSize,
    this.vaccinated,
    this.dewormed,
    this.neutered,
    this.images,
  });

  final String? petName;
  final String? petHistory;
  final String? petAge;
  final String? department;
  final String? city;
  final String? petType;
  final String? petSex;
  final String? petSize;
  final bool? vaccinated;
  final bool? dewormed;
  final bool? neutered;
  final List<XFile>? images;

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
