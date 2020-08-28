import 'price.dart';

class Variant {
  final String id;
  final String sku;

  final Price price;
  final Price compareAtPrice;
  final bool requiresShipping;
  final bool availableForSale;

  final double weight;
  final String weightUnit;

  Variant({
    this.id,
    this.sku,
    this.price,
    this.compareAtPrice,
    this.requiresShipping,
    this.weight,
    this.weightUnit,
    this.availableForSale,
  });

  factory Variant.fromJson(Map<String, dynamic> data) => Variant(
        id: data['id'],
        sku: data['sku'],
        price: Price.fromJson(data['priceV2']),
        compareAtPrice: Price.fromJson(data['compareAtPriceV2']),
        requiresShipping: data['requiresShipping'],
        availableForSale: data['availableForSale'],
        weight: data['weight'],
        weightUnit: data['weightUnit'],
      );
}
