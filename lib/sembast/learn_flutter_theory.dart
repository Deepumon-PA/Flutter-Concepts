

///Flutter architectural patterns

/*
  Bloc, Provider, Riverpod, get_it, blockProvider and many more
 */

//Flutter state management
//1. Ephemeral state: not needed throughout the app life cycle rather for a single widget, like bottom navigation index
//2. App state: state that is required throughout the application


///Inherited widgets
/*
  //creating an inherited widget
   MyTopWidget extends InheritedWidget{
   final String myValue;
   MyTopWidget({this.myValue, Widget child}) : super(child: child);

   @Override
   bool updateShouldNotify(InheritedWidget oldWidget) => true;

   static MyTopWidget of(BuildContext context) =>
       context.inheritFromWidgetOfExactType(MyTopWidget);
   }

   inheriting/accessing values of  'MyTopWidget'
   class MyChildWidget extends StatelessWidget {

   @Override
   Widget build(BuildContext context) {
   final value = MyTopWidget.of(context).myValue;
   }
   }



 */