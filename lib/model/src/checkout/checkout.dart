import 'package:shopper/model/src/products/price.dart';

import 'applied_giftcards.dart';
import 'line_item.dart';
import 'shipping_rates.dart';

class Checkout {
  final String id;
  final String email;
  final List<AppliedGiftCards> appliedGiftcards;
  final AvailableShippingRates availableShippingrates;
  final String completedAt;
  final String createdAt;
  final String currencyCode;
  final List<LineItem> lineItems;
  final String note;
  final String webUrl;
  final String updatedAt;
  final Price totalTax;
  final Price totalPrice;
  final bool taxesIncluded;
  final bool taxExempt;
  final Price subtotalPrice;
  final String orderStatusUrl;
  final bool requiresShipping;

  Checkout({
    this.id,
    this.email,
    this.appliedGiftcards,
    this.availableShippingrates,
    this.completedAt,
    this.createdAt,
    this.currencyCode,
    this.lineItems,
    this.note,
    this.webUrl,
    this.updatedAt,
    this.totalTax,
    this.totalPrice,
    this.taxesIncluded,
    this.taxExempt,
    this.subtotalPrice,
    this.orderStatusUrl,
    this.requiresShipping,
  });

  factory Checkout.fromJson(Map<String, dynamic> data) {
    List<LineItem> _lineItems = (data['lineItems']['edges'] as List)
        ?.map((item) => LineItem.fromJson(item))
        ?.toList();

    return Checkout(
      id: data['id'],
      email: data['email'],
      note: data['note'],
      lineItems: _lineItems,
      webUrl: data['webUrl'],
      // price
      totalPrice: Price.fromJson(data['totalPriceV2']),
      subtotalPrice: Price.fromJson(data['subtotalPriceV2']),
      totalTax: Price.fromJson(data['totalTaxV2']),
      taxExempt: data['taxExempt'],
      taxesIncluded: data['taxesIncluded'],
      currencyCode: data['currencyCode'],
      // status
      completedAt: data['completedAt'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
      orderStatusUrl: data['orderStatusUrl'],
      requiresShipping: data['requiresShipping'],
    );
  }
}
