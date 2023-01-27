import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  //private constructor allows us to create instances of AppDataBase only from within the AppDataBase class itself
  AppDatabase._();

  //Singleton instance
  static final AppDatabase _singleton = AppDatabase._();

  //Singleton accessor
  static AppDatabase get instance => _singleton;

  //completer is used for transforming synchronous code  into asynchronous code (here it will hold futures)
  Completer<Database>? _dbOpenCompleter;


  Future<Database>? get database{
    if(_dbOpenCompleter == null){
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter?.future;
  }

  Future _openDatabase() async {
    //get a platform specific directory where user data can be persisted
    final appDocumentDir = await getApplicationDocumentsDirectory();

    //Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, 'demo.db');
    final database = await databaseFactoryIo.openDatabase(dbPath);
    //as soon as this line is executed any code awaiting for completer future will get executed
    _dbOpenCompleter?.complete(database);
  }
}


