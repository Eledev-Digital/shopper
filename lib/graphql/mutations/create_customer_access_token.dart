const String createCustomerAccessTokenMutation = r'''
mutation customerAccessTokenCreate($email : String!, $password: String!) {
  customerAccessTokenCreate(input: {email: $email, password: $password}) {
    customerAccessToken {
      expiresAt
      accessToken
    }
  }
}''';
