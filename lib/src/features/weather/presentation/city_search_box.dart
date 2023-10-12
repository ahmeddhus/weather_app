import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/constants/app_colors.dart';
import 'package:weather_app/src/constants/app_shapes.dart';
import 'package:weather_app/src/features/weather/application/providers.dart';

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({super.key});

  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchBoxState();
}

class _CitySearchBoxState extends ConsumerState<CitySearchBox> {
  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppShapes.radius),
                      bottomLeft: Radius.circular(AppShapes.radius),
                    ),
                  ),
                ),
                onSubmitted: (value) => ref.read(cityProvider.notifier).state = value,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              ref.read(cityProvider.notifier).state = _searchController.text;
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppShapes.radius),
                  bottomRight: Radius.circular(AppShapes.radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'search',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
