import 'package:flutter/material.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherModel? weatherModel;
  const WeatherWidget(this.weatherModel,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getWeatherIcon((weatherModel?.weather?[0].main) ?? ""),
        const SizedBox(
          height: 8,
        ),
        Text(
          getTemp(weatherModel?.main?.temp ?? 0.0),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "${weatherModel?.name}",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Card(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildWeatherText("Weather :- ",
                    "${weatherModel?.weather?[0]?.main}"),
                buildWeatherText("Humidity :- ",
                    "${weatherModel?.main?.humidity}%"),
                buildWeatherText("Wind Speed :- ",
                    "${weatherModel?.wind?.speed}Km/h"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getWeatherIcon(String main) {
    switch (main) {
      case == "Clouds":
        return Image.asset(
          'assets/images/8.png',
          height: 200,
        );
      case == "Clear":
        return Image.asset(
          'assets/images/6.png',
          height: 200,
        );
      case == "Mist":
        return Image.asset(
          'assets/images/5.png',
          height: 200,
        );
      case == "Haze":
        return Image.asset(
          'assets/images/5.png',
          height: 200,
        );
      case == "Rain":
        return Image.asset(
          'assets/images/2.png',
          height: 200,
        );
      default:
        return Image.asset(
          'assets/images/7.png',
          height: 200,
        );
    }
  }

  Widget buildWeatherText(String key, String value) {
    return Row(
      children: [
        Text(
          key,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  String getTemp(num temp) {
    double temperature = temp - 273.15;
    return "${temperature.round()}°C";
  }
}
