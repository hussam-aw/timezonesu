/*"id": 114,
                "product": "ww-jjj-888",
                "quantity": "1",
                "order": 81,
                "total_price": 360,
                "price": 360, */
class OrderDetail {
  final int id;
  final String product;
  final String quantity;
  final String price;
  final String totalPrice;
  OrderDetail({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      id: map['id'] as int,
      product: map['product'] as String,
      quantity: map['quantity'] as String,
      price: map['price'].toString(),
      totalPrice: map['total_price'].toString(),
    );
  }
}
