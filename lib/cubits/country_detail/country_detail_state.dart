part of 'country_detail_cubit.dart';

class CountryDetailState extends Equatable {
  const CountryDetailState({
    required this.country,
    required this.status,
    required this.errorText,
  });

  final CountryDetail country;
  final Status status;
  final String errorText;

  CountryDetailState copyWith({
    CountryDetail? country,
    Status? status,
    String? errorText,
  }) =>
      CountryDetailState(
        country: country ?? this.country,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [country, status, errorText];
}
