// Mocks generated by Mockito 5.3.2 from annotations
// in demo_unit_test/test/ui/pages/home/home_page_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:demo_unit_test/data/data_source/abstract/ProductCloudDataSource.dart'
    as _i2;
import 'package:demo_unit_test/data/models/product_entity.dart' as _i3;
import 'package:demo_unit_test/domain/repositories/product_repository_impl.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductCloudDataSource_0 extends _i1.SmartFake
    implements _i2.ProductCloudDataSource {
  _FakeProductCloudDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductEntity_1 extends _i1.SmartFake implements _i3.ProductEntity {
  _FakeProductEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepositoryImpl extends _i1.Mock
    implements _i4.ProductRepositoryImpl {
  @override
  _i2.ProductCloudDataSource get productCloudDataSource => (super.noSuchMethod(
        Invocation.getter(#productCloudDataSource),
        returnValue: _FakeProductCloudDataSource_0(
          this,
          Invocation.getter(#productCloudDataSource),
        ),
        returnValueForMissingStub: _FakeProductCloudDataSource_0(
          this,
          Invocation.getter(#productCloudDataSource),
        ),
      ) as _i2.ProductCloudDataSource);
  @override
  _i5.Future<List<_i3.ProductEntity>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i5.Future<List<_i3.ProductEntity>>.value(<_i3.ProductEntity>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i3.ProductEntity>>.value(<_i3.ProductEntity>[]),
      ) as _i5.Future<List<_i3.ProductEntity>>);
  @override
  _i5.Future<_i3.ProductEntity> findProductByName(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #findProductByName,
          [name],
        ),
        returnValue: _i5.Future<_i3.ProductEntity>.value(_FakeProductEntity_1(
          this,
          Invocation.method(
            #findProductByName,
            [name],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.ProductEntity>.value(_FakeProductEntity_1(
          this,
          Invocation.method(
            #findProductByName,
            [name],
          ),
        )),
      ) as _i5.Future<_i3.ProductEntity>);
}
