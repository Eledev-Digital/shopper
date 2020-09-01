import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:shopper/enums/sort_key_order.dart';
import 'package:shopper/graphql/mutations/apply_discount_code.dart';
import 'package:shopper/graphql/mutations/checkout_associate_customer.dart';
import 'package:shopper/graphql/mutations/checkout_disassociate_customer.dart';
import 'package:shopper/graphql/mutations/create_checkout.dart';
import 'package:shopper/graphql/mutations/remove_discount_code.dart';
import 'package:shopper/graphql/mutations/replace_checkout_items.dart';
import 'package:shopper/graphql/mutations/update_checkout_address.dart';
import 'package:shopper/graphql/queries/get_orders.dart';
import 'package:shopper/mixins/shopper_error.dart';
import 'package:shopper/model/models.dart';

import '../shopper_config.dart';

class ShopperCheckout with ShopperError {
  ShopperCheckout._();
  static final ShopperCheckout instance = ShopperCheckout._();

  GraphQLClient _client = ShopperConfig.graphQLClient;

  /// Returns a [Orders] object with list of [Order] associated with [customerAccessToken].
  Future<List<Order>> getAllOrders({
    @required String customerAccessToken,
    OrderSortKey sortKey = OrderSortKey.RELEVANCE,
    bool clearCache = false,
  }) async {
    final QueryOptions _options = WatchQueryOptions(
      documentNode: gql(getOrdersQuery),
      variables: {
        'accessToken': customerAccessToken,
        'sortKey': sortKey.string,
      },
    );
    final QueryResult result = await _client.query(_options);

    checkForError(result);

    var customerData = (result?.data ?? {})['customer'] ?? {};

    Orders orders = Orders.fromJson(customerData['orders'] ?? {});

    if (clearCache) _client.cache.write(_options.toKey(), null);

    return orders.orders;
  }

  /// Creates a new [Checkout] and return [checkoutId].
  Future<String> createCheckout({bool clearCache = false}) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(createCheckoutMutation),
    );

    final QueryResult result = await _client.mutate(_options);

    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    var data = result?.data['checkoutCreate'] ?? {};

    return (data['checkout'] ?? {})['id'];
  }

  /// Applies [discountCode] to the [Checkout] that [checkoutId] belongs to.
  Future<void> applyCheckoutDiscountCode({
    @required String checkoutId,
    @required String discountCode,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(applyDiscountCodeMutation),
      variables: {'checkoutId': checkoutId, 'discountCode': discountCode},
    );

    final QueryResult result = await _client.mutate(_options);

    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// Removes the applied discount from the [Checkout] that [checkoutId] belongs to.
  Future<void> removeCheckoutDiscountCode({
    @required String checkoutId,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(removeDiscountCodeMutation),
      variables: {'checkoutId': checkoutId},
    );
    QueryResult result = await _client.mutate(_options);

    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// Updates the shipping address for a given [checkoutId]
  Future<void> shippingAddressUpdate({
    @required String checkoutId,
    String address1,
    String address2,
    String company,
    String city,
    String country,
    String firstName,
    String lastName,
    String phone,
    String province,
    String zip,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
        documentNode: gql(updateCheckoutAddressMutation),
        variables: {
          'checkoutId': checkoutId,
          'address1': address1,
          'address2': address2,
          'company': company,
          'city': city,
          'country': country,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
          'province': province,
          'zip': zip
        });

    final QueryResult result = await _client.mutate(_options);

    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// Associates the [Customer] with [customerAccessToken], to the [Checkout] with [checkoutId].
  Future<void> checkoutCustomerAssociate({
    @required String checkoutId,
    @required String customerAccessToken,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(checkoutAssociateCustomerMutation),
      variables: {
        'checkoutId': checkoutId,
        'customerAccessToken': customerAccessToken
      },
    );
    final QueryResult result = await _client.mutate(_options);

    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// Disassociates the [Customer] with [customerAccessToken], to the [Checkout] with [checkoutId].
  Future<void> checkoutCustomerDisassociate({
    @required String checkoutId,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(checkoutDisassociateCustomerMutation),
      variables: {'id': checkoutId},
    );

    final QueryResult result = await _client.mutate(_options);

    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// takes in [checkoutId] and a Map<[String] variantId, [int] quantity>
  Future<void> replaceCheckoutItems({
    @required String checkoutId,
    @required Map<String, int> varientQuantities,
    bool clearCache = false,
  }) async {
    /// to [{"quantity":AMOUNT,"variantId":"YOUR_VARIANT_ID"}]
    List items = varientQuantities.entries
        .map((item) => {"variantId": item.key, "quantity": item.value})
        .toList();

    final MutationOptions _options = MutationOptions(
      documentNode: gql(replaceCheckoutItemsMutation),
      variables: {'checkoutId': checkoutId, 'checkoutLineItems': items},
    );

    final QueryResult result = await _client.mutate(_options);

    checkForError(result);

    if (clearCache) _client.cache.write(_options.toKey(), null);
  }
}
