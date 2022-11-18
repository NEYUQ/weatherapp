// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/global_controller.dart';
import 'package:weatherapp/widgets/Header.dart';
import 'package:weatherapp/widgets/current_weather.dart';
import 'package:weatherapp/widgets/hourly_data_widget.dart';

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
              ? const Center(
                  child: CircularProgressIndicator(),
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
                              .getHourlyWeather())
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
