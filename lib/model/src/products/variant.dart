import 'package:shopper/model/src/products/selected_option.dart';

import 'image.dart';
import 'price.dart';

class Variant {
  final String id;
  final String sku;
  final String title;
  final ShopifyImage image;
  final Price price;
  final Price compareAtPrice;
  final bool requiresShipping;
  final bool availableForSale;
  final List<SelectedOption> selectedOptions;
  final double weight;
  final String productName;
  final String weightUnit;

  Variant({
    this.id,
    this.sku,
    this.title,
    this.productName,
    this.image,
    this.price,
    this.compareAtPrice,
    this.selectedOptions,
    this.requiresShipping,
    this.weight,
    this.weightUnit,
    this.availableForSale,
  });

  factory Variant.fromJson(Map<String, dynamic> data) {
    List<SelectedOption> _options = (data['selectedOptions'] as List)
        ?.map((opt) => SelectedOption.fromJson(opt))
        ?.toList();

    return Variant(
      id: data['id'],
      sku: data['sku'],
      title: data['title'],
      image: ShopifyImage.fromJson(data['image']),
      selectedOptions: _options,
      price: Price.fromJson(data['priceV2']),
      compareAtPrice: Price.fromJson(data['compareAtPriceV2']),
      requiresShipping: data['requiresShipping'],
      availableForSale: data['availableForSale'],
      weight: data['weight'],
      weightUnit: data['weightUnit'],
      productName: (data['product'] ?? {})['title'],
    );
  }
}
