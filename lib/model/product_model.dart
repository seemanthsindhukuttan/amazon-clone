class ProductModel {
  final String uid;
  final String productName;
  final String imageUrl;
  final double price;
  final int discount;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int ratingCount;

  ProductModel({
    required this.uid,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.ratingCount,
  });
}
