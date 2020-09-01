import 'package:shopper/model/orders/order_line_item.dart';
import 'package:shopper/model/products/price.dart';
import 'package:shopper/model/user/address.dart';

class Order {
  final String id;
  final String email;
  final String currencyCode;
  final String customerUrl;
  final List<OrderLineItem> lineItems;
  final String name;
  final int orderNumber;
  final String phone;
  final String processedAt;
  final Address shippingAddress;
  final String statusUrl;
  final Price subtotalPrice;
  final Price totalPrice;
  final Price totalRefunded;
  final Price totalShippingPrice;
  final Price totalTax;
  final String cursor;

  Order({
    this.id,
    this.email,
    this.currencyCode,
    this.customerUrl,
    this.lineItems,
    this.name,
    this.orderNumber,
    this.phone,
    this.processedAt,
    this.shippingAddress,
    this.statusUrl,
    this.subtotalPrice,
    this.totalPrice,
    this.totalRefunded,
    this.totalShippingPrice,
    this.totalTax,
    this.cursor,
  });

  factory Order.fromJson(Map<String, dynamic> data) {
    var node = data['node'] ?? {};

    var _orderLineItems = (node['lineItems']['edges'] as List)
        ?.map((item) => OrderLineItem.fromJson(data ?? {}))
        ?.toList();
    return Order(
      id: node['id'],
      name: node['name'],
      cursor: data['cursor'],
      email: node['email'],
      orderNumber: node['orderNumber'],
      currencyCode: node['currencyCode'],
      customerUrl: node['customerUrl'],
      lineItems: _orderLineItems,
      phone: node['phone'],
      processedAt: node['processedAt'],
      shippingAddress: Address.fromJson(node['shippingAddress'] ?? {}),
      statusUrl: node['statusUrl'],
      subtotalPrice: Price.fromJson(node['subtotalPriceV2'] ?? {}),
      totalPrice: Price.fromJson(node['totalPriceV2'] ?? {}),
      totalRefunded: Price.fromJson(node['totalRefundedV2'] ?? {}),
      totalShippingPrice: Price.fromJson(node['totalShippingPriceV2'] ?? {}),
      totalTax: Price.fromJson(node['totalTaxV2'] ?? const {}),
    );
  }
}
