import 'dart:math';

import 'package:learn_flutter/bloc_and_cubits/weather.dart';

abstract class WeatherRepository{
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository{
  @override
  Future<Weather> fetchWeather(String cityName) {
   return Future.delayed(Duration(seconds: 1), (){
     final random = Random();

     if(random.nextBool()){
       throw NetworkException();
     }

     return Weather(
       cityName: cityName,
       temperatureInCelsius: 20+ random.nextInt(15) + random.nextDouble(),
     );
   });
  }

}

class NetworkException implements Exception{

}

