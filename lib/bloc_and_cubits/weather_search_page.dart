

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/bloc_and_cubits/bloc/weather_bloc.dart';
import 'package:learn_flutter/bloc_and_cubits/cubit/weather_cubit.dart';
// import 'package:learn_flutter/bloc_and_cubits/cubit/weather_cubit.dart';
// import 'package:learn_flutter/bloc_and_cubits/cubit/weather_state.dart';
import 'package:learn_flutter/bloc_and_cubits/data/models/weather.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        /*child: BlocConsumer<WeatherCubit, WeatherState>( //BlocProvider can also be used but it doesn't have listener, which will listen to the changes and will let to do operations that cannot be done during building (like navigating, showing snackbar...etc)
          listener: (context, state){
            if(state is WeatherError){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.message}')));
            }
          },

          builder: (context, state){
            if(state is WeatherInitial){
             return buildInitialInput();
            }else if(state is WeatherLoading){
               return buildLoading();
            }else if (state is WeatherLoaded){
              return buildColumnWithData(state.weather);
            }else{
              return buildInitialInput();
            }
          },*/

        child: BlocConsumer<WeatherBloc, WeatherBlocState>(
          listener: (context, state){
            if(state is WeatherError){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.message}')));
            }
          },

          builder: (context, state){
            if(state is WeatherBlocInitial){
             return buildInitialInput();
            }else if(state is WeatherLoading){
               return buildLoading();
            }else if (state is WeatherLoaded){
              return buildColumnWithData(state.weather);
            }else{
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureInCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {

         //---------------------for cubit------------------------------------------
          // context.read<WeatherCubit>().getWeather(cityName);
                //or
        // BlocProvider.of<WeatherCubit>(context).getWeather(cityName);

        //---------------------for bloc only---------------------------------
       final weatherBloc = context.read<WeatherBloc>();
       weatherBloc.add(GetWeather(cityName)); //adds the event
  }
}