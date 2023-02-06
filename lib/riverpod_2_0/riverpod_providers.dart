

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider.autoDispose((ref) => 0);
//we want to be able to increment integer and basic provider is read only and cant be modified from the outside
//ie we want to modify this value from the outside

//autoDispose: if you want to dispose the state when removing the widget from the widget tree
// so after going back to home page and again coming back to the counter page the current state will be lost


abstract class WebSocketClient{
 Stream<int> getCounterStream([int start]);
}

class FakeWebSocketClient implements WebSocketClient{
  @override
  Stream<int> getCounterStream([int start = 0]) async* {
    int i = 0;
    while(true){
      await Future.delayed(const Duration(milliseconds: 500));
      yield i++;
    }
  }
}

final webSocketClientProvider = Provider<WebSocketClient>((ref) {
    return FakeWebSocketClient(); // repositories can be provided this way
});

//family : is used to pass value into the provider, first type parameter is the type of the provider and second parameter is the value passed in
final webCounterProvider = StreamProvider.family<int, int>((ref, start) {
  final wsClient = ref.watch(webSocketClientProvider);
  return wsClient.getCounterStream(start);
});