const String removeDiscountCodeMutation = r'''
mutation checkoutDiscountCodeRemove($checkoutId : ID!) {
  checkoutDiscountCodeRemove(checkoutId: $checkoutId) {
    checkoutUserErrors {
      code
      field
      message
    }
  }
}''';
