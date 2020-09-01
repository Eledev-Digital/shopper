import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:shopper/graphql/mutations/create_customer_address.dart';
import 'package:shopper/graphql/mutations/delete_customer_address.dart';
import 'package:shopper/graphql/mutations/update_customer.dart';
import 'package:shopper/graphql/mutations/update_customer_address.dart';
import 'package:shopper/mixins/shopper_error.dart';

import '../shopper_config.dart';

class ShopifyCustomer with ShopperError {
  ShopifyCustomer._();

  static final ShopifyCustomer instance = ShopifyCustomer._();
  GraphQLClient _client = ShopperConfig.graphQLClient;

  Future<void> updateCustomerAdress({
    String id,
    @required String customerAccessToken,
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
      documentNode: gql(updateCustomerAddressMutation),
      variables: {
        'address1': address1,
        'address2': address2,
        'company': company,
        'city': city,
        'country': country,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'province': province,
        'zip': zip,
        'customerAccessToken': customerAccessToken,
        'id': id
      },
    );

    final QueryResult _result = await _client.mutate(_options);

    checkForError(_result);

    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// Deletes the address with [addressId] from the customer with [customerAccessToken]
  ///
  /// A Customer may have more than 1 address, so the addresses have Id's.
  Future<void> deleteCustomerAddress({
    String customerAccessToken,
    String addressId,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(deleteCustomerAddressMutation),
      variables: {'customerAccessToken': customerAccessToken, 'id': addressId},
    );
    final QueryResult _result = await _client.mutate(_options);
    checkForError(_result);
    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// Creates a address for the customer to which [customerAccessToken] belongs to.
  Future<void> customerAddressCreate({
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
    String customerAccessToken,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(createCustomerAddressMutation),
      variables: {
        'address1': address1,
        'address2': address2,
        'company': company,
        'city': city,
        'country': country,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'province': province,
        'zip': zip,
        'customerAccessToken': customerAccessToken,
      },
    );
    final QueryResult result = await _client.mutate(_options);
    checkForError(result);
    if (clearCache) _client.cache.write(_options.toKey(), null);
  }

  /// Updates the customer to which [customerAccessToken] belongs to.
  Future<void> customerUpdate({
    String email,
    String firstName,
    String lastName,
    String password,
    String phoneNumber,
    String customerAccessToken,
    bool acceptsMarketing,
    bool deleteThisPartOfCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(updateCustomerMutation),
      variables: {
        'id': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'phone': phoneNumber,
        'acceptsMarketing': acceptsMarketing,
        'customerAccessToken': customerAccessToken
      },
    );
    final QueryResult result = await _client.mutate(_options);
    checkForError(result);
    if (deleteThisPartOfCache) {
      _client.cache.write(_options.toKey(), null);
    }
  }
}
