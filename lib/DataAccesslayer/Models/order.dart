/*"id": 81,
        "user": "app tester",
        "delivery": "master",
        "total_price": 1450,
        "status": "0", */

import 'package:timezonesu/DataAccesslayer/Models/order_detail.dart';

class Order {
  final int id;
  final num totalPrice;
  final int status;
  final List<OrderDetail> orderDetails;
  Order({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.orderDetails,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      totalPrice: num.parse(map['total_price'].toString()),
      status: int.parse(map['status'].toString()),
      orderDetails: List<OrderDetail>.from(
        (map['details'] as List<dynamic>).map<OrderDetail>(
          (x) => OrderDetail.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
