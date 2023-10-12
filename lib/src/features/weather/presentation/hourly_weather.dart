import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/features/weather/application/providers.dart';
import 'package:weather_app/src/features/weather/domain/weather/weather_data.dart';
import 'package:weather_app/src/features/weather/presentation/weather_icon_image.dart';

class HourlyWeather extends ConsumerWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(hourlyWeatherProvider);

    return forecastDataValue.when(
      data: (forecastData) {
        final items = [0, 8, 16, 24, 32];
        return HourlyWeatherRow(
          weatherDataItems: [
            for (var i in items) forecastData.list[i],
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Text(e.toString()),
    );
  }
}

class HourlyWeatherRow extends StatelessWidget {
  final List<WeatherData> weatherDataItems;

  const HourlyWeatherRow({
    Key? key,
    required this.weatherDataItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weatherDataItems
          .map((data) => HourlyWeatherItem(
                weatherData: data,
              ))
          .toList(),
    );
  }
}

class HourlyWeatherItem extends StatelessWidget {
  final WeatherData weatherData;

  const HourlyWeatherItem({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final temp = weatherData.temp.celsius.toInt().toString();

    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            DateFormat.E().format(weatherData.date),
            style: textTheme.bodySmall!.copyWith(
              fontWeight: fontWeight,
            ),
          ),
          const SizedBox(height: 8),
          WeatherIconImage(
            iconUrl: weatherData.iconUrl,
            size: 48,
          ),
          const SizedBox(height: 8),
          Text(
            '$temp°',
            style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
