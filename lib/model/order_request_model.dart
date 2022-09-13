class OrderRequestModel {
  final String productName;
  final String buyerName;
  final String buyerAddress;

  OrderRequestModel({
    required this.productName,
    required this.buyerName,
    required this.buyerAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "buyerName": buyerName,
      "buyerAddress": buyerAddress,
    };
  }

  factory OrderRequestModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return OrderRequestModel(
      productName: json["productName"],
      buyerName: json["buyerName"],
      buyerAddress: json["buyerAddress"],
    );
  }
}
