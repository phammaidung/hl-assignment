import 'dart:io';

List<int> inputArray() {
  final List<int> array = [];
  for (int i = 0; i < 5; i++) {
    int? numInput = int.parse(stdin.readLineSync()!);
    array.add(numInput);
  }
  return array;
}
