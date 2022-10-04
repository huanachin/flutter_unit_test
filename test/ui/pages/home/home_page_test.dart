import 'package:demo_unit_test/data/models/product_entity.dart';
import 'package:demo_unit_test/data/repositories/product_repository.dart';
import 'package:demo_unit_test/ui/pages/home/home_change_notifier.dart';
import 'package:demo_unit_test/ui/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'home_page_notifier_test.mocks.dart';

void main() {
  late ProductRepository productRepository;

  final productsFromRepository = [
    ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0),
    ProductEntity(name: "Chocolate", description: "Gloria Chocolate", price: 10.0),
    ProductEntity(name: "Bread", description: "Delicious bread", price: 20.0),
  ];

  void arrangeGetProductsThrowError() {
    when(productRepository.getProducts()).thenThrow(Exception());
  }

  void arrangeGetProductsReturn3Products() {
    when(productRepository.getProducts()).thenAnswer((_) async => productsFromRepository);
  }

  void arrangeGetProductsReturn3ProductsAfter2Seconds() {
    when(productRepository.getProducts()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 2));
      return productsFromRepository;
    });
  }

  setUp(() {
    productRepository = MockProductRepositoryImpl();
  });

  Widget createHomePageTest() {
    return MaterialApp(
      title: 'Unit test demo',
      home: ChangeNotifierProvider(
        create: (_) => HomeChangeNotifier(productRepository),
        child: const HomeView(),
      ),
    );
  }

  group('HomePage', () {
    testWidgets("title is displayed", (WidgetTester widgetTester) async {
      arrangeGetProductsReturn3Products();
      await widgetTester.pumpWidget(createHomePageTest());
      expect(find.text("Products"), findsOneWidget);
    });

    testWidgets("loading view is displayed while waiting for products", (widgetTester) async {
      arrangeGetProductsReturn3ProductsAfter2Seconds();
      await widgetTester.pumpWidget(createHomePageTest());
      await widgetTester.pump(const Duration(milliseconds: 500));
      expect(find.byKey(Key('loading-indicator')), findsOneWidget);
      await widgetTester.pumpAndSettle();
    });

    testWidgets("products are displayed", (widgetTester) async {
      arrangeGetProductsReturn3Products();
      await widgetTester.pumpWidget(createHomePageTest());
      await widgetTester.pump();
      expect(find.byType(ProductsView), findsOneWidget);
    });

    testWidgets("error are displayed", (widgetTester) async {
      arrangeGetProductsThrowError();
      await widgetTester.pumpWidget(createHomePageTest());
      await widgetTester.pump();
      expect(find.byType(ErrorView), findsOneWidget);
    });
  });

  Widget createProductViewTest(ProductEntity product){
    return MaterialApp(
      title: 'Unit test demo',
      home: ProductView(product: product),
    );
  }
  
  group('product_view', () {
    testWidgets("show correct information", (widgetTester) async {
      final product = productsFromRepository[0];
      await widgetTester.pumpWidget(createProductViewTest(product));
      expect(find.text(product.name), findsOneWidget);
      expect(find.text(product.description), findsOneWidget);
    });
  });
}
