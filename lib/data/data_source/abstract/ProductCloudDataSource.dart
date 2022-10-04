import '../../models/product_entity.dart';

abstract class ProductCloudDataSource {
  Future<List<ProductEntity>> getProducts();

  Future<ProductEntity?> findProductByName(String name);
}
