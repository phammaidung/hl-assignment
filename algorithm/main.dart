import 'libs/handle_min_max_sum.dart';

void main() {
  final time = Stopwatch()..start();
  handleMinMaxOfSumInteger();
  print(time.elapsed.inMicroseconds);
}
