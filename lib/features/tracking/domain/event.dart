import 'package:equatable/equatable.dart';
import 'package:pet_home/features/posts/domain/post.dart';

class Event extends Equatable {
  const Event({
    required this.id,
    required this.eventDate,
    required this.eventTitle,
    required this.eventNote,
    this.post,
  });
  final int id;
  final DateTime eventDate;
  final String eventTitle;
  final String eventNote;
  final Post? post;

  @override
  List<Object?> get props => [id, eventDate, eventTitle, eventNote, post];

  Event copyWith({
    int? id,
    DateTime? eventDate,
    String? eventTitle,
    String? eventNote,
    Post? post,
  }) {
    return Event(
      id: id ?? this.id,
      eventDate: eventDate ?? this.eventDate,
      eventTitle: eventTitle ?? this.eventTitle,
      eventNote: eventNote ?? this.eventNote,
      post: post ?? this.post,
    );
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] ?? 0,
      eventDate: DateTime.tryParse(json['eventDate']) ?? DateTime.now(),
      eventTitle: json['eventTitle'] ?? '',
      eventNote: json['eventNote'] ?? '',
      post: json['post'] == null ? null : Post.fromJson(json['post']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'eventDate': eventDate.toIso8601String(),
        'eventTitle': eventTitle,
        'eventNote': eventNote,
        'post': post?.toJson(),
      };
}
