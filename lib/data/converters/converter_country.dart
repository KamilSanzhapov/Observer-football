import 'package:football_explorer/domain/models/country.dart';

import '../network/country/country_response.dart';

List<Country> fromCountryResponse(List<CountryResponse> countriesResponse) {
  if (countriesResponse == null || countriesResponse.isEmpty) return [];
  var list = countriesResponse.map((countryResponse) {
    return Country(
        id: countryResponse.country_id,
        name: countryResponse.country_name,
        logo: countryResponse.country_logo);
  }).toList();
  return list;
}
