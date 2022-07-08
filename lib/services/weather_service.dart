import 'package:get/get.dart';
import 'package:weather_app/Utils/const.dart';
import 'package:weather_app/model/weatherModel.dart';

class GetWeather extends GetConnect {
  Future getWeather(city) async {
    var url = APISConfig().Base_URL +
        'weather?' +
        'q=' +
        city +
        '&appid=379d7d8e337f56359e378d0ebceeb216&units=metric';
    var response = await get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var urlResponse = Weather.fromJson(jsonString);
      var ulssresponse = urlResponse;
      return urlResponse;
    } else {
      return null;
    }
  }
}
