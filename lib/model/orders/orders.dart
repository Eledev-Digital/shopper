import 'order.dart';

class Orders {
  final List<Order> orders;
  final bool hasNextPage;

  Orders({this.orders, this.hasNextPage});

  factory Orders.fromJson(Map<String, dynamic> data) {
    var _orders = (data['edges'] as List)
        ?.map((order) => Order.fromJson(order ?? {}))
        ?.toList();

    return Orders(
      orders: _orders,
      hasNextPage: (data['pageInfo'] ?? {})['hasNextPage'],
    );
  }
}
