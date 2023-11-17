import 'dart:collection';

import 'input_array.dart';

void handleMinMaxOfSumInteger() {
  List<int> arr = inputArray();
  //[5774e1, 5774e1, 5774e1, 5774e1, 5774e1];
  final sumList = [];
  final fourArr = new Queue.from(arr);

  for (int i = 0; i < fourArr.length; i++) {
    final temp = fourArr.last;
    fourArr.removeLast();
    final sum = fourArr.reduce((value, element) => value + element);
    sumList.add(sum);
    fourArr.addFirst(temp);
  }
  sumList.sort();
  print("${sumList.first} ${sumList.last}");
}
