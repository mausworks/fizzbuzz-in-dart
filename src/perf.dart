import "fizzbuzz.dart";

const DEFAULT_TURN_COUNT = 1000000;

const subjects = const {
  "branching": solveWithBranching,
  "concat": solveWithConcat,
  "nullCoalescing": solveNullCoalescing,
  "nullCoalescingInline": solveNullCoalescingInline
};

void main(List<String> args) {
  final turnCount = args.isEmpty ? DEFAULT_TURN_COUNT : int.parse(args.single);

  print("\nRunning FizzBuzz for $turnCount turns ...\n");

  subjects
      .map((name, subject) => MapEntry(name, measure(subject, turnCount)))
      .forEach(reportDelayed);
}

void reportDelayed(String name, Duration duration) async {
  await Future.delayed(duration); // Sleep sort, don't do this.
  print(
      "${name.padLeft(30)} : ${duration.inMilliseconds} ms or ${duration.inMicroseconds} µs");
}

Duration measure(Function subject, int turnCount) {
  final stopwatch = Stopwatch()..start();

  for (var turn = 1; turn <= turnCount; turn++) {
    subject(turn);
  }

  stopwatch.stop();

  return stopwatch.elapsed;
}
