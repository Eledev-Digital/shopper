import 'product.dart';

class Products {
  final List<Product> products;
  final bool hasNextPage;

  Products({this.products, this.hasNextPage});

  factory Products.fromJson(Map<String, dynamic> data) {
    List<Product> _products = (data['edges'] as List)
        ?.map((product) => Product.fromJson(product))
        ?.toList();
    return Products(
        products: _products,
        hasNextPage: (data['pageInfo'] ?? {})['hasNextPage']);
  }
}
