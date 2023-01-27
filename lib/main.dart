import 'package:flutter/material.dart';
import 'package:learn_flutter/bloc_and_cubits/ui_and_other/weather_repository.dart';
import 'package:learn_flutter/bloc_and_cubits/ui_and_other/weather_search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/bloc_and_cubits/cubit/weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(FakeWeatherRepository()),
        child: const MyHomePage(title: 'Learn Flutter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
    /// riverpod

        title: Text(widget.title),
      ),
      body: WeatherSearchPage(),
    );
  }
}

///what makes Riverpod stand out of all other competitors
/// easy of use ,clean coding practise, complete independence from flutter (great for testing), compile time safety and performance optimization
