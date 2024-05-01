import 'package:equatable/equatable.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/publications/domain/posts/publications_response.dart';

class PublicationsState extends Equatable {
  const PublicationsState({required this.publications});

  factory PublicationsState.initial() => const PublicationsState(
        publications: AppAsync.loading(),
      );

  final AppAsync<PublicationsResponse> publications;

  @override
  List<Object?> get props => [publications];

  PublicationsState copyWith({
    AppAsync<PublicationsResponse>? publications,
  }) =>
      PublicationsState(
        publications: publications ?? this.publications,
      );
}
