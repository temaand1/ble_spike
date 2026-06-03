// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DeviceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(
      int? batteryLevel,
      List<BluetoothService>? services,
    )
    connected,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
    DeviceState value,
    $Res Function(DeviceState) then,
  ) = _$DeviceStateCopyWithImpl<$Res, DeviceState>;
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res, $Val extends DeviceState>
    implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
    _$ConnectingImpl value,
    $Res Function(_$ConnectingImpl) then,
  ) = __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
    _$ConnectingImpl _value,
    $Res Function(_$ConnectingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectingImpl implements _Connecting {
  const _$ConnectingImpl();

  @override
  String toString() {
    return 'DeviceState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(
      int? batteryLevel,
      List<BluetoothService>? services,
    )
    connected,
    required TResult Function(String message) error,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult? Function(String message)? error,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements DeviceState {
  const factory _Connecting() = _$ConnectingImpl;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
    _$ConnectedImpl value,
    $Res Function(_$ConnectedImpl) then,
  ) = __$$ConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? batteryLevel, List<BluetoothService>? services});
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
    _$ConnectedImpl _value,
    $Res Function(_$ConnectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? batteryLevel = freezed, Object? services = freezed}) {
    return _then(
      _$ConnectedImpl(
        batteryLevel: freezed == batteryLevel
            ? _value.batteryLevel
            : batteryLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
        services: freezed == services
            ? _value._services
            : services // ignore: cast_nullable_to_non_nullable
                  as List<BluetoothService>?,
      ),
    );
  }
}

/// @nodoc

class _$ConnectedImpl implements _Connected {
  const _$ConnectedImpl({
    this.batteryLevel,
    final List<BluetoothService>? services,
  }) : _services = services;

  @override
  final int? batteryLevel;
  final List<BluetoothService>? _services;
  @override
  List<BluetoothService>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeviceState.connected(batteryLevel: $batteryLevel, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    batteryLevel,
    const DeepCollectionEquality().hash(_services),
  );

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(
      int? batteryLevel,
      List<BluetoothService>? services,
    )
    connected,
    required TResult Function(String message) error,
  }) {
    return connected(batteryLevel, services);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult? Function(String message)? error,
  }) {
    return connected?.call(batteryLevel, services);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(batteryLevel, services);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements DeviceState {
  const factory _Connected({
    final int? batteryLevel,
    final List<BluetoothService>? services,
  }) = _$ConnectedImpl;

  int? get batteryLevel;
  List<BluetoothService>? get services;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DeviceState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function(
      int? batteryLevel,
      List<BluetoothService>? services,
    )
    connected,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function(int? batteryLevel, List<BluetoothService>? services)?
    connected,
    TResult Function(String message)? error,
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
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DeviceState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
