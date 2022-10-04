import 'package:demo_unit_test/data/models/product_entity.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final ProductEntity product;

  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Text(product.description),
    );
  }
}
