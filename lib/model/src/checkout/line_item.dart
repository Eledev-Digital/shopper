import 'package:shopper/model/src/orders/discounts.dart';
import 'package:shopper/model/src/products/price.dart';
import 'package:shopper/model/src/products/variant.dart';

class LineItem {
  final String id;
  final int quantity;
  final String title;
  final Variant variant;
  final Price unitPrice;

  final List<DiscountAllocation> discountAlocations;

  LineItem({
    this.id,
    this.title,
    this.variant,
    this.quantity,
    this.unitPrice,
    this.discountAlocations,
  });

  static LineItem fromJson(Map<String, dynamic> data) {
    var node = data['node'] ?? {};
    return LineItem(
      id: node['id'],
      quantity: node['quantity'],
      variant: Variant.fromJson(node['variant'] ?? {}),
      title: node['title'],
      unitPrice: Price.fromJson(node['unitPrice'] ?? {}),
    );
  }
}
