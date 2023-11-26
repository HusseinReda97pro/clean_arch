import 'package:clean_arch/core/uitls/constants.dart';
import 'package:clean_arch/weather/data/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCityName(String cityName) async {
    try {
      var response = await Dio().get(
        '${Constants.baseUrl}/weather?q=$cityName&appid=${Constants.apiKey}',
      );

      if (response.statusCode == 200) {
        print(response.data);
        return WeatherModel.fromJson(response.data);
      } else {
        debugPrint(response.statusMessage);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
