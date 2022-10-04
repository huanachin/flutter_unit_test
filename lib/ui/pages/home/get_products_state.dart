import 'package:demo_unit_test/data/models/product_entity.dart';

abstract class ProductsState {}

class ProductsStateIdle extends ProductsState {}

class ProductsStateLoading extends ProductsState {}

class ProductsStateSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsStateSuccess(this.products);
}

class ProductsStateError extends ProductsState {
  final Exception exception;

  ProductsStateError(this.exception);
}
