const String deleteCustomerAddressMutation = r'''
mutation customerAddressDelete($customerAccessToken : String!, $id : ID!) {
  customerAddressDelete(customerAccessToken: $customerAccessToken, id: $id) {
    customerUserErrors {
      code
      field
      message
    }
  }
}
''';
