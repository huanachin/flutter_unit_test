import 'package:collection/collection.dart';
import 'package:demo_unit_test/data/data_source/abstract/ProductCloudDataSource.dart';

import '../../models/product_entity.dart';

class ProductCloudDataSourceImpl implements ProductCloudDataSource {
  final products = [
    ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0),
    ProductEntity(name: "Chocolate", description: "Gloria Chocolate", price: 10.0),
    ProductEntity(name: "Bread", description: "Delicious bread", price: 20.0),
    ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0),
    ProductEntity(name: "Chocolate", description: "Gloria Chocolate", price: 10.0),
    ProductEntity(name: "Bread", description: "Delicious bread", price: 20.0),
    ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0),
    ProductEntity(name: "Chocolate", description: "Gloria Chocolate", price: 10.0),
    ProductEntity(name: "Bread", description: "Delicious bread", price: 20.0),
    ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0),
    ProductEntity(name: "Chocolate", description: "Gloria Chocolate", price: 10.0),
    ProductEntity(name: "Bread", description: "Delicious bread", price: 20.0),
  ];

  @override
  Future<List<ProductEntity>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return products;
  }

  @override
  Future<ProductEntity?> findProductByName(String name) async {
    await Future.delayed(const Duration(seconds: 2));
    return products.firstWhereOrNull((p) => p.name == name);
  }
}
