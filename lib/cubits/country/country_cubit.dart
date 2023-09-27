import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_task/data/models/country/country.dart';
import 'package:graphql_task/data/models/status/status.dart';
import 'package:graphql_task/data/services/country_api_client.dart';
part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit({
    required this.countryApiClient,
  }) : super(
    const CountryState(
      countries: [],
      status: Status.PURE,
      errorText: "",
    ),
  ) {
    getCountryList();
  }

  final CountryApiClient countryApiClient;

  Future<void> getCountryList() async {
    emit(state.copyWith(status: Status.LOADING));
    try {
      var countries = await countryApiClient.getCountryList();
      emit(state.copyWith(status: Status.SUCCESS, countries: countries));
    } catch (error) {
      emit(state.copyWith(status: Status.ERROR, errorText: "GET COUNTRY LIST ERROR!!!"));
    }
  }
}
