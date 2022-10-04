import 'package:demo_unit_test/data/repositories/product_repository.dart';
import 'package:demo_unit_test/ui/pages/home/get_products_state.dart';
import 'package:flutter/foundation.dart';

class HomeChangeNotifier extends ChangeNotifier {
  final ProductRepository productRepository;

  HomeChangeNotifier(this.productRepository);

  ProductsState productsState = ProductsStateIdle();

  Future<void> fetchProducts() async {
    setProductsState(ProductsStateLoading());
    try {
      final products = await productRepository.getProducts();
      setProductsState(ProductsStateSuccess(products));
    } catch (e) {
      setProductsState(ProductsStateError(e as Exception));
    }
  }

  void setProductsState(ProductsState state) {
    productsState = state;
    notifyListeners();
  }
}
