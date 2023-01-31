
///Blocs and Cubits
/// Directory cubit: contains cubit implementation
/// Directory bloc: contains bloc implementation
/// if you are strictly required to follow event based testing then you should go for bloc else go for cubit
/// state needs to override value equality both for cubit and bloc as dart by default only provides referential equality
///

/*
two classes for a cubit:

 1.state: to save the fields

 2.cubit: to control the states , perform logic

 */