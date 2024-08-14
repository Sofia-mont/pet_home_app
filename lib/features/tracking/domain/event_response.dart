import 'package:equatable/equatable.dart';
import 'package:pet_home/features/tracking/domain/event.dart';

class EventResponse extends Equatable {
  const EventResponse({
    required this.actualPage,
    required this.totalPages,
    required this.totalResults,
    required this.data,
  });

  final int actualPage;
  final int totalPages;
  final int totalResults;
  final List<Event> data;

  EventResponse copyWith({
    int? actualPage,
    int? totalPages,
    int? totalResults,
    List<Event>? data,
  }) {
    return EventResponse(
      actualPage: actualPage ?? this.actualPage,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      data: data ?? this.data,
    );
  }

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      actualPage: json['actualPage'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      totalResults: json['totalResults'] ?? 0,
      data: json['data'] == null
          ? []
          : List<Event>.from(json['data']!.map((x) => x)),
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
