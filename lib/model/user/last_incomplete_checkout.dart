import 'package:shopper/model/checkout/line_item.dart';
import 'package:shopper/model/products/price.dart';

class LastIncompleteCheckout {
  final String completedAt;
  final String createdAt;
  final String email;
  final String id;
  final String currencyCode;
  final String webUrl;
  final Price totalPrice;
  final Price lineItemsSubtotalPrice;
  final List<LineItem> lineItems;

  LastIncompleteCheckout({
    this.completedAt,
    this.createdAt,
    this.email,
    this.id,
    this.currencyCode,
    this.webUrl,
    this.totalPrice,
    this.lineItemsSubtotalPrice,
    this.lineItems,
  });

  static LastIncompleteCheckout fromJson(Map<String, dynamic> data) {
    var _lineItems = (data['lineItems']['edges'] as List)
        ?.map((item) => LineItem.fromJson(item))
        ?.toList();

    return LastIncompleteCheckout(
      id: data['id'],
      email: data['email'],
      completedAt: data['completedAt'],
      createdAt: data['createdAt'],
      webUrl: data['webUrl'],
      currencyCode: data['currencyCode'],
      totalPrice: Price.fromJson(data['totalPriceV2']),
      lineItemsSubtotalPrice: Price.fromJson(data['lineItemsSubtotalPrice']),
      lineItems: _lineItems,
    );
  }
}
