

import 'package:riverpod/riverpod.dart';

//a simple example
final myStringProvider = Provider((ref) => 'Hello world');

//even though the declaration is global, the state provided is not global , just like a class declaration which is global but its instances or objects are not
//which is good for maintainability and testability of the app