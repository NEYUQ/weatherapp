import 'package:weatherapp/models/weather_data_current.dart';
import 'package:weatherapp/models/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurren? current;
  final WeatherDataHourly? hourly;

  WeatherData([this.current, this.hourly]);

  WeatherDataCurren getCurrentWeather() => current!;

  WeatherDataHourly getHourlyWeather() => hourly!;
}
