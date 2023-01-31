import 'package:bloc/bloc.dart';
import 'package:learn_flutter/bloc_and_cubits/data/weather_repository.dart';
import 'package:learn_flutter/bloc_and_cubits/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial()); //initial state is passed in the super constructor

  Future<void> getWeather(String cityName) async {
    try{
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException{
      emit(WeatherError('Oops! Check your internet connection'));
    }
  }
}
