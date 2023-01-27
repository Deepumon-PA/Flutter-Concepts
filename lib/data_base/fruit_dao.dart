
import 'package:learn_flutter/data_base/app_database.dart';
import 'package:learn_flutter/data_base/fruit.dart';
import 'package:sembast/sembast.dart';

class FruitDao {
  static const FRUIT_STORE_NAME = 'fruits';

  //A store with int keys and Map<String, dynamic> values.
  //This store acts like a persistent map, values of which are Fruit objects converted to map
  final _fruitStore = intMapStoreFactory.store(FRUIT_STORE_NAME); //think of store as some folder inside which demo.db is created

  //Private getter to shorten the amount of code needed to get the singleton instance of the opened database
  Future<Database> get _db async => await AppDatabase.instance.database!;

  Future insert(Fruit fruit) async {
    await _fruitStore.add(await _db, fruit.toMap());
  }

  Future update(Fruit fruit) async{
    final finder = Finder(filter: Filter.byKey(fruit.id));

    await _fruitStore.update(await _db, fruit.toMap(), finder: finder);
  }

  Future delete(Fruit fruit) async{
    final finder = Finder(filter: Filter.byKey(fruit.id));
        
        await _fruitStore.delete(await _db, finder: finder);
  }

  Future<List<Fruit>> getAllSortedByName() async{
    final Finder finder = Finder(sortOrders: [SortOrder('name')]);

    final recordSnapshots = await _fruitStore.find(await _db, finder: finder);

    return recordSnapshots.map((snapshot) {
        final fruit = Fruit.fromMap(snapshot.value);
        fruit.id = snapshot.key;
        return fruit;
    }).toList();
  }
}