# Flutter Weather App Example

An example Flutter weather app using the [OpenWeatherMap API](https://openweathermap.org/api).

inspired
by [Andrea Bizzotto](https://github.com/bizz84) [open_weather_example_flutter](https://github.com/bizz84/open_weather_example_flutter)

<img src="https://github.com/ahmeddhus/weather_app/blob/update_readme/.github/images/weather-forecast.png?raw=true" alt="Flutter Weather App Preview" width=50% height=50%>

## [Application layers](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction)

- [Data Layer](https://codewithandrea.com/articles/flutter-app-architecture-domain-model/)
  with [Repository patter](https://codewithandrea.com/articles/flutter-repository-pattern/)
- [Application Layer](https://codewithandrea.com/articles/flutter-app-architecture-application-layer/)
- [Presentation Layer](https://codewithandrea.com/articles/flutter-presentation-layer/)
-

## Packages in use

- [riverpod](https://pub.dev/packages/riverpod) for state management
- [freezed](https://pub.dev/packages/freezed) for code generation
- [http](https://pub.dev/packages/http) for talking to the REST API
- [cached_network_image](https://pub.dev/packages/cached_network_image) for caching images
- [mocktail](https://pub.dev/packages/mocktail) for testing

for more about architecture:

- [Flutter App Architecture with Riverpod: An Introduction](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction)
- [Flutter Project Structure: Feature-first or Layer-first?](https://codewithandrea.com/articles/flutter-project-structure/)
- [A Comparison of Popular Flutter App Architectures](https://codewithandrea.com/articles/comparison-flutter-app-architectures/)

**Note**: to use the API you'll need to register an account and obtain your own API key. This can be
set via `--dart-define` or inside `lib/src/api/api_keys.dart`.
