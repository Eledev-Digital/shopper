import 'package:graphql/client.dart';

mixin ShopperError {
  void checkForError(QueryResult queryResult) {
    if (queryResult.hasException)
      throw Exception(queryResult.exception.toString());
  }
}
