import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_repo/product_repo.dart';

part 'product_wrapper.freezed.dart';

@freezed
class ProductWrapper with _$ProductWrapper {
  const factory ProductWrapper({
    required Product product,
    required bool isInCart,
  }) = _ProductWrapper;
}
