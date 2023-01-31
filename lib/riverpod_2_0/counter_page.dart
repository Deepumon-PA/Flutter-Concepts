import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/riverpod_2_0/riverpod_providers.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    final AsyncValue<int> webCounter = ref.watch(webCounterProvider);

    ref.listen(counterProvider, (previous, next) {
      if (next >= 12) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Warning'),
                content: Text('count value shouldn\'t be greater than 13'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('close'))
                ],
              );
            });
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    ref.invalidate(counterProvider); //invalidate will reset the state to it's initial value
                    //refresh is also similar to invalidate , but it returns the state
                  },
                  icon: Icon(Icons.refresh),
                ),
                Text(
                  counter.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
                FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      ref.read(counterProvider.notifier).state++;
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
