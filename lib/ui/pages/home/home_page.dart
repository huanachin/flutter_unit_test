import 'package:demo_unit_test/data/data_source/concrete/product_cloud_datasource_impl.dart';
import 'package:demo_unit_test/domain/repositories/product_repository_impl.dart';
import 'package:demo_unit_test/ui/pages/home/home_change_notifier.dart';
import 'package:demo_unit_test/ui/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeChangeNotifier(
        ProductRepositoryImpl(ProductCloudDataSourceImpl()),
      ),
      child: const HomeView(),
    );
  }
}
