import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/bloc_and_cubits/data/models/weather.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState{
  const WeatherLoading();

}

class WeatherLoaded extends WeatherState{
  final Weather weather;
  const WeatherLoaded(this.weather);

  ///overriding equality, which is important when using blocs, 'freezed' is a package available to automatically avoid the boilerplate
  ///otherwise bloc won't be able to emit two states one after the other
  @override
  bool operator ==(Object o) {
    if(identical(this, o)) return true;
    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;

}

class WeatherError extends WeatherState{
  final String message;
  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if(identical(this, o)) return true;
    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
