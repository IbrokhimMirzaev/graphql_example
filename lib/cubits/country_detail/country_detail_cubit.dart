import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_task/data/models/country_detail/country_detail.dart';
import 'package:graphql_task/data/models/status/status.dart';
import 'package:graphql_task/data/services/country_detail_api_client.dart';

part 'country_detail_state.dart';

class CountryDetailCubit extends Cubit<CountryDetailState> {
  CountryDetailCubit({
    required this.countryDetailApiClient,
  }) : super(
          CountryDetailState(
            country: CountryDetail(
              name: '',
              emoji: '',
              capital: '',
              currency: '',
              native: '',
            ),
            status: Status.PURE,
            errorText: "",
          ),
        );

  final CountryDetailApiClient countryDetailApiClient;

  Future<void> getCountryDetail({required String code}) async {
    emit(state.copyWith(status: Status.LOADING));
    try {
      CountryDetail country = await countryDetailApiClient.getCountryDetail(code: code);
      emit(state.copyWith(status: Status.SUCCESS, country: country));
    } catch (error) {
      emit(state.copyWith(status: Status.ERROR, errorText: "GET COUNTRY DETAIL ERROR!!!"));
    }
  }
}
