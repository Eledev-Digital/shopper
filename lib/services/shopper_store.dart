import 'package:graphql/client.dart';
import 'package:shopper/enums/product_sort.dart';
import 'package:shopper/graphql/queries/getProducts.dart';
import 'package:shopper/graphql/queries/getProductsAfterCursor.dart';
import 'package:shopper/graphql/queries/getProductsBeforeCursor.dart';
import 'package:shopper/mixins/shopper_error.dart';
import 'package:shopper/model/models.dart';

import '../shopper_config.dart';

class ShopperStore with ShopperError {
  ShopperStore._();

  static final ShopperStore instance = ShopperStore._();

  GraphQLClient _client = ShopperConfig.graphQLClient;

  Future<Products> getProducts({
    String query = '',
    int limit = 100,
    ProductSort sortKey = ProductSort.FEATURED,
    bool clearCache = false,
    bool filterOutOfStock = true,
  }) async {
    var outOfStockFilter =
        '(published_status:published AND available_for_sale:true)';
    query = filterOutOfStock ? outOfStockFilter + query : query;

    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(getProductsQuery),
      variables: {
        'limit': limit,
        'sortKey': sortKey.key,
        'reverse': sortKey.reversed,
        'query': query,
      },
    );
    final QueryResult result = await _client.query(_options);
    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    var data = result?.data ?? {};

    return Products.fromJson(data["products"] ?? {});
  }

  Future<Products> getProductsAfterCursor({
    String query = '',
    int limit = 100,
    String after = '',
    ProductSort sortKey = ProductSort.FEATURED,
    bool clearCache = false,
    bool filterOutOfStock = true,
  }) async {
    var outOfStockFilter =
        '(published_status:published AND available_for_sale:true)';
    query = filterOutOfStock ? outOfStockFilter + query : query;
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(getProductsAfterCursorQuery),
      variables: {
        'limit': limit,
        'sortKey': sortKey.key,
        'reverse': sortKey.reversed,
        'query': query,
        'after': after,
      },
    );
    final QueryResult result = await _client.query(_options);
    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    var data = result?.data ?? {};

    return Products.fromJson(data["products"] ?? {});
  }

  Future<Products> getProductsBeforeCursor({
    String query = '',
    int limit = 100,
    String before = '',
    ProductSort sortKey = ProductSort.FEATURED,
    bool clearCache = false,
    bool filterOutOfStock = true,
  }) async {
    var outOfStockFilter =
        '(published_status:published AND available_for_sale:true)';
    query = filterOutOfStock ? outOfStockFilter + query : query;
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(getProductsBeforeCursorQuery),
      variables: {
        'limit': limit,
        'sortKey': sortKey.key,
        'reverse': sortKey.reversed,
        'query': query,
        'before': before,
      },
    );
    final QueryResult result = await _client.query(_options);
    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    var data = result?.data ?? {};

    return Products.fromJson(data["products"] ?? {});
  }
}
