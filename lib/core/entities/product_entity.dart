class ProductEntity {
  final int productId;
  final String name;
  final int quantityInStock;
  final String description;
  final double unitPrice;
  final int rate;
  final String imageUrl;
  final int discountPercentage;

  ProductEntity(
      {required this.productId,
      required this.name,
      required this.quantityInStock,
      required this.description,
      required this.unitPrice,
      required this.rate,
      required this.imageUrl,
      required this.discountPercentage});
}
