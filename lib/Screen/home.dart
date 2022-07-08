import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherController weatherController = Get.put(WeatherController());
  String? newLocation;
  List<String> _locations = [
    'Please choose a location',
    'Kuala Lumpur',
    'Klang',
    'Ipoh',
    'Seberang Perai',
    'Johor Bahru	',
    'Subang Jaya	',
    'George Town',
    'Padawan',
    'Petaling Jaya	',
    'Kuantan',
    'Selayang',
    'Iskandar Puteri	',
    'Kota Bharu',
    'Shah Alam	',
    'Kota Kinabalu	',
    'Malacca City	',
    'Seremban',
    'Sandakan',
    'Kuching',
    'Kajang',
    'Kulim',
    'Kuala Terengganu',
    'Miri',
    'Sungai Petani	',
    'Manjung'
        'Taiping',
    'Alor Setar',
    'Kubang Pasu',
    'Kuala Langat',
    'Lahad Datu',
    'Sibu',
    'Hulu Selangor',
    'Kluang',
    'Kemaman',
    'Temerloh',
    'Bintulu',
    'Batu Pahat',
    'Muar',
    'Ampang Jaya',
    'Tawau',
    'Penampang',
    'Keningau',
    'Kulai',
    'Kuala Selangor',
    'Kangar'
        'Alor Gajah',
    'Pasir Mas',
    'Kinabatangan',
    'Sepang',
    'Ketereh'
  ];
  String _selectedLocation = 'Please choose a location';
  @override
  void initState() {
    weatherController.fetchWeatherDetails(' kuala lumpur');
    // TODO: implement init
    // State
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 100,
        ),
        child: Obx(
          () => weatherController.isLoading.value
              ? const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    height: 50,
                    width: 50,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                          ),
                          DropdownButton(
                            value: _selectedLocation,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation = newValue.toString();
                                weatherController.fetchWeatherDetails(newValue);
                              });
                            },
                            items: _locations.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                          Text(
                            weatherController.weatherRecord.value.temp
                                .toString(),
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            weatherController.weatherRecord.value.cityName
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.thermostat,
                          color: Colors.blue,
                        ),
                        const Text(
                            "Min Temp ${weatherController.weatherRecord.value.tempMin.toString()}"),
                        Icon(
                          Icons.thermostat,
                          color: Colors.red,
                        ),
                        Text(
                            "Max Temp ${weatherController.weatherRecord.value.tempMax.toString()}"),
                      ],
                    ),
                    Text(
                        "Humidity : ${weatherController.weatherRecord.value.humidity.toString()}"),
                    Text(
                        "Wind Speed : ${weatherController.weatherRecord.value.wind.toString()}")
                  ],
                ),
        ),
      ),
    ));
  }
}
