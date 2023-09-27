import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/cubits/country/country_cubit.dart';
import 'package:graphql_task/cubits/country_detail/country_detail_cubit.dart';
import 'package:graphql_task/data/services/country_api_client.dart';
import 'package:graphql_task/data/services/country_detail_api_client.dart';
import 'package:graphql_task/ui/countries_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(
          create: (context) => CountryCubit(countryApiClient: CountryApiClient.create()),
        ),
        BlocProvider<CountryDetailCubit>(
          create: (context) => CountryDetailCubit(
              countryDetailApiClient: CountryDetailApiClient.create()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CountriesPage(),
      ),
    );
  }
}
