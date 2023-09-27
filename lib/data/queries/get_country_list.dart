const GetCountryList = r'''
    query GetCountryList() {
        countries {
          code
          name
          emoji
        }
      }
''';