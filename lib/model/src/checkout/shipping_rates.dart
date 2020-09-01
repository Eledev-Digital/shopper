import 'package:shopper/model/src/products/price.dart';

class AvailableShippingRates {
  final bool ready;
  final List<ShippingRate> shippingRates;

  const AvailableShippingRates({this.ready, this.shippingRates});

  factory AvailableShippingRates.fromJson(Map<String, dynamic> data) {
    List<ShippingRate> _shippingRates = (data['shippingRates'] as List)
        ?.map((rate) => ShippingRate.fromJson(rate))
        ?.toList();

    return AvailableShippingRates(
      ready: data['ready'],
      shippingRates: _shippingRates,
    );
  }
}

class ShippingRate {
  final String handle;
  final String title;
  final Price price;

  ShippingRate({this.handle, this.title, this.price});

  factory ShippingRate.fromJson(Map<String, dynamic> data) => ShippingRate(
      handle: data['handle'],
      title: data['title'],
      price: Price.fromJson(data['priceV2']));
}
