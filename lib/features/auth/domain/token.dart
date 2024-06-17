import 'package:equatable/equatable.dart';

class Token extends Equatable {
  const Token({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;

  Token copyWith({
    String? token,
    String? refreshToken,
  }) {
    return Token(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'refreshToken': refreshToken,
      };

  @override
  String toString() {
    return '$token, $refreshToken, ';
  }

  @override
  List<Object?> get props => [
        token,
        refreshToken,
      ];
}
