import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_flutter/bloc_and_cubits/data/models/weather.dart';
import 'package:learn_flutter/bloc_and_cubits/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherBlocState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherBlocInitial());

  @override
  Stream<WeatherBlocState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      try {
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkException {
        yield WeatherError("Oops couldn't tech the weather");
      }
    }
  }
}

 /* WeatherBloc(this.weatherRepository) : super(WeatherBlocInitial()) {
    on<WeatherEvent>((event, emit) {

    });
  }
}*/
