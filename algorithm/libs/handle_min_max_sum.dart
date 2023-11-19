/* The basic solution is putting given array to a queue,
then the last element which is stored in temporary variable is removed from queue.
That removed value will be implemented again in the first position of the queue, 
after the four remaining values are summed and added into a new array.

Continue working similarlly likes that until all elements of the given array are looped.
Sort the result array stored the summed values as ascending list,
then minnimum and maximum of sum are the first and last values in the result array respectively. 

*/

import 'dart:collection';

void handleMinMaxOfSumInteger(List<int> arr) {
  final sumList = [];
  final fourArr = new Queue.from(arr);

  for (int i = 0; i < fourArr.length; i++) {
    final temp = fourArr.last;
    fourArr.removeLast();
    final sum = fourArr.reduce((value, element) =>
        value + element); //summing four remaining elements in array
    sumList.add(sum);
    fourArr.addFirst(temp);
  }

  sumList.sort();

  ///by default, array is sorted as ascending. So, the first and the last elements are minimun and maximum values respectively.
  print("${sumList.first} ${sumList.last}");
}
