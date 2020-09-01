import 'package:shopper/model/src/products/price.dart';
import 'package:shopper/model/src/products/variant.dart';

import 'discounts.dart';

class OrderLineItem {
  final String id;
  final int quantity;
  final String title;
  final Variant variant;
  final Price originalPrice;
  final Price discountedPrice;
  final List<DiscountAllocation> discountAlocations;

  OrderLineItem({
    this.id,
    this.title,
    this.variant,
    this.quantity,
    this.originalPrice,
    this.discountedPrice,
    this.discountAlocations,
  });

  static OrderLineItem fromJson(Map<String, dynamic> data) {
    var node = data['node'] ?? {};
    return OrderLineItem(
        id: node['id'],
        quantity: node['quantity'],
        variant: Variant.fromJson(node['variant'] ?? {}),
        title: node['title'],
        discountedPrice: Price.fromJson(node['discountedTotalPrice'] ?? {}),
        originalPrice: Price.fromJson(node['originalTotalPrice'] ?? {}));
  }
}
