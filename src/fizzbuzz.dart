/** Defines a function which solves for the result of a turn of FizzBuzz. */
typedef String FizzBuzzSolver(int turn);

/** Gets the FizzBuzz result for the given turn. */
FizzBuzzSolver getFizzBuzzResult = solveNullCoalescingInline;

/** Iterates results of fizz buzz turns (forever). */
Iterable<String> listFizzBuzzResults([int start = 1]) sync* {
  for (var turn = start;; turn++) {
    yield getFizzBuzzResult(turn);
  }
}

/** The FizzBuzz algorithm which describes "the FizzBuzz problem" the best */
String solveWithBranching(int turn) {
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
String solveWithConcat(int turn) {
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
String solveNullCoalescing(int turn) {
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
String solveNullCoalescingInline(int turn) =>
    (turn % 15 == 0 ? "FizzBuzz" : null) ??
    (turn % 3 == 0 ? "Fizz" : null) ??
    (turn % 5 == 0 ? "Buzz" : null) ??
    turn.toString();
