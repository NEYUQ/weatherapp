// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/global_controller.dart';
import 'package:weatherapp/widgets/Header.dart';
import 'package:weatherapp/widgets/comfort_level.dart';
import 'package:weatherapp/widgets/current_weather.dart';
import 'package:weatherapp/widgets/hourly_data_widget.dart';

import '../utils/custom_colors.dart';
import '../widgets/daily_data_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController _globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => _globalController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/clouds.png",
                        height: 200,
                        width: 200,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      const HeaderWidget(),
                      CurrentWeatherWidget(
                        weatherDataCurren: _globalController
                            .getWeatherData()
                            .getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      HourlyDataWidget(
                        weatherDataHourly: _globalController
                            .getWeatherData()
                            .getHourlyWeather(),
                      ),
                      DailyDataForecast(
                        weatherDataDaily: _globalController
                            .getWeatherData()
                            .getDailyWeather(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ComfortLevel(
                          weatherDataCurren: _globalController
                              .getWeatherData()
                              .getCurrentWeather())
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
