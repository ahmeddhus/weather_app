import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/features/weather/application/providers.dart';
import 'package:weather_app/src/features/weather/domain/weather/weather_data.dart';
import 'package:weather_app/src/features/weather/presentation/weather_icon_image.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataValue = ref.watch(currentWeatherProvider);
    final city = ref.watch(cityProvider);

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Alexandria', style: textTheme.headlineMedium),
        weatherDataValue.when(
          data: (data) => CurrentWeatherContents(weatherData: data),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text(e.toString()),
        ),
      ],
    );
  }
}

class CurrentWeatherContents extends StatelessWidget {
  final WeatherData weatherData;

  const CurrentWeatherContents({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final temp = weatherData.temp.celsius.toInt().toString();
    final minTemp = weatherData.minTemp.celsius.toInt().toString();
    final maxTemp = weatherData.maxTemp.celsius.toInt().toString();
    final highAndLow = 'H:$maxTemp° L:$minTemp°';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconUrl: weatherData.iconUrl, size: 120),
        Text(temp, style: textTheme.displayMedium),
        Text(highAndLow, style: textTheme.bodyMedium),
      ],
    );
  }
}
