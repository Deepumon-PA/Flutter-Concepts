
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



///Mixins
/*
 Mixins are used to re-use certain behaviours defined in other classes
 as opposed to extending classes (inheriting) we are not keeping  a class hierarchy here, rather just randomly implementing some behaviours defined in a mixin class
 we can implement any number of mixins for a class using 'with' keyword
 */
class MyMixin{
  void doSomething(){

  }
}

class MySecondMixin{
  void doSomeOtherThing(){

  }
}

class MyClass with MyMixin, MySecondMixin{
  @override
  void doSomeOtherThing() {
   super.doSomeOtherThing();
  }

  @override
  void doSomething() {
    super.doSomething();
  }
}


///Inherited widgets
/*
put it on top of the tree and we can get a reference to it in any widget below it
 */

class InheritedNose extends InheritedWidget{
  InheritedNose(this.asset, Widget child): super(child: child);
  final Image asset;
  //fields of inherited widgets are always immutable, for that reason, we can only replace an inherited widget field only by rebuilding the whole widget
  //it cannot be reassigned but can change internally for example if we have a service like
  //NoseService service, it can be accessed in the descendants and functions can be called on it



  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static InheritedNose of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedNose>() as InheritedNose;
}


//now
class MyNoseStatelessWidget extends StatelessWidget {

  const MyNoseStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nose = (context.dependOnInheritedWidgetOfExactType<InheritedNose>() as InheritedNose).asset;
    //the above line can be simplified in to the following as inherited widgets comes with  "of" function for easier access
    final nose1 = InheritedNose.of(context);
    return Container();
  }
}


///Trees and Using Keys
//keys preserve states when we move around a widget tree, for eg: scroll location or keeping state when modifying a collection
//Widget Tree -> Element Tree (Skeleton: holds information about type of widget and a reference to children elements)
//on build flutter will look at the element tree and try to match the type and state if any,
//different types of keys : Unique Key, Global Key, Value Key, Scroll Key..etc

//keys are mostly used to preserve states in a collection of same type of widgets
//Let's see how to preserve scroll position


///Styling and Theming
//Theme extensions feature will allow you to add your own theme classes to app theme


///Obfuscating code in flutter
//code obfuscation works only for release build
//flutter build apk --obfuscate --split-debug-info=/<project-name>/<directory>   //directory where flutter outputs debug files
//Once you’ve obfuscated your binary, save the symbols file. You need this if you later want to de-obfuscate a stack trace.

//to debug we need both symbol file and obfuscated stacktrace
//Provide both the stack trace (stored in a file) and the symbols file to the flutter symbolize command. For example:
//flutter symbolize -i <stack trace file> -d out/android/app.android-arm64.symbols

//the above command will compare both stacktrace info and symbol file and provide readable information, or stacktrace

//flutter symbolize -h to see more info

/*Code that relies on matching specific class, function, or library names will fail. For example, the following call to expect() will not work in an obfuscated binary:
content_copy
expect(foo.runtimeType.toString(), equals('Foo'));*/

///Size of the app
//flutter build apk --analyze-size : will give you size usage information
//reduce size by removing unwanted resources optimizing libraries and compressing image files like png and jpeg
//--split-debug-info will dramatically reduce code size
//ie use it like this flutter build apk --split-debug-info=/<project-name>/<directory>

///Build and release a web app
//flutter run -d chrome , this will build only the debug version of the app


//1.Handling images on the web
//Mostly "Image" (Image.asset, Image.network..etc) widget will do the job, if CORS(Cross Origin Resource Access) is required then HTML renderer will work fine but for canvaskit(As it allows fine grain control)
//need to add some configurations like Allow-Cross-Origin-Resource-Access...like that

//2.Choosing Web renderer
//Two web renders available are HTML and Canvaskit (more importance for  performance, ie it renders by  pixel level)
//if more importance to download size in mobile devices and performance in desktop devices , then select "auto
//Performance important in desktop and mobile: select "CanvasKit"
//Size important in desktop and mobile: select "HTML"

//3.Minification
//release build will have minified and tree shaking(removing unused functions) completed

//4.Building the app for release
//command: flutter build web (--web-renderer to specify the renderer to be used)
//Launch a web server (for example, python -m http.server 8000, or by using the dhttpd package),
// and open the /build/web directory. Navigate to localhost:8000 in your browser
// (given the python SimpleHTTPServer example) to view the release version of your app.

//5.Embedding a Flutter app into an HTML page
// You can embed a Flutter web app, as you would embed other content, in an iframe tag of an HTML file. In the following example, replace “URL” with the location of your HTML page:
//
// content_copy
// <iframe src="URL"></iframe>

//6.Deploying to the web
// When you are ready to deploy your app, upload the release bundle to Firebase, the cloud, or a similar service. Here are a few possibilities, but there are many others:
//
// Firebase Hosting
// GitHub Pages
// Google Cloud Hosting

///Type promotion
class UnreliableProvider {
  String? get maybeString => Random().nextBool() ? "This is a string!" : null;
  /* (Another) Example of Type Promotion with object properties within a class*/
  void someFunction(){
    String? maybeStringLocal = maybeString;

    if (maybeStringLocal is String) {
      print(maybeStringLocal.length);
    }
    else {
      print("it was null!");
    }
  }
}

void promotionMethod() {

  /* Type Promotion with General Type -> Specific Subtype */

  Object example = "Hello World";

  if (example is String) {
    // example promoted from Object -> String
    print(example.length);
  }
  else {
    print("it wasn't a string!");
  }

  /* Type Promotion with Nullable Type -> Non-nullable type */

  String? maybeNull = Random().nextBool() ? "This is a string!" : null;

  if (maybeNull is String) {
    // maybeNull promoted from String? -> String
    print(maybeNull.length);
  }
  else {
    print("oops, it was null");
  }


  UnreliableProvider provider = UnreliableProvider();

  /* Problem: Type Promotion not working with object properties */

  /* if (provider.maybeString is String) {
    print(provider.maybeString.length);
  }
  else {
    print("it wasn't a string!");
  } */

  /* SOLUTION: Type promotion working with object properties */

  String? maybeStringLocal = provider.maybeString;

  if (maybeStringLocal is String) {
    print(maybeStringLocal.length);
  }
  else {
    print("it wasn't a string!");
  }

}


///Widget Testing
void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    // Create the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

///'*' in async* means it is a generator function, ie it produces a sequence of values asynchronously, 'yield' can be used to emit values in this case