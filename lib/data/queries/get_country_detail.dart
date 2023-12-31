const String GetCountryDetail = r'''
query GetCountryDetail($code: ID!) {
  country(code:$code) {
    name
    native
    capital
    emoji
    currency
    languages {
      code
      name
    }
  }
}
''';