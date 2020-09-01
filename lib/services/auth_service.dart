import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:shopper/graphql/mutations/create_customer.dart';
import 'package:shopper/graphql/mutations/create_customer_access_token.dart';
import 'package:shopper/graphql/queries/get_customer.dart';
import 'package:shopper/mixins/shopper_error.dart';
import 'package:shopper/model/user/user.dart';
import 'package:shopper/shopper.dart';

class AuthService with ShopperError {
  AuthService._();
  final GraphQLClient _client = ShopperConfig.graphQLClient;

  static final AuthService instance = AuthService._();

  Future<User> createUser({
    @required String email,
    @required String password,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(createCustomerMutation),
      variables: {'email': email, 'password': password},
    );
    final QueryResult result = await _client.mutate(_options);

    checkForError(result);

    var userData = result?.data['customerCreate'] ?? {};

    var userErrors = userData['customerUserErrors'];

    if (userErrors != null) throw (userErrors.first['message']);

    final user = User.fromJson(userData['customer']);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    return user;
  }

  /// retrieves the [User] associated with a given [accessToken]
  Future<User> getUser({
    @required String accessToken,
    bool clearCache = false,
  }) async {
    final WatchQueryOptions _getCustomer = WatchQueryOptions(
      documentNode: gql(getCustomerQuery),
      variables: {'customerAccessToken': accessToken},
    );

    final QueryResult result = await _client.query(_getCustomer);

    checkForError(result);

    final user = User.fromJson(result?.data['customer']);

    if (clearCache) _client.cache.write(_getCustomer.toKey(), null);

    return user;
  }

  /// retrieves the access token for a [User] with [email] and [password]
  Future<String> createAccessToken({
    @required String email,
    @required String password,
    bool clearCache = false,
  }) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(createCustomerAccessTokenMutation),
      variables: {'email': email, 'password': password},
    );

    final QueryResult result = await _client.mutate(_options);

    if (clearCache) _client.cache.write(_options.toKey(), null);

    return result?.data['customerAccessTokenCreate']['customerAccessToken']
        ['accessToken'];
  }

  // TODO: sign out current user (invalidate access token)
}
