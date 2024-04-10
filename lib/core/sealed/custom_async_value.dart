import 'package:flutter/material.dart';
import 'package:pet_home/core/error/failure.dart';
import 'package:pet_home/ui/constants/palette.dart';

sealed class AppAsync<T> {
  const factory AppAsync.loading() = AsyncLoading<T>;
  const factory AppAsync.initial() = AsyncInitial<T>;
  const factory AppAsync.data(T value) = AsyncData<T>;
  const factory AppAsync.failure(Failure error) = AsyncError<T>;
}

class AsyncInitial<T> implements AppAsync<T> {
  const AsyncInitial();
  @override
  String toString() => 'AsyncInitial<${T.runtimeType}>';
}

class AsyncLoading<T> implements AppAsync<T> {
  const AsyncLoading();
  @override
  String toString() => 'AsyncLoading<${T.runtimeType}>';
}

class AsyncData<T> implements AppAsync<T> {
  const AsyncData(this.value);
  final T value;

  @override
  String toString() => 'AsyncData<$T>($value)';
}

class AsyncError<T> implements AppAsync<T> {
  const AsyncError(this.error);
  final Failure error;

  @override
  String toString() => 'AsyncError<$T>($error)';
}

extension AsyncExtension<T> on AppAsync<T> {
  Failure? get error =>
      (this is AsyncError) ? (this as AsyncError).error : null;
  T? get value => (this is AsyncData<T>) ? (this as AsyncData<T>).value : null;

  bool get isLoading => this is AsyncLoading;
  bool get isInitial => this is AsyncInitial;
  bool get isSuccess => this is AsyncData<T>;
  bool get isError => this is AsyncError;

  W on<W>({
    required W Function(T) onData,
    required W Function(Failure) onError,
    required W Function() onLoading,
    required W Function() onInitial,
  }) {
    if (this is AsyncLoading) {
      return onLoading();
    } else if (this is AsyncInitial) {
      return onInitial();
    } else if (this is AsyncData<T>) {
      return onData((this as AsyncData<T>).value);
    } else if (this is AsyncError) {
      return onError((this as AsyncError).error);
    } else {
      throw Exception('Invalid state');
    }
  }

  W onMayNull<W>({
    required W Function(T?) onData,
    required W Function(Failure) onError,
    required W Function() onLoading,
    required W Function() onInitial,
  }) {
    if (this is AsyncLoading) {
      return onLoading();
    } else if (this is AsyncInitial) {
      return onInitial();
    } else if (this is AsyncData<T>) {
      return onData((this as AsyncData<T>).value);
    } else if (this is AsyncError) {
      return onError((this as AsyncError).error);
    } else {
      throw Exception('Invalid state');
    }
  }

  Widget when({
    required Widget Function(T) data,
    required Widget Function(Failure) failure,
    Widget Function()? loading,
    Widget Function()? initial,
  }) {
    if (this is AsyncLoading) {
      return loading?.call() ??
          Center(
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Palette.primary),
            ),
          );
    } else if (this is AsyncInitial) {
      return initial?.call() ??
          loading?.call() ??
          Center(
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Palette.primary),
            ),
          );
    } else if (this is AsyncData<T>) {
      return data((this as AsyncData<T>).value);
    } else if (this is AsyncError) {
      return failure((this as AsyncError).error);
    } else {
      throw Exception('Invalid state');
    }
  }

  Widget whenDataOrFailure({
    required Widget Function(Failure failure) failure,
    required Widget Function(T data) data,
  }) {
    if (this is AsyncLoading) {
      return Center(
        child: Container(
          width: 80,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(color: Palette.primary),
        ),
      );
    } else if (this is AsyncInitial) {
      return Center(
        child: Container(
          width: 80,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(color: Palette.primary),
        ),
      );
    } else if (this is AsyncData<T>) {
      return data((this as AsyncData<T>).value);
    } else if (this is AsyncError) {
      return failure((this as AsyncError).error);
    } else {
      throw Exception('Invalid state');
    }
  }

  Widget whenOrNull({
    required Widget Function(T?) data,
    required Widget Function(Failure) failure,
    Widget Function()? loading,
    Widget Function()? initial,
  }) {
    if (this is AsyncLoading) {
      return loading?.call() ??
          Center(
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Palette.primary),
            ),
          );
    } else if (this is AsyncInitial) {
      return initial?.call() ??
          loading?.call() ??
          Center(
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Palette.primary),
            ),
          );
    } else if (this is AsyncData<T>) {
      return data((this as AsyncData<T>).value);
    } else if (this is AsyncError) {
      return failure((this as AsyncError).error);
    } else {
      throw Exception('Invalid state');
    }
  }
}
