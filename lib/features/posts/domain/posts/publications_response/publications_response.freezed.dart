// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publications_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicationsResponse _$PublicationsResponseFromJson(Map<String, dynamic> json) {
  return _PublicationsResponse.fromJson(json);
}

/// @nodoc
mixin _$PublicationsResponse {
  @JsonKey(name: 'data')
  List<Post> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'actualPage')
  int get actualPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'last')
  bool get last => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageSize')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalResults')
  int get totalResults => throw _privateConstructorUsedError;
  List<String> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicationsResponseCopyWith<PublicationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationsResponseCopyWith<$Res> {
  factory $PublicationsResponseCopyWith(PublicationsResponse value,
          $Res Function(PublicationsResponse) then) =
      _$PublicationsResponseCopyWithImpl<$Res, PublicationsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<Post> data,
      @JsonKey(name: 'actualPage') int actualPage,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'last') bool last,
      @JsonKey(name: 'pageSize') int pageSize,
      @JsonKey(name: 'totalResults') int totalResults,
      List<String> errors});
}

/// @nodoc
class _$PublicationsResponseCopyWithImpl<$Res,
        $Val extends PublicationsResponse>
    implements $PublicationsResponseCopyWith<$Res> {
  _$PublicationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? actualPage = null,
    Object? totalPages = null,
    Object? last = null,
    Object? pageSize = null,
    Object? totalResults = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      actualPage: null == actualPage
          ? _value.actualPage
          : actualPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicationsResponseImplCopyWith<$Res>
    implements $PublicationsResponseCopyWith<$Res> {
  factory _$$PublicationsResponseImplCopyWith(_$PublicationsResponseImpl value,
          $Res Function(_$PublicationsResponseImpl) then) =
      __$$PublicationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<Post> data,
      @JsonKey(name: 'actualPage') int actualPage,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'last') bool last,
      @JsonKey(name: 'pageSize') int pageSize,
      @JsonKey(name: 'totalResults') int totalResults,
      List<String> errors});
}

/// @nodoc
class __$$PublicationsResponseImplCopyWithImpl<$Res>
    extends _$PublicationsResponseCopyWithImpl<$Res, _$PublicationsResponseImpl>
    implements _$$PublicationsResponseImplCopyWith<$Res> {
  __$$PublicationsResponseImplCopyWithImpl(_$PublicationsResponseImpl _value,
      $Res Function(_$PublicationsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? actualPage = null,
    Object? totalPages = null,
    Object? last = null,
    Object? pageSize = null,
    Object? totalResults = null,
    Object? errors = null,
  }) {
    return _then(_$PublicationsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      actualPage: null == actualPage
          ? _value.actualPage
          : actualPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicationsResponseImpl implements _PublicationsResponse {
  _$PublicationsResponseImpl(
      {@JsonKey(name: 'data') required final List<Post> data,
      @JsonKey(name: 'actualPage') required this.actualPage,
      @JsonKey(name: 'totalPages') required this.totalPages,
      @JsonKey(name: 'last') required this.last,
      @JsonKey(name: 'pageSize') required this.pageSize,
      @JsonKey(name: 'totalResults') required this.totalResults,
      final List<String> errors = const []})
      : _data = data,
        _errors = errors;

  factory _$PublicationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicationsResponseImplFromJson(json);

  final List<Post> _data;
  @override
  @JsonKey(name: 'data')
  List<Post> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'actualPage')
  final int actualPage;
  @override
  @JsonKey(name: 'totalPages')
  final int totalPages;
  @override
  @JsonKey(name: 'last')
  final bool last;
  @override
  @JsonKey(name: 'pageSize')
  final int pageSize;
  @override
  @JsonKey(name: 'totalResults')
  final int totalResults;
  final List<String> _errors;
  @override
  @JsonKey()
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'PublicationsResponse(data: $data, actualPage: $actualPage, totalPages: $totalPages, last: $last, pageSize: $pageSize, totalResults: $totalResults, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicationsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.actualPage, actualPage) ||
                other.actualPage == actualPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      actualPage,
      totalPages,
      last,
      pageSize,
      totalResults,
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicationsResponseImplCopyWith<_$PublicationsResponseImpl>
      get copyWith =>
          __$$PublicationsResponseImplCopyWithImpl<_$PublicationsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicationsResponseImplToJson(
      this,
    );
  }
}

abstract class _PublicationsResponse implements PublicationsResponse {
  factory _PublicationsResponse(
      {@JsonKey(name: 'data') required final List<Post> data,
      @JsonKey(name: 'actualPage') required final int actualPage,
      @JsonKey(name: 'totalPages') required final int totalPages,
      @JsonKey(name: 'last') required final bool last,
      @JsonKey(name: 'pageSize') required final int pageSize,
      @JsonKey(name: 'totalResults') required final int totalResults,
      final List<String> errors}) = _$PublicationsResponseImpl;

  factory _PublicationsResponse.fromJson(Map<String, dynamic> json) =
      _$PublicationsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<Post> get data;
  @override
  @JsonKey(name: 'actualPage')
  int get actualPage;
  @override
  @JsonKey(name: 'totalPages')
  int get totalPages;
  @override
  @JsonKey(name: 'last')
  bool get last;
  @override
  @JsonKey(name: 'pageSize')
  int get pageSize;
  @override
  @JsonKey(name: 'totalResults')
  int get totalResults;
  @override
  List<String> get errors;
  @override
  @JsonKey(ignore: true)
  _$$PublicationsResponseImplCopyWith<_$PublicationsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
