# Fizz buzz in Dart

> [From Wikipedia](https://en.wikipedia.org/wiki/Fizz_buzz): Fizz buzz is a group word game for children to teach them about division. Players take turns to count incrementally,
> replacing any number divisible by three with the word "fizz", and any number divisible by five with the word "buzz".

It is also a popular drinking game, but Wikipedia mentions this only by links in the references.

Turn 1 to 15 in Fizz buzz would play out as follows:

```
1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
```

This is of course a trivial programming problem, but one with interesting properties and multiple approaches.

This project contains a small interactive game (`src/game.dart`), different types of algorithms (`src/fizzbuzz.dart`) and some benchmarking code for said algorithms (`src/perf.dart`).

This project also contains property based tests (`src/test.dart`).
These tests cover the full specification of fizz buzz&mdash; _because why not_.

Oh&mdash; and if you ever wanted to print the table of results to an arbitrarily long fizz buzz game, then you can do that too (check out `src/table.dart`).
