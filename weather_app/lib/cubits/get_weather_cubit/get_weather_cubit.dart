import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherInitialState());
  WeatherModel? weatherrmodel;
  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherrmodel =
          await WeatherService(dio: Dio()).getWeatherInfo(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherrmodel!));
    } catch (e) {
      emit(WeatherFaluireState());
    }
  }
}
