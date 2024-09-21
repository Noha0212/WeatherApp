import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFaluireState extends WeatherState {}
