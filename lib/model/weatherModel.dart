import 'dart:convert';

class Weather {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  String? cityName;
  double? wind;

  Weather(
      {this.cityName,
      this.feelsLike,
      this.humidity,
      this.pressure,
      this.temp,
      this.tempMax,
      this.tempMin,
      this.wind});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    tempMax = json["main"]["temp_max"];
    tempMin = json["main"]["temp_min"];
    feelsLike = json["main"]["feels_like"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    wind = json["wind"]["speed"];
  }
}
