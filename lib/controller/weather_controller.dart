import 'dart:convert';

import 'package:get/get.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  final weatherRecord = Weather().obs;
  Future fetchWeatherDetails(var city) async {
    try {
      isLoading(true);
      var weatherResponse = await GetWeather().getWeather(city);
      if (weatherResponse != null) {
        weatherRecord.value = weatherResponse;
      }
    } finally {
      isLoading(false);
    }
  }
}
