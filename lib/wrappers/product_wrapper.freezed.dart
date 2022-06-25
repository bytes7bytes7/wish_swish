// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductWrapper {
  Product get product => throw _privateConstructorUsedError;
  bool get isInCart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductWrapperCopyWith<ProductWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductWrapperCopyWith<$Res> {
  factory $ProductWrapperCopyWith(
          ProductWrapper value, $Res Function(ProductWrapper) then) =
      _$ProductWrapperCopyWithImpl<$Res>;
  $Res call({Product product, bool isInCart});
}

/// @nodoc
class _$ProductWrapperCopyWithImpl<$Res>
    implements $ProductWrapperCopyWith<$Res> {
  _$ProductWrapperCopyWithImpl(this._value, this._then);

  final ProductWrapper _value;
  // ignore: unused_field
  final $Res Function(ProductWrapper) _then;

  @override
  $Res call({
    Object? product = freezed,
    Object? isInCart = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      isInCart: isInCart == freezed
          ? _value.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductWrapperCopyWith<$Res>
    implements $ProductWrapperCopyWith<$Res> {
  factory _$$_ProductWrapperCopyWith(
          _$_ProductWrapper value, $Res Function(_$_ProductWrapper) then) =
      __$$_ProductWrapperCopyWithImpl<$Res>;
  @override
  $Res call({Product product, bool isInCart});
}

/// @nodoc
class __$$_ProductWrapperCopyWithImpl<$Res>
    extends _$ProductWrapperCopyWithImpl<$Res>
    implements _$$_ProductWrapperCopyWith<$Res> {
  __$$_ProductWrapperCopyWithImpl(
      _$_ProductWrapper _value, $Res Function(_$_ProductWrapper) _then)
      : super(_value, (v) => _then(v as _$_ProductWrapper));

  @override
  _$_ProductWrapper get _value => super._value as _$_ProductWrapper;

  @override
  $Res call({
    Object? product = freezed,
    Object? isInCart = freezed,
  }) {
    return _then(_$_ProductWrapper(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      isInCart: isInCart == freezed
          ? _value.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProductWrapper implements _ProductWrapper {
  const _$_ProductWrapper({required this.product, required this.isInCart});

  @override
  final Product product;
  @override
  final bool isInCart;

  @override
  String toString() {
    return 'ProductWrapper(product: $product, isInCart: $isInCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductWrapper &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.isInCart, isInCart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(isInCart));

  @JsonKey(ignore: true)
  @override
  _$$_ProductWrapperCopyWith<_$_ProductWrapper> get copyWith =>
      __$$_ProductWrapperCopyWithImpl<_$_ProductWrapper>(this, _$identity);
}

abstract class _ProductWrapper implements ProductWrapper {
  const factory _ProductWrapper(
      {required final Product product,
      required final bool isInCart}) = _$_ProductWrapper;

  @override
  Product get product => throw _privateConstructorUsedError;
  @override
  bool get isInCart => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductWrapperCopyWith<_$_ProductWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}
