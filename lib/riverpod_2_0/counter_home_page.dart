import 'package:flutter/material.dart';
import 'package:learn_flutter/riverpod_2_0/counter_page.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),
        child: const Text('GoTo Counter Page'),
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterPage() ));
        },
      ),
    );
  }
}