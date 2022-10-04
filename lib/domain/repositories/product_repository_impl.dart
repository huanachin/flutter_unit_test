import '../../data/data_source/abstract/ProductCloudDataSource.dart';
import '../../data/models/product_entity.dart';
import '../../data/repositories/product_repository.dart';
import '../errors/find_product_errors.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductCloudDataSource productCloudDataSource;

  ProductRepositoryImpl(this.productCloudDataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    Future.delayed(const Duration(seconds: 2));
    return productCloudDataSource.getProducts();
  }

  @override
  Future<ProductEntity> findProductByName(String name) async {
    if (name.isEmpty) throw EmptyProductNameException();
    final product = await productCloudDataSource.findProductByName(name);
    if (product == null) throw ProductNoFoundException();
    return product;
  }
}
