import 'package:graphql/client.dart';
import 'package:shopper/enums/product_sort.dart';
import 'package:shopper/graphql/queries/getProducts.dart';
import 'package:shopper/graphql/queries/getProductsAfterCursor.dart';
import 'package:shopper/mixins/shopper_error.dart';
import 'package:shopper/model/models.dart';

import '../shopper_config.dart';

class ShopperStore with ShopperError {
  ShopperStore._();

  static final ShopperStore instance = ShopperStore._();

  GraphQLClient _client = ShopperConfig.graphQLClient;

  Future<List<Product>> getProducts({
    String query = '',
    int limit = 100,
    bool reverse = false,
    ProductSort sortKey = ProductSort.FEATURED,
    bool clearCache = false,
  }) async {
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(getProductsQuery),
      variables: {
        'limit': limit,
        'sortKey': sortKey.key,
        'reverse': sortKey.reversed,
      },
    );
    final QueryResult result = await _client.query(_options);
    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    var data = result?.data ?? {};

    return Products.fromJson(data["products"] ?? {}).products;
  }

  Future<List<Product>> getProductsAfterCursor({
    String query = '',
    int limit = 100,
    String cursor = '',
    bool reverse = false,
    ProductSort sortKey = ProductSort.FEATURED,
    bool clearCache = false,
  }) async {
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(getProductsAfterCursorQuery),
      variables: {
        'limit': limit,
        'sortKey': sortKey.key,
        'reverse': sortKey.reversed,
        'cursor': cursor,
      },
    );
    final QueryResult result = await _client.query(_options);
    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    var data = result?.data ?? {};

    return Products.fromJson(data["products"] ?? {}).products;
  }
}
