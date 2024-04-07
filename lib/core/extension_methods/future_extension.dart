import 'package:pet_home/core/error/failure.dart';
import 'package:pet_home/core/sealed/either.dart';

extension FutureExt<T> on Future<T> {
  Future<Either<Failure, T>> toEither({bool throwException = false}) {
    return Either.fromFuture<T>(this, throwException: throwException);
  }

  Future<Failure?> toFailure({bool throwException = false}) {
    return Failure.fromFuture(this, throwException: throwException);
  }
}

extension FutureFnExt<T> on Future<T> Function() {
  Future<Either<Failure, T>> toEither({bool throwException = false}) {
    return Either.fromFuture<T>(this(), throwException: throwException);
  }

  Future<Failure?> toFailure({bool throwException = false}) {
    return Failure.fromFuture(this(), throwException: throwException);
  }
}
