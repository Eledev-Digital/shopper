import 'package:graphql/client.dart';

class ShopperConfig {
  /// access key located inside shopify dashboard.
  static String _storefrontAccessToken;

  /// store url
  static String _storeUrl;

  /// Storefront API version.
  ///
  /// Default is 2020-04.
  static String _storefrontApiVersion = '2020-04';

  ///
  static void setConfig({
    String storeUrl,
    String storefrontAccessToken,
    String storefrontApiVersion,
  }) {
    _storefrontAccessToken ??= storefrontAccessToken;
    _storeUrl ??= storeUrl;
    _storefrontApiVersion = storefrontApiVersion != null
        ? storefrontApiVersion
        : _storefrontApiVersion;
  }

  static final _headers = {
    'X-Shopify-Storefront-Access-Token': '$_storefrontAccessToken',
    "Accept": "application/json",
  };

  /// The GraphQL Client used for communication with the Shopify Storefront API.
  static final GraphQLClient graphQLClient = GraphQLClient(
    link: HttpLink(
      headers: _headers,
      uri: '$_storeUrl/api/$_storefrontApiVersion/graphql',
    ),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
  );
}
