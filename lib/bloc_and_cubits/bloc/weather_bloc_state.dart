part of 'weather_bloc.dart';

@immutable
abstract class WeatherBlocState {
  const WeatherBlocState();
}

class WeatherBlocInitial extends WeatherBlocState {
  const WeatherBlocInitial();
}

class WeatherLoading extends WeatherBlocState{
  const WeatherLoading();
}

class WeatherLoaded extends WeatherBlocState{
  final Weather weather;
  const WeatherLoaded(this.weather);

  ///overriding equality, which is important when using blocs, 'freese' is a package available to automatically avoid the boilerplate
  ///otherwise bloc won't be able to emit two states one after the other
  @override
  bool operator ==(Object o) {
    if(identical(this, o)) return true;
    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;

}

class WeatherError extends WeatherBlocState{
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
