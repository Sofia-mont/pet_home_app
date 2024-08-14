import 'package:equatable/equatable.dart';
import 'package:pet_home/features/posts/domain/post.dart';

class EventRequest extends Equatable {
  const EventRequest({
    this.eventDate,
    this.eventTitle,
    this.eventNote,
    this.post,
  });
  final DateTime? eventDate;
  final String? eventTitle;
  final String? eventNote;
  final Post? post;

  @override
  List<Object?> get props => [eventDate, eventTitle, eventNote, post];

  factory EventRequest.fromJson(Map<String, dynamic> json) {
    return EventRequest(
      eventDate: DateTime.tryParse(json['eventDate']),
      eventTitle: json['eventTitle'],
      eventNote: json['eventNote'],
      post: json['post'] == null ? null : Post.fromJson(json['post']),
    );
  }

  Map<String, dynamic> toJson() => {
        'eventDate': eventDate!.toIso8601String(),
        'eventTitle': eventTitle,
        'eventNote': eventNote,
        'post': post?.toJson(),
      };
}
