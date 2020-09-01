const String checkoutDisassociateCustomerMutation = r'''
mutation checkoutDisassociateCustomer$id:ID!) {
  checkoutCustomerDisassociateV2(checkoutId: $id) {
    checkoutUserErrors {
      code
      field
      message
    }
  }
}
''';
