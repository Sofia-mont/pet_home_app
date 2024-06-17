import 'package:equatable/equatable.dart';

class CandidateInfo extends Equatable {
  const CandidateInfo({
    required this.fullName,
    required this.age,
    required this.department,
    required this.city,
    required this.neighborhood,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.occupation,
  });

  final String fullName;
  final String age;
  final String department;
  final String city;
  final String neighborhood;
  final String address;
  final String phoneNumber;
  final String email;
  final String occupation;

  CandidateInfo copyWith({
    String? fullName,
    String? age,
    String? department,
    String? city,
    String? neighborhood,
    String? address,
    String? phoneNumber,
    String? email,
    String? occupation,
  }) {
    return CandidateInfo(
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      department: department ?? this.department,
      city: city ?? this.city,
      neighborhood: neighborhood ?? this.neighborhood,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      occupation: occupation ?? this.occupation,
    );
  }

  factory CandidateInfo.fromJson(Map<String, dynamic> json) {
    return CandidateInfo(
      fullName: json['fullName'] ?? '',
      age: json['age'] ?? '',
      department: json['department'] ?? '',
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      address: json['address'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      occupation: json['occupation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'age': age,
        'department': department,
        'city': city,
        'neighborhood': neighborhood,
        'address': address,
        'phoneNumber': phoneNumber,
        'email': email,
        'occupation': occupation,
      };

  @override
  String toString() {
    return '$fullName, $age, $department, $city, $neighborhood, $address, $phoneNumber, $email, $occupation, ';
  }

  @override
  List<Object?> get props => [
        fullName,
        age,
        department,
        city,
        neighborhood,
        address,
        phoneNumber,
        email,
        occupation,
      ];
}
