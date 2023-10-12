import 'package:flutter/material.dart';
import 'package:weather_app/src/constants/app_colors.dart';
import 'package:weather_app/src/features/weather/presentation/city_search_box.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Spacer(),
              CitySearchBox(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
