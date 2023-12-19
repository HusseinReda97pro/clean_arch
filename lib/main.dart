import 'package:clean_arch/core/services/services_locator.dart';
import 'package:clean_arch/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  // Weather weather = await GetWeatherByCountryName(
  //   WeatherRepository(
  //     remoteDataSource: RemoteDataSource(),
  //   ),
  // ).execute("egypt");
  //
  // print(weather);

  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies APP',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
