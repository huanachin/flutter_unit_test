import 'package:demo_unit_test/ui/pages/home/get_products_state.dart';
import 'package:demo_unit_test/ui/pages/home/home_change_notifier.dart';
import 'package:demo_unit_test/ui/pages/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/product_entity.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<HomeChangeNotifier>().fetchProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Selector<HomeChangeNotifier, ProductsState>(
        selector: (_, notifier) => notifier.productsState,
        builder: (_, state, ___) {
          if (state is ProductsStateLoading) {
            return const LoadingView(key: Key('loading-indicator'),);
          }
          if (state is ProductsStateError) {
            return ErrorView(error: state.exception.toString());
          }
          if (state is ProductsStateSuccess) {
            return ProductsView(products: state.products);
          }
          return Container();
        },
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  final ProductEntity product;

  const ProductView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductPage(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name),
            const SizedBox(height: 8),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}

class ProductsView extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductsView({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) => ProductView(product: products[index]),
    );
  }
}

class ErrorView extends StatelessWidget {
  final String error;

  const ErrorView({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
