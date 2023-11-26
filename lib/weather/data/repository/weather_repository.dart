import 'package:clean_arch/weather/data/dataSource/remote_dataSource.dart';
import 'package:clean_arch/weather/domain/entities/weather.dart';
import 'package:clean_arch/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource remoteDataSource;
  WeatherRepository({required this.remoteDataSource});

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    return (await remoteDataSource.getWeatherByCityName(cityName))!;
  }
}
