part of 'country_cubit.dart';

class CountryState extends Equatable {
  const CountryState({
    required this.countries,
    required this.status,
    required this.errorText,
  });

  final List<Country> countries;
  final Status status;
  final String errorText;

  CountryState copyWith({
    List<Country>? countries,
    Status? status,
    String? errorText,
  }) =>
      CountryState(
        countries: countries ?? this.countries,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [countries, status, errorText];
}
