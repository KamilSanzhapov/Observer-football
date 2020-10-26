
import 'package:football_explorer/data/converters/converter_country.dart';
import 'package:football_explorer/domain/models/country.dart';

import '../network/api_service.dart';

class CountryRepository {
  static Future<List<Country>> getCountries() async {
    final api = ApiService.create();
    var list = await api.getCountries();
    return fromCountryResponse(list);
  }
}
