import 'package:weather_app/src/features/weather/application/temperature_extension.dart';
import 'package:weather_app/src/features/weather/domain/weather/weather.dart';

/// Derived model class used in the UI
class WeatherData {
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String description;
  final DateTime date;
  final String icon;

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";

  String get highAndLowTemperature => 'H:${maxTemp.witDegree} L:${maxTemp.witDegree}°';

  WeatherData({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
  });

  factory WeatherData.from(Weather weather) {
    return WeatherData(
      temp: weather.weatherParams.temp,
      minTemp: weather.weatherParams.tempMin,
      maxTemp: weather.weatherParams.tempMax,
      description: weather.weatherInfo[0].main,
      date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
      icon: weather.weatherInfo[0].icon,
    );
  }
}
