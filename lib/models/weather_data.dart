import 'package:weatherapp/models/weather_data_current.dart';
import 'package:weatherapp/models/weather_data_daily.dart';
import 'package:weatherapp/models/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurren? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([
    this.current,
    this.hourly,
    this.daily,
  ]);

  WeatherDataCurren getCurrentWeather() => current!;

  WeatherDataHourly getHourlyWeather() => hourly!;

  WeatherDataDaily getDailyWeather() => daily!;
}
