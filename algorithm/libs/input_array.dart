import 'dart:io';

List<int> inputArray() {
  final List<int> array = [];
  try {
    for (int i = 0; i < 5; i++) {
      print("Please type element ${i + 1}: ");
      int? numInput = int.parse(stdin.readLineSync()!);
      array.add(numInput);
    }
  } catch (e) {
    print("Input value is invalid. Please type an integer.");
    inputArray();
  }
  return array;
}
