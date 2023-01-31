

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider.autoDispose((ref) => 0);
//we want to be able to increment integer and basic provider is read only and cant be modified from the outside
//ie we want to modify this value from the outside

//autoDispose: if you want to dispose the state when removing the widget from the widget tree
// so after going back to home page and again coming back to the counter page the current state will be lost


abstract class WebSocketClient{
 Stream<int> getCounterStream();
}

class FakeWebSocketClient implements WebSocketClient{
  @override
  Stream<int> getCounterStream() async* {
    int i = 0;
    while(true){
      await Future.delayed(const Duration(milliseconds: 500));
      yield i++;
    }
  }
}

final webSocketClientProvider = Provider<WebSocketClient>((ref) {
    return FakeWebSocketClient();
});


final webCounterProvider = StreamProvider((ref) {
  final wsClient = ref.watch(webSocketClientProvider);
  return wsClient.getCounterStream();
});