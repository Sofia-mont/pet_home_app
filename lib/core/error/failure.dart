import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  static Future<Failure?> fromFunction(
    Future<void> Function() future, {
    bool throwException = false,
  }) async {
    try {
      await future();
      return null;
    } on Failure catch (e) {
      return e;
    } catch (e) {
      if (throwException) rethrow;
      return Failure(message: e.toString());
    }
  }

  static Future<Failure?> fromFuture(
    Future<void> future, {
    bool throwException = false,
  }) async {
    try {
      await future;
      return null;
    } on Failure catch (e) {
      return Failure(message: e.message);
    } catch (e) {
      if (throwException) rethrow;
      if (e is DioException) {
        return Failure(message: e.response!.data['error'].toString());
      }
      return Failure(message: e.toString());
    }
  }

  @override
  List<Object?> get props => [message];

  @override
  String toString() => message;
}
