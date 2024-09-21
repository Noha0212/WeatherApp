import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  WeatherService({required this.dio});

  Future<WeatherModel> getWeatherInfo({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/v1/forecast.json?key=086ed7e5783c4f93aba113001240505&q=$cityName&days=1');
      WeatherModel weatherModell = WeatherModel.fromjson(response.data);
      return weatherModell;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Something went wrong';
      throw Exception(errorMessage);
    } on Exception catch (e) {
      log(e.toString());
      throw Exception('Something went wrong');
    }
  }
}
