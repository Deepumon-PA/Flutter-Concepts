
/// Functions that can produce multiple values
/// can do it either synchronously or asynchronously
/// 'Sync' will have a return type of Iterable<int> (Single value: int)
/// 'Async' will have a return type of Stream<int> (Single value: Future<int>)
///async generators: values will be produced or generated right away,
///rarely used