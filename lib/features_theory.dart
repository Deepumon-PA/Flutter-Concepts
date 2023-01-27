
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
