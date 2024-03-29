import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/apis/fetch_weather.dart';
import 'package:weatherapp/models/weather_data.dart';

class GlobalController extends GetxController {
  GetView? f;
  //create various variable
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _cardIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission _locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    _locationPermission = await Geolocator.checkPermission();

    if (_locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
      if (_locationPermission == LocationPermission.denied) {
        return Future.error("location permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _cardIndex;
  }
}
