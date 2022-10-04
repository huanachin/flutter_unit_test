class ProductEntity {
  final String name;
  final String description;
  final double price;

  ProductEntity({
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntity && runtimeType == other.runtimeType && name == other.name && description == other.description && price == other.price;

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ price.hashCode;
}
