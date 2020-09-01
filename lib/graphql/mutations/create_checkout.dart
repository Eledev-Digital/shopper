const String createCheckoutMutation = r'''
mutation CreateCheckout {
  checkoutCreate(input: {}) {
    checkout {
      id
    }
  }
}
''';
