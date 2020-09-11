import 'product.dart';

class Products {
  final List<Product> products;
  final bool hasNextPage;
  final bool hasPreviousPage;

  Products({this.hasPreviousPage, this.products, this.hasNextPage});

  factory Products.fromJson(Map<String, dynamic> data) {
    List<Product> _products = (data['edges'] as List)
        ?.map((product) => Product.fromJson(product))
        ?.toList();

    var pageInfo = data['pageInfo'] ?? {};

    return Products(
      products: _products,
      hasNextPage: pageInfo['hasNextPage'],
      hasPreviousPage: pageInfo['hasPreviousPage'],
    );
  }
}
