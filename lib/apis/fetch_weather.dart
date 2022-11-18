import 'dart:convert';
import 'package:weatherapp/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_data_current.dart';
import 'package:weatherapp/models/weather_data_hourly.dart';

import '../utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var reponse = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(reponse.body);
    weatherData = WeatherData(WeatherDataCurren.fromJson(jsonString), WeatherDataHourly.fromJson(jsonString));

    return weatherData!;
  }
}

