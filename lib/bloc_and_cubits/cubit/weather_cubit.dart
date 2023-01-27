import 'package:bloc/bloc.dart';
import 'package:learn_flutter/bloc_and_cubits/ui_and_other/weather_repository.dart';
import 'package:learn_flutter/bloc_and_cubits/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {

    try{
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException{
      emit(WeatherError('Network error'));
    }

  }
}
