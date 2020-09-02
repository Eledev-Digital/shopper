const String shippingInfoQuery = r'''
query getCheckoutInfoAboutShipping($id : ID!) {
  node(id: $id) {
    ... on Checkout {
      requiresShipping
    }
  }
}''';
