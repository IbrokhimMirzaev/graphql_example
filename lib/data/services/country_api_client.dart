import 'package:graphql/client.dart';
import 'package:graphql_task/data/models/country/country.dart';
import 'package:graphql_task/data/queries/get_country_list.dart';

class GetCountryListFailure implements Exception {}

class CountryApiClient {
  const CountryApiClient({
    required GraphQLClient graphQLClient,
  }) : _graphQLClient = graphQLClient;

  factory CountryApiClient.create() {
    final httpLink1 = HttpLink('https://countries.trevorblades.com');
    return CountryApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: Link.from([httpLink1])),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<Country>> getCountryList() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(GetCountryList)),
    );
    if (result.hasException) throw GetCountryListFailure();
    List<Country> countries = (result.data?['countries'] as List?)?.map((e) => Country.fromJson(e)).toList() ?? [];
    return countries;
  }
}
