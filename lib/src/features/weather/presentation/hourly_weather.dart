import 'package:flutter/material.dart';
import 'package:weather_app/src/features/weather/domain/weather.dart';

final List<Weather> weathers = [
  Weather('Thu', Icons.sunny_snowing, '14°'),
  Weather('Sun', Icons.cloudy_snowing, '11°'),
  Weather('Fri', Icons.sunny, '18°'),
  Weather('Sat', Icons.cloud, '12°'),
  Weather('Mon', Icons.cloudy_snowing, '12°'),
];

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weathers
          .map(
            (e) => HourlyWeatherItem(weather: e),
          )
          .toList(),
    );
  }
}

class HourlyWeatherItem extends StatelessWidget {
  final Weather weather;

  const HourlyWeatherItem({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;

    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            weather.day,
            style: textTheme.bodySmall!.copyWith(fontWeight: fontWeight),
          ),
          const SizedBox(height: 8),
          Icon(weather.icon, size: 47),
          const SizedBox(height: 8),
          Text(
            weather.degree,
            style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
