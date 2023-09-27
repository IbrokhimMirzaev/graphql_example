import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/cubits/country_detail/country_detail_cubit.dart';
import 'package:graphql_task/data/models/status/status.dart';

class CountryDetailPage extends StatelessWidget {
  const CountryDetailPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Country")),
      body: BlocBuilder<CountryDetailCubit, CountryDetailState>(
        builder: (context, state) {
          var st = state.status;
          if (st == Status.LOADING) {
            return const Center(child: CircularProgressIndicator(color: Colors.black));
          } else if (st == Status.ERROR) {
            return Center(child: Text(state.errorText));
          } else if (st == Status.SUCCESS) {
            var c = state.country;
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: index.toString(),
                    child: Text(c.emoji, style: const TextStyle(fontSize: 70, decoration: TextDecoration.none)),
                  ),
                  Text(c.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Currency:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                            const SizedBox(height: 5),
                            Text(c.currency, style: const TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Capital:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                            const SizedBox(height: 5),
                            Text(c.capital, style: const TextStyle(fontSize: 18), overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
