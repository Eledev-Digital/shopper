import 'package:shopper/model/products/variant.dart';

class LineItem {
  final String id;
  final int quantity;
  final String title;
  final Variant variant;

  LineItem({this.id, this.quantity, this.variant, this.title});

  static LineItem fromJson(Map<String, dynamic> data) {
    var node = data['node'] ?? {};
    return LineItem(
      id: node['id'],
      quantity: node['quantity'],
      variant: Variant.fromJson(node['variant']),
      title: node['title'],
    );
  }
}
