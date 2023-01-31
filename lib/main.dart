import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/bloc_and_cubits/bloc/weather_bloc.dart';
import 'package:learn_flutter/bloc_and_cubits/data/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/riverpod_2_0/counter_home_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
        // create: (context) => WeatherCubit(FakeWeatherRepository()), //for bloc with cubit
        create: (context) => WeatherBloc(FakeWeatherRepository()), //for bloc only
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
      // body: WeatherSearchPage(), //Learn Bloc and Cubit
      body: CounterHome(), //Learn RiverPod
    );
  }
}

///what makes Riverpod stand out of all other competitors
/// easy of use ,clean coding practise, complete independence from flutter (great for testing), compile time safety and performance optimization
