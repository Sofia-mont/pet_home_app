// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Publication _$PublicationFromJson(Map<String, dynamic> json) {
  return _Publication.fromJson(json);
}

/// @nodoc
mixin _$Publication {
  int get id => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get petName => throw _privateConstructorUsedError;
  String get petHistory => throw _privateConstructorUsedError;
  String get petPersonality => throw _privateConstructorUsedError;
  String get petType => throw _privateConstructorUsedError;
  String get petSex => throw _privateConstructorUsedError;
  String get petAge => throw _privateConstructorUsedError;
  String get petSize => throw _privateConstructorUsedError;
  String get postState => throw _privateConstructorUsedError;
  bool get vaccinated => throw _privateConstructorUsedError;
  bool get dewormed => throw _privateConstructorUsedError;
  bool get neutered => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  PostOwner? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicationCopyWith<Publication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationCopyWith<$Res> {
  factory $PublicationCopyWith(
          Publication value, $Res Function(Publication) then) =
      _$PublicationCopyWithImpl<$Res, Publication>;
  @useResult
  $Res call(
      {int id,
      String department,
      String city,
      String petName,
      String petHistory,
      String petPersonality,
      String petType,
      String petSex,
      String petAge,
      String petSize,
      String postState,
      bool vaccinated,
      bool dewormed,
      bool neutered,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      PostOwner? user});

  $PostOwnerCopyWith<$Res>? get user;
}

/// @nodoc
class _$PublicationCopyWithImpl<$Res, $Val extends Publication>
    implements $PublicationCopyWith<$Res> {
  _$PublicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? department = null,
    Object? city = null,
    Object? petName = null,
    Object? petHistory = null,
    Object? petPersonality = null,
    Object? petType = null,
    Object? petSex = null,
    Object? petAge = null,
    Object? petSize = null,
    Object? postState = null,
    Object? vaccinated = null,
    Object? dewormed = null,
    Object? neutered = null,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      petHistory: null == petHistory
          ? _value.petHistory
          : petHistory // ignore: cast_nullable_to_non_nullable
              as String,
      petPersonality: null == petPersonality
          ? _value.petPersonality
          : petPersonality // ignore: cast_nullable_to_non_nullable
              as String,
      petType: null == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as String,
      petSex: null == petSex
          ? _value.petSex
          : petSex // ignore: cast_nullable_to_non_nullable
              as String,
      petAge: null == petAge
          ? _value.petAge
          : petAge // ignore: cast_nullable_to_non_nullable
              as String,
      petSize: null == petSize
          ? _value.petSize
          : petSize // ignore: cast_nullable_to_non_nullable
              as String,
      postState: null == postState
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as String,
      vaccinated: null == vaccinated
          ? _value.vaccinated
          : vaccinated // ignore: cast_nullable_to_non_nullable
              as bool,
      dewormed: null == dewormed
          ? _value.dewormed
          : dewormed // ignore: cast_nullable_to_non_nullable
              as bool,
      neutered: null == neutered
          ? _value.neutered
          : neutered // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostOwner?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostOwnerCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $PostOwnerCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PublicationImplCopyWith<$Res>
    implements $PublicationCopyWith<$Res> {
  factory _$$PublicationImplCopyWith(
          _$PublicationImpl value, $Res Function(_$PublicationImpl) then) =
      __$$PublicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String department,
      String city,
      String petName,
      String petHistory,
      String petPersonality,
      String petType,
      String petSex,
      String petAge,
      String petSize,
      String postState,
      bool vaccinated,
      bool dewormed,
      bool neutered,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      PostOwner? user});

  @override
  $PostOwnerCopyWith<$Res>? get user;
}

/// @nodoc
class __$$PublicationImplCopyWithImpl<$Res>
    extends _$PublicationCopyWithImpl<$Res, _$PublicationImpl>
    implements _$$PublicationImplCopyWith<$Res> {
  __$$PublicationImplCopyWithImpl(
      _$PublicationImpl _value, $Res Function(_$PublicationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? department = null,
    Object? city = null,
    Object? petName = null,
    Object? petHistory = null,
    Object? petPersonality = null,
    Object? petType = null,
    Object? petSex = null,
    Object? petAge = null,
    Object? petSize = null,
    Object? postState = null,
    Object? vaccinated = null,
    Object? dewormed = null,
    Object? neutered = null,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$PublicationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      petHistory: null == petHistory
          ? _value.petHistory
          : petHistory // ignore: cast_nullable_to_non_nullable
              as String,
      petPersonality: null == petPersonality
          ? _value.petPersonality
          : petPersonality // ignore: cast_nullable_to_non_nullable
              as String,
      petType: null == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as String,
      petSex: null == petSex
          ? _value.petSex
          : petSex // ignore: cast_nullable_to_non_nullable
              as String,
      petAge: null == petAge
          ? _value.petAge
          : petAge // ignore: cast_nullable_to_non_nullable
              as String,
      petSize: null == petSize
          ? _value.petSize
          : petSize // ignore: cast_nullable_to_non_nullable
              as String,
      postState: null == postState
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as String,
      vaccinated: null == vaccinated
          ? _value.vaccinated
          : vaccinated // ignore: cast_nullable_to_non_nullable
              as bool,
      dewormed: null == dewormed
          ? _value.dewormed
          : dewormed // ignore: cast_nullable_to_non_nullable
              as bool,
      neutered: null == neutered
          ? _value.neutered
          : neutered // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostOwner?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicationImpl implements _Publication {
  _$PublicationImpl(
      {required this.id,
      required this.department,
      required this.city,
      required this.petName,
      required this.petHistory,
      required this.petPersonality,
      required this.petType,
      required this.petSex,
      required this.petAge,
      required this.petSize,
      required this.postState,
      required this.vaccinated,
      required this.dewormed,
      required this.neutered,
      @JsonKey(name: 'created_at') this.createdAt,
      this.user});

  factory _$PublicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicationImplFromJson(json);

  @override
  final int id;
  @override
  final String department;
  @override
  final String city;
  @override
  final String petName;
  @override
  final String petHistory;
  @override
  final String petPersonality;
  @override
  final String petType;
  @override
  final String petSex;
  @override
  final String petAge;
  @override
  final String petSize;
  @override
  final String postState;
  @override
  final bool vaccinated;
  @override
  final bool dewormed;
  @override
  final bool neutered;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  final PostOwner? user;

  @override
  String toString() {
    return 'Publication(id: $id, department: $department, city: $city, petName: $petName, petHistory: $petHistory, petPersonality: $petPersonality, petType: $petType, petSex: $petSex, petAge: $petAge, petSize: $petSize, postState: $postState, vaccinated: $vaccinated, dewormed: $dewormed, neutered: $neutered, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.petName, petName) || other.petName == petName) &&
            (identical(other.petHistory, petHistory) ||
                other.petHistory == petHistory) &&
            (identical(other.petPersonality, petPersonality) ||
                other.petPersonality == petPersonality) &&
            (identical(other.petType, petType) || other.petType == petType) &&
            (identical(other.petSex, petSex) || other.petSex == petSex) &&
            (identical(other.petAge, petAge) || other.petAge == petAge) &&
            (identical(other.petSize, petSize) || other.petSize == petSize) &&
            (identical(other.postState, postState) ||
                other.postState == postState) &&
            (identical(other.vaccinated, vaccinated) ||
                other.vaccinated == vaccinated) &&
            (identical(other.dewormed, dewormed) ||
                other.dewormed == dewormed) &&
            (identical(other.neutered, neutered) ||
                other.neutered == neutered) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      department,
      city,
      petName,
      petHistory,
      petPersonality,
      petType,
      petSex,
      petAge,
      petSize,
      postState,
      vaccinated,
      dewormed,
      neutered,
      createdAt,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicationImplCopyWith<_$PublicationImpl> get copyWith =>
      __$$PublicationImplCopyWithImpl<_$PublicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicationImplToJson(
      this,
    );
  }
}

abstract class _Publication implements Publication {
  factory _Publication(
      {required final int id,
      required final String department,
      required final String city,
      required final String petName,
      required final String petHistory,
      required final String petPersonality,
      required final String petType,
      required final String petSex,
      required final String petAge,
      required final String petSize,
      required final String postState,
      required final bool vaccinated,
      required final bool dewormed,
      required final bool neutered,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      final PostOwner? user}) = _$PublicationImpl;

  factory _Publication.fromJson(Map<String, dynamic> json) =
      _$PublicationImpl.fromJson;

  @override
  int get id;
  @override
  String get department;
  @override
  String get city;
  @override
  String get petName;
  @override
  String get petHistory;
  @override
  String get petPersonality;
  @override
  String get petType;
  @override
  String get petSex;
  @override
  String get petAge;
  @override
  String get petSize;
  @override
  String get postState;
  @override
  bool get vaccinated;
  @override
  bool get dewormed;
  @override
  bool get neutered;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  PostOwner? get user;
  @override
  @JsonKey(ignore: true)
  _$$PublicationImplCopyWith<_$PublicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
