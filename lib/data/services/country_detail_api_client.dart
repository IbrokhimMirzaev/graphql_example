import 'package:graphql/client.dart';
import 'package:graphql_task/data/models/country_detail/country_detail.dart';
import 'package:graphql_task/data/queries/get_country_detail.dart';

class GetCountryDetailFailure implements Exception {}

class CountryDetailApiClient {
  const CountryDetailApiClient({
    required GraphQLClient graphQLClient,
  }) : _graphQLClient = graphQLClient;

  factory CountryDetailApiClient.create() {
    final httpLink2 = HttpLink('https://countries.trevorblades.com/graphql');
    return CountryDetailApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: Link.from([httpLink2])),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<CountryDetail> getCountryDetail({required String code}) async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(GetCountryDetail),
        variables: <String, dynamic>{
          "code": code,
        },
      ),
    );
    if (result.hasException) throw GetCountryDetailFailure();
    return CountryDetail.fromJson(result.data?["country"]);
  }
}
