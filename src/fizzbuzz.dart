/** Gets the FizzBuzz result for the given turn. */
String getFizzBuzz(int turn) => checkNullCoalescingInline(turn);

/** Iterates results of fizz buzz turns (forever), starting from 1. */
Iterable<String> listFizzBuzzResults() sync* {
  for (var turn = 1;; turn++) {
    yield getFizzBuzz(turn);
  }
}

/** The FizzBuzz algorithm which describes "the FizzBuzz problem" the best */
String checkWithBranching(int turn) {
  if (turn % 3 == 0 && turn % 5 == 0) {
    return "FizzBuzz";
  } else if (turn % 3 == 0) {
    return "Fizz";
  } else if (turn % 5 == 0) {
    return "Buzz";
  }

  return turn.toString();
}

/** 
 * Arguably one of the worst "good solutions" to the problem: 
 * Create an empty string, and append to it. 
 */
String checkWithConcat(int turn) {
  var result = "";

  if (turn % 3 == 0) {
    result += "Fizz";
  }

  if (turn % 5 == 0) {
    result += "Buzz";
  }

  return result == "" ? turn.toString() : result;
}

/** 
 * A FizzBuzz solution which leverages the 
 * null-coalescing operator (??) in order to reduce branching.
 */
String checkNullCoalescing(int turn) {
  final fizzed = turn % 3 == 0 ? "Fizz" : null;
  final buzzed = turn % 5 == 0 ? "Buzz" : null;
  final both = (fizzed != null && buzzed != null) ? "FizzBuzz" : null;

  return both ?? fizzed ?? buzzed ?? turn.toString();
}

/** 
 * A FizzBuzz solution which leverages the 
 * null-coalescing operator (??) in order to reduce branching.
 * This solution does all checking in-line.
 */
String checkNullCoalescingInline(int turn) =>
    (turn % 15 == 0 ? "FizzBuzz" : null) ??
    (turn % 3 == 0 ? "Fizz" : null) ??
    (turn % 5 == 0 ? "Buzz" : null) ??
    turn.toString();
