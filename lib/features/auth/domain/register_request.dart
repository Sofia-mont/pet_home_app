import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
    required this.department,
    required this.city,
  });

  final String name;
  final String email;
  final String password;
  final String userType;
  final String department;
  final String city;

  RegisterRequest copyWith({
    String? name,
    String? email,
    String? password,
    String? userType,
    String? department,
    String? city,
  }) {
    return RegisterRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userType: userType ?? this.userType,
      department: department ?? this.department,
      city: city ?? this.city,
    );
  }

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      userType: json['userType'] ?? '',
      department: json['department'] ?? '',
      city: json['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'userType': userType,
        'department': department,
        'city': city,
      };

  @override
  String toString() {
    return '$name, $email, $password, $userType, $department, $city, ';
  }

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        userType,
        department,
        city,
      ];
}
