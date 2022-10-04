import 'package:demo_unit_test/data/data_source/concrete/product_cloud_datasource_impl.dart';
import 'package:demo_unit_test/data/models/product_entity.dart';
import 'package:demo_unit_test/data/repositories/product_repository.dart';
import 'package:demo_unit_test/domain/errors/find_product_errors.dart';
import 'package:demo_unit_test/domain/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ProductCloudDataSourceImpl>()])
import 'product_repository_impl_test.mocks.dart';

void main() {
  late MockProductCloudDataSourceImpl mockProductCloudDataSourceImpl;
  late ProductRepository sut;

  setUp(() {
    mockProductCloudDataSourceImpl = MockProductCloudDataSourceImpl();
    sut = ProductRepositoryImpl(mockProductCloudDataSourceImpl);
  });

  group('getProducts', () {
    test("get products using the ProductCloudDataSource", () async {
      when(mockProductCloudDataSourceImpl.getProducts()).thenAnswer((_) async => []);
      await sut.getProducts();
      verify(mockProductCloudDataSourceImpl.getProducts());
    });
  });

  group('findProductByName', () {
    test('error when empty name is passed', () async {
      expect(() => sut.findProductByName(""), throwsA(isA<EmptyProductNameException>()));
    });
    test('error when product is not found', () async {
      when(mockProductCloudDataSourceImpl.getProducts()).thenAnswer((_) async => []);
      expect(() => sut.findProductByName("Pencil"), throwsA(isA<ProductNoFoundException>()));
    });
    test("find products using the ProductCloudDataSource", () async {
      const name = "Milk";
      final product = ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0);
      when(mockProductCloudDataSourceImpl.findProductByName(name)).thenAnswer((_) async => product);
      await sut.findProductByName(name);
      verify(mockProductCloudDataSourceImpl.findProductByName(name));
    });
  });
}
