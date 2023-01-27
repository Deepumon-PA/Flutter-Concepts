
class Fruit{

  int? id; //will be gotten from the database, it's automatically generated & unique for each fruit

  final String name;
  final bool isSweet;

  Fruit({required this.name, required this.isSweet});

  //sembast store data as json strings(so we use maps)

   Map<String, dynamic> toMap(){
    return {
      'name': name,
      'isSweet': isSweet
    };
  }

  static Fruit fromMap(Map<String, dynamic> map){
     return Fruit(name: map['name'], isSweet: map['isSweet']);
  }
}