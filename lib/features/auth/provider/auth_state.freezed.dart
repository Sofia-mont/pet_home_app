// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() successRegister,
    required TResult Function() successLogin,
    required TResult Function(dynamic message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? successRegister,
    TResult? Function()? successLogin,
    TResult? Function(dynamic message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? successRegister,
    TResult Function()? successLogin,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthSuccessRegister value) successRegister,
    required TResult Function(_AuthSuccessLogin value) successLogin,
    required TResult Function(_AuthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthSuccessRegister value)? successRegister,
    TResult? Function(_AuthSuccessLogin value)? successLogin,
    TResult? Function(_AuthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthSuccessRegister value)? successRegister,
    TResult Function(_AuthSuccessLogin value)? successLogin,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthInitialImpl implements _AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() successRegister,
    required TResult Function() successLogin,
    required TResult Function(dynamic message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? successRegister,
    TResult? Function()? successLogin,
    TResult? Function(dynamic message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? successRegister,
    TResult Function()? successLogin,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthSuccessRegister value) successRegister,
    required TResult Function(_AuthSuccessLogin value) successLogin,
    required TResult Function(_AuthError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthSuccessRegister value)? successRegister,
    TResult? Function(_AuthSuccessLogin value)? successLogin,
    TResult? Function(_AuthError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthSuccessRegister value)? successRegister,
    TResult Function(_AuthSuccessLogin value)? successLogin,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthInitial implements AuthState {
  const factory _AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingImpl implements _AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() successRegister,
    required TResult Function() successLogin,
    required TResult Function(dynamic message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? successRegister,
    TResult? Function()? successLogin,
    TResult? Function(dynamic message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? successRegister,
    TResult Function()? successLogin,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthSuccessRegister value) successRegister,
    required TResult Function(_AuthSuccessLogin value) successLogin,
    required TResult Function(_AuthError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthSuccessRegister value)? successRegister,
    TResult? Function(_AuthSuccessLogin value)? successLogin,
    TResult? Function(_AuthError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthSuccessRegister value)? successRegister,
    TResult Function(_AuthSuccessLogin value)? successLogin,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthLoading implements AuthState {
  const factory _AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$AuthSuccessRegisterImplCopyWith<$Res> {
  factory _$$AuthSuccessRegisterImplCopyWith(_$AuthSuccessRegisterImpl value,
          $Res Function(_$AuthSuccessRegisterImpl) then) =
      __$$AuthSuccessRegisterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSuccessRegisterImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessRegisterImpl>
    implements _$$AuthSuccessRegisterImplCopyWith<$Res> {
  __$$AuthSuccessRegisterImplCopyWithImpl(_$AuthSuccessRegisterImpl _value,
      $Res Function(_$AuthSuccessRegisterImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthSuccessRegisterImpl implements _AuthSuccessRegister {
  const _$AuthSuccessRegisterImpl();

  @override
  String toString() {
    return 'AuthState.successRegister()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessRegisterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() successRegister,
    required TResult Function() successLogin,
    required TResult Function(dynamic message) error,
  }) {
    return successRegister();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? successRegister,
    TResult? Function()? successLogin,
    TResult? Function(dynamic message)? error,
  }) {
    return successRegister?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? successRegister,
    TResult Function()? successLogin,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (successRegister != null) {
      return successRegister();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthSuccessRegister value) successRegister,
    required TResult Function(_AuthSuccessLogin value) successLogin,
    required TResult Function(_AuthError value) error,
  }) {
    return successRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthSuccessRegister value)? successRegister,
    TResult? Function(_AuthSuccessLogin value)? successLogin,
    TResult? Function(_AuthError value)? error,
  }) {
    return successRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthSuccessRegister value)? successRegister,
    TResult Function(_AuthSuccessLogin value)? successLogin,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (successRegister != null) {
      return successRegister(this);
    }
    return orElse();
  }
}

abstract class _AuthSuccessRegister implements AuthState {
  const factory _AuthSuccessRegister() = _$AuthSuccessRegisterImpl;
}

/// @nodoc
abstract class _$$AuthSuccessLoginImplCopyWith<$Res> {
  factory _$$AuthSuccessLoginImplCopyWith(_$AuthSuccessLoginImpl value,
          $Res Function(_$AuthSuccessLoginImpl) then) =
      __$$AuthSuccessLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSuccessLoginImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessLoginImpl>
    implements _$$AuthSuccessLoginImplCopyWith<$Res> {
  __$$AuthSuccessLoginImplCopyWithImpl(_$AuthSuccessLoginImpl _value,
      $Res Function(_$AuthSuccessLoginImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthSuccessLoginImpl implements _AuthSuccessLogin {
  const _$AuthSuccessLoginImpl();

  @override
  String toString() {
    return 'AuthState.successLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSuccessLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() successRegister,
    required TResult Function() successLogin,
    required TResult Function(dynamic message) error,
  }) {
    return successLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? successRegister,
    TResult? Function()? successLogin,
    TResult? Function(dynamic message)? error,
  }) {
    return successLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? successRegister,
    TResult Function()? successLogin,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (successLogin != null) {
      return successLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthSuccessRegister value) successRegister,
    required TResult Function(_AuthSuccessLogin value) successLogin,
    required TResult Function(_AuthError value) error,
  }) {
    return successLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthSuccessRegister value)? successRegister,
    TResult? Function(_AuthSuccessLogin value)? successLogin,
    TResult? Function(_AuthError value)? error,
  }) {
    return successLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthSuccessRegister value)? successRegister,
    TResult Function(_AuthSuccessLogin value)? successLogin,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (successLogin != null) {
      return successLogin(this);
    }
    return orElse();
  }
}

abstract class _AuthSuccessLogin implements AuthState {
  const factory _AuthSuccessLogin() = _$AuthSuccessLoginImpl;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic message});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$AuthErrorImpl(
      freezed == message ? _value.message! : message,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements _AuthError {
  const _$AuthErrorImpl([this.message = '']);

  @override
  @JsonKey()
  final dynamic message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() successRegister,
    required TResult Function() successLogin,
    required TResult Function(dynamic message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? successRegister,
    TResult? Function()? successLogin,
    TResult? Function(dynamic message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? successRegister,
    TResult Function()? successLogin,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthSuccessRegister value) successRegister,
    required TResult Function(_AuthSuccessLogin value) successLogin,
    required TResult Function(_AuthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthSuccessRegister value)? successRegister,
    TResult? Function(_AuthSuccessLogin value)? successLogin,
    TResult? Function(_AuthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthSuccessRegister value)? successRegister,
    TResult Function(_AuthSuccessLogin value)? successLogin,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthError implements AuthState {
  const factory _AuthError([final dynamic message]) = _$AuthErrorImpl;

  dynamic get message;
  @JsonKey(ignore: true)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
