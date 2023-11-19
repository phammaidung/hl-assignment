# Mini-Max Sum Of Integer Array

## Requirements

This project solves the problem in [hl-assignment: algorithm](https://github.com/hl-solutions/hl-assignment/tree/master/algorithm)

## Explain Algorithm

The basic solution is putting given array to a queue, then the last element which is stored in temporary variable is removed from queue. That removed value will be implemented again in the first position of the queue, after the four remaining values are summed and added into a new array.

Continue working similarlly likes that until all elements of the given array are looped. Sort the result array stored the summed values as ascending list, then minnimum and maximum of sum are the first and last values in the result array respectively.

It contains:

- Allow user to choose given input array or typing input values manually. This feature is displayed at [user_options.dart](./libs/user_options.dart)

- Type input values manually. This feature is displayed at [input_array.dart](./libs/input_array.dart)

- Calculate mini - max sum 4 of 5 integer numbers in the given array. This feature is displayed at [handle_min_max_sum.dart](./libs/handle_min_max_sum.dart)

## Technology

- Dart

## Installation

To run the tests, follow these steps. You must have at least DartSDK or FlutterSDK installed.

First clone the repository:

```
git clone https://github.com/phammaidung/hl-assignment.git
```

Move into the algorithm directory

```
cd algorithm/
```

Run tests

```
dart run main.dart
```

(You can also run by F5 or Ctrl+F5)
