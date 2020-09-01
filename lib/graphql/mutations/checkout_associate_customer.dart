const String checkoutAssociateCustomerMutation = r'''
mutation checkoutAssociateCustomer($checkoutId : ID!, $customerAccessToken : String!) {
  checkoutCustomerAssociateV2(checkoutId: $checkoutId, customerAccessToken: $customerAccessToken) {
    checkoutUserErrors {
      code
      field
      message
    }
  }
}
''';
