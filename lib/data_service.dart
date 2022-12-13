import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_tracker/weather.dart';

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
      final queryParameters = {
        'q': cityName,
        'appid': '4c5506fb7a3e6ca8926972b01aa0401d',
        'units': 'metric'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('failed to load weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
