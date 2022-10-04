import 'package:demo_unit_test/data/models/product_entity.dart';
import 'package:demo_unit_test/data/repositories/product_repository.dart';
import 'package:demo_unit_test/ui/pages/home/home_change_notifier.dart';
import 'package:demo_unit_test/ui/pages/home/home_page.dart';
import 'package:demo_unit_test/ui/pages/home/home_view.dart';
import 'package:demo_unit_test/ui/pages/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../test/ui/pages/home/home_page_notifier_test.mocks.dart';

void main() {
  late ProductRepository productRepository;

  setUp(() {
    productRepository = MockProductRepositoryImpl();
  });

  final productsFromRepository = [
    ProductEntity(name: "Milk", description: "Gloria Milk", price: 20.0),
    ProductEntity(name: "Chocolate", description: "Gloria Chocolate", price: 10.0),
    ProductEntity(name: "Bread", description: "Delicious bread", price: 20.0),
  ];

  void arrangeGetProductsReturn3Products() {
    when(productRepository.getProducts()).thenAnswer((_) async => productsFromRepository);
  }

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
    testWidgets(
      "Tapping the first product opens the product page were the description content is displayed",
      (widgetTester) async {
        arrangeGetProductsReturn3Products();
        await widgetTester.pumpWidget(createHomePageTest());
        await widgetTester.pump();

        await widgetTester.tap(find.text("Milk"));
        await widgetTester.pumpAndSettle();

        expect(find.byType(HomeView), findsNothing);
        expect(find.byType(ProductPage), findsOneWidget);

        await widgetTester.tap(find.byType(BackButton));
        await widgetTester.pumpAndSettle();

        expect(find.byType(ProductPage), findsNothing);
        expect(find.byType(HomeView), findsOneWidget);

      },
    );
  });


}
