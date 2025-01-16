// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketNumber _$TicketNumberFromJson(Map<String, dynamic> json) {
  return _TicketNumber.fromJson(json);
}

/// @nodoc
mixin _$TicketNumber {
  int get value => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this TicketNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketNumberCopyWith<TicketNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketNumberCopyWith<$Res> {
  factory $TicketNumberCopyWith(
          TicketNumber value, $Res Function(TicketNumber) then) =
      _$TicketNumberCopyWithImpl<$Res, TicketNumber>;
  @useResult
  $Res call({int value, bool isSelected});
}

/// @nodoc
class _$TicketNumberCopyWithImpl<$Res, $Val extends TicketNumber>
    implements $TicketNumberCopyWith<$Res> {
  _$TicketNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketNumberImplCopyWith<$Res>
    implements $TicketNumberCopyWith<$Res> {
  factory _$$TicketNumberImplCopyWith(
          _$TicketNumberImpl value, $Res Function(_$TicketNumberImpl) then) =
      __$$TicketNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, bool isSelected});
}

/// @nodoc
class __$$TicketNumberImplCopyWithImpl<$Res>
    extends _$TicketNumberCopyWithImpl<$Res, _$TicketNumberImpl>
    implements _$$TicketNumberImplCopyWith<$Res> {
  __$$TicketNumberImplCopyWithImpl(
      _$TicketNumberImpl _value, $Res Function(_$TicketNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_$TicketNumberImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketNumberImpl implements _TicketNumber {
  const _$TicketNumberImpl({required this.value, this.isSelected = false});

  factory _$TicketNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketNumberImplFromJson(json);

  @override
  final int value;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'TicketNumber(value: $value, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketNumberImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, isSelected);

  /// Create a copy of TicketNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketNumberImplCopyWith<_$TicketNumberImpl> get copyWith =>
      __$$TicketNumberImplCopyWithImpl<_$TicketNumberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketNumberImplToJson(
      this,
    );
  }
}

abstract class _TicketNumber implements TicketNumber {
  const factory _TicketNumber(
      {required final int value, final bool isSelected}) = _$TicketNumberImpl;

  factory _TicketNumber.fromJson(Map<String, dynamic> json) =
      _$TicketNumberImpl.fromJson;

  @override
  int get value;
  @override
  bool get isSelected;

  /// Create a copy of TicketNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketNumberImplCopyWith<_$TicketNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
