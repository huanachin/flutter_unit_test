import 'package:demo_unit_test/data/models/product_entity.dart';
import 'package:demo_unit_test/data/repositories/product_repository.dart';
import 'package:demo_unit_test/domain/repositories/product_repository_impl.dart';
import 'package:demo_unit_test/ui/pages/home/get_products_state.dart';
import 'package:demo_unit_test/ui/pages/home/home_change_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ProductRepositoryImpl>()])
import 'home_page_notifier_test.mocks.dart';

void main() {
  late ProductRepository productRepository;
  late HomeChangeNotifier sut;

  setUp(() {
    productRepository = MockProductRepositoryImpl();
    sut = HomeChangeNotifier(productRepository);
  });

  test('initial values are correct', () {
    expect(sut.productsState, isA<ProductsStateIdle>());
  });

  group('fetchProducts', () {
    final productsFromRepository = [
      ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0),
      ProductEntity(name: "Chocolate", description: "Gloria Chocolate", price: 10.0),
      ProductEntity(name: "Bread", description: "Delicious bread", price: 20.0),
    ];
    void arrangeGetProductsReturn3Products() {
      when(productRepository.getProducts()).thenAnswer((_) async => productsFromRepository);
    }

    test("get products using ProductRepository", () async {
      when(productRepository.getProducts()).thenAnswer((_) async => []);
      await sut.fetchProducts();
      verify(productRepository.getProducts());
    });

    test("get products with success result", () async {
      arrangeGetProductsReturn3Products();
      final future = sut.fetchProducts();
      expect(sut.productsState, isA<ProductsStateLoading>());
      await future;
      expect(sut.productsState, isA<ProductsStateSuccess>());
      final state = sut.productsState as ProductsStateSuccess;
      expect(state.products, productsFromRepository);
    });

    test("get products with error result", () async {
      when(productRepository.getProducts()).thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 2));
        throw Exception();
      });
      final future = sut.fetchProducts();
      expect(sut.productsState, isA<ProductsStateLoading>());
      await future;
      expect(sut.productsState, isA<ProductsStateError>());
    });
  });
}
