import "dart:io";
import "dart:math";

import "fizzbuzz.dart";

/* 
Properties of the fizz buzz problem:
- "FizzBuzzers": Numbers divisble by both 3 and 5 must return "FizzBuzz"
- "Fizzers": Numbers divisible by 3 (and not 5) must return "Fizz"
- "Buzzers": Numbers divisible by 5 (and not 3) must return "Buzz"
- "Other numbers": All other numbers numbers are stringified
*/

const SAMPLE_COUNT = 250000;

const algorithms = const {
  "branching": checkWithBranching,
  "concat": checkWithConcat,
  "nullCoalescing": checkNullCoalescing,
  "nullCoalescingInline": checkNullCoalescingInline
};

void main() {
  print(
      "Testing ${algorithms.length} algorithms with $SAMPLE_COUNT random samples for each test.");

  final stopwatch = Stopwatch()..start();

  algorithms.forEach((name, algo) {
    stopwatch.reset();

    stdout.write("- '$name'");

    test(algo, fizzers(), (n) => "Fizz");
    test(algo, buzzers(), (n) => "Buzz");
    test(algo, fizzBuzzers(), (n) => "FizzBuzz");
    test(algo, otherNumbers(), (n) => n.toString());

    stdout.writeln(" - PASSED in ${stopwatch.elapsedMilliseconds} ms.");
  });
}

Iterable<int> yieldRandom() sync* {
  final random = Random();

  while (true) {
    yield random.nextInt(100000000);
  }
}

Iterable<int> fizzers() => yieldRandom().where((i) => i % 3 == 0 && i % 5 != 0);

Iterable<int> buzzers() => yieldRandom().where((i) => i % 5 == 0 && i % 3 != 0);

Iterable<int> fizzBuzzers() =>
    yieldRandom().where((i) => i % 5 == 0 && i % 3 == 0);

Iterable<int> otherNumbers() =>
    yieldRandom().where((i) => i % 5 != 0 && i % 3 != 0);

void test(Function(int) alg, Iterable<int> range, Function(int) exp) {
  for (var n in range.take(SAMPLE_COUNT)) {
    final String result = alg(n);
    final expected = exp(n);

    if (result != expected) {
      throw Exception("Expected '$expected' for '$n'. Received: '$result'");
    }
  }
}
