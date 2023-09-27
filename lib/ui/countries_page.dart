import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/cubits/country/country_cubit.dart';
import 'package:graphql_task/cubits/country_detail/country_detail_cubit.dart';
import 'package:graphql_task/data/models/status/status.dart';
import 'package:graphql_task/ui/country_detail_page.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Country List")),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          var st = state.status;
          if (st == Status.LOADING) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          } else if (st == Status.ERROR) {
            return Center(child: Text(state.errorText));
          } else if (st == Status.SUCCESS) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    BlocProvider.of<CountryDetailCubit>(context).getCountryDetail(code: state.countries[index].code);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a, sA) {
                          return FadeTransition(
                            opacity: a,
                            child: CountryDetailPage(index: index),
                          );
                        },
                        transitionDuration: const Duration(seconds: 1),
                        reverseTransitionDuration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  leading: Hero(
                    tag: index.toString(),
                    child: Text(
                      state.countries[index].emoji,
                      style: const TextStyle(
                        fontSize: 40,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  title: Text(state.countries[index].name),
                  subtitle: Text(state.countries[index].code),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
