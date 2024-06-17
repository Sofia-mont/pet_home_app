import 'package:equatable/equatable.dart';

class PostulationSearchQuery extends Equatable {
  const PostulationSearchQuery({
    this.status,
    this.postId,
  });

  final String? status;
  final String? postId;

  PostulationSearchQuery copyWith({
    String? status,
    String? postId,
  }) {
    return PostulationSearchQuery(
      status: status ?? this.status,
      postId: postId ?? this.postId,
    );
  }

  factory PostulationSearchQuery.fromJson(Map<String, dynamic> json) {
    return PostulationSearchQuery(
      status: json['status'],
      postId: json['postId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'postId': postId,
      };

  @override
  String toString() {
    return '$status, $postId, ';
  }

  @override
  List<Object?> get props => [
        status,
        postId,
      ];
}
