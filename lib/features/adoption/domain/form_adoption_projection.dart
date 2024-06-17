import 'package:equatable/equatable.dart';

class FormAdoptionProjection extends Equatable {
  const FormAdoptionProjection({
    required this.id,
    required this.sentAt,
    required this.candidateFullName,
    required this.postPetName,
  });

  final int? id;
  final DateTime? sentAt;
  final String? candidateFullName;
  final String? postPetName;

  FormAdoptionProjection copyWith({
    int? id,
    DateTime? sentAt,
    String? candidateFullName,
    String? postPetName,
  }) {
    return FormAdoptionProjection(
      id: id ?? this.id,
      sentAt: sentAt ?? this.sentAt,
      candidateFullName: candidateFullName ?? this.candidateFullName,
      postPetName: postPetName ?? this.postPetName,
    );
  }

  factory FormAdoptionProjection.fromJson(Map<String, dynamic> json) {
    return FormAdoptionProjection(
      id: json['id'],
      sentAt: DateTime.tryParse(json['sentAt'] ?? ''),
      candidateFullName: json['candidateFullName'],
      postPetName: json['postPetName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'sentAt': sentAt?.toIso8601String(),
        'candidateFullName': candidateFullName,
        'postPetName': postPetName,
      };

  @override
  String toString() {
    return '$id, $sentAt, $candidateFullName, $postPetName, ';
  }

  @override
  List<Object?> get props => [
        id,
        sentAt,
        candidateFullName,
        postPetName,
      ];
}
