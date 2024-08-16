import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:whether_app/models/weather_data_model.dart';

class ApiServices {
  static const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;
  ApiServices({required this.apiKey});
  //get weather data by given city
  Future<WeatherModel> getWeatherByCity(String cityname) async {
    try {
      String url = "$baseUrl?q=$cityname&appid=$apiKey&units=metric";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final WeatherModel weather =
            WeatherModel.fromJson(jsonDecode(response.body));
        return weather;
      } else {
        throw Exception("Fail to fetch data");
      }
    } catch (err) {
      throw Exception("something went wrong " + err.toString());
    }
  }

  //get weather by current location
  // Future<WeatherModel> getWeatherByCurrentLocation() async {
  //   try {} catch (err) {}
  // }
}
