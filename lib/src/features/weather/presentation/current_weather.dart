import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Alexandria', style: textTheme.headlineMedium),
        const CurrentWeatherContents(),
      ],
    );
  }
}

class CurrentWeatherContents extends StatelessWidget {
  const CurrentWeatherContents({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.cloud, size: 120),
        Text('15', style: textTheme.displayMedium),
        Text('H:18° L:12°', style: textTheme.bodyMedium),
      ],
    );
  }
}
