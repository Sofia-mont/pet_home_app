import 'package:equatable/equatable.dart';
import 'package:pet_home/features/posts/domain/post.dart';

class PostsResponse extends Equatable {
  const PostsResponse({
    required this.actualPage,
    required this.totalPages,
    required this.totalResults,
    required this.data,
  });

  final int actualPage;
  final int totalPages;
  final int totalResults;
  final List<Post> data;

  PostsResponse copyWith({
    int? actualPage,
    int? totalPages,
    int? totalResults,
    List<Post>? data,
  }) {
    return PostsResponse(
      actualPage: actualPage ?? this.actualPage,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      data: data ?? this.data,
    );
  }

  factory PostsResponse.fromJson(Map<String, dynamic> json) {
    return PostsResponse(
      actualPage: json['actualPage'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      totalResults: json['totalResults'] ?? 0,
      data: json['data'] == null
          ? []
          : List<Post>.from(json['data']!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        'actualPage': actualPage,
        'totalPages': totalPages,
        'totalResults': totalResults,
        'data': data.map((x) => x).toList(),
      };

  @override
  String toString() {
    return '$actualPage, $totalPages, $totalResults, $data, ';
  }

  @override
  List<Object?> get props => [
        actualPage,
        totalPages,
        totalResults,
        data,
      ];
}
