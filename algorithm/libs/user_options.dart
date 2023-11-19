import 'dart:io';

import 'handle_min_max_sum.dart';
import 'input_array.dart';

List<List<int>> givenArrays = [
  [1, 2, 3, 4, 5],
  [586, 111, 333, 777, 459],
  [23, 2, 2, 2, 2],
  [565867, 68, 8608, 3752, 0],
];

void userOptions() {
  try {
    print(
        "Please choose an option by typing following number: \n1. Use given array \n2. Type values manually");
    int key = int.parse(stdin.readLineSync()!);
    switch (key) {
      case 1:
        {
          print(
              'Choose an array from this list: \n1. ${givenArrays[0]} \n2. ${givenArrays[1]} \n3. ${givenArrays[2]} \n4. ${givenArrays[3]}');
          int subKey = int.parse(stdin.readLineSync()!);
          switch (subKey) {
            case 1:
              {
                handleMinMaxOfSumInteger(givenArrays[0]);
                break;
              }
            case 2:
              {
                handleMinMaxOfSumInteger(givenArrays[1]);
                break;
              }
            case 3:
              {
                handleMinMaxOfSumInteger(givenArrays[2]);
                break;
              }
            case 4:
              {
                handleMinMaxOfSumInteger(givenArrays[3]);
                break;
              }
          }
        }
      case 2:
        {
          handleMinMaxOfSumInteger(inputArray());
          break;
        }
    }
  } catch (e) {
    print("Input is invalid. Please try again.");
    userOptions();
  }
}
