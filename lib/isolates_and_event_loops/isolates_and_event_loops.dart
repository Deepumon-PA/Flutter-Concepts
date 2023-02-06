
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class IsolatesAndEventLoops {

  void someFunction(){
    var port = ReceivePort(); ///will start listening to the task we are performing using isolate
    Isolate.spawn(someEnormousTask, port.sendPort);
  }


  void someEnormousTask(SendPort sendPort){

  }


}

///Async programming in dart ============ Foundation
///An isolate is a separate execution context with it's own memory heap and event loop
///isolate is where all dart code runs in, ie in a private chunk of memory running on an event loop and processes events
///each thread is in it's own isolate with it's own memory
///many apps need a single isolate but we can have more
///go for a separate isolate if you have an enormous operation to perform on the main isolate


