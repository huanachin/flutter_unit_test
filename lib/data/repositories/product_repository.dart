import 'package:demo_unit_test/data/models/product_entity.dart';

abstract class ProductRepository{

  Future<List<ProductEntity>> getProducts();

  Future<ProductEntity> findProductByName(String name);

}