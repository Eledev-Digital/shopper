import 'image.dart';
import 'option.dart';
import 'variant.dart';

class Product {
  final String id;
  final String cursor;

  final String title;

  final List<String> tags;
  final String description;

  final String createdAt;
  final String publishedAt;
  final String updatedAt;

  final bool availableForSale;
  final String onlineStoreUrl;
  final String handle;
  final String productType;
  final List<Option> options;
  final List<ShopifyImage> images;
  final List<Variant> productVariants;

  Product({
    this.id,
    this.cursor,
    this.title,
    this.tags,
    this.description,
    this.createdAt,
    this.publishedAt,
    this.updatedAt,
    this.availableForSale,
    this.onlineStoreUrl,
    this.handle,
    this.productType,
    this.options,
    this.images,
    this.productVariants,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    var node = data['node'] ?? {};

    List<String> _tags =
        (node['tags'] as List)?.map((tag) => tag as String)?.toList();

    List<ShopifyImage> _images = (node['images']['edges'] as List)
        ?.map((image) => ShopifyImage.fromJson(image['node']))
        ?.toList();

    List<Option> _options = (node['options'] as List)
        ?.map((option) => Option.fromJson(option))
        ?.toList();

    List<Variant> _variants = (node['variants']['edges'] as List)
        ?.map((variant) => Variant.fromJson(variant['node']))
        ?.toList();

    return Product(
      id: node['id'],
      cursor: data['cursor'],
      title: node['title'],
      tags: _tags,
      description: node['description'],
      createdAt: node['createdAt'],
      publishedAt: node['publishedAt'],
      updatedAt: node['updatedAt'],
      availableForSale: node['availableForSale'],
      onlineStoreUrl: node['onlineStoreUrl'],
      handle: node['handle'],
      productType: node['productType'],
      options: _options,
      images: _images,
      productVariants: _variants,
    );
  }
}
