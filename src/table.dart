import "dart:io";
import "dart:math";

import "fizzbuzz.dart";

const DEFAULT_TURN_COUNT = 150;
const CELL_DELIMITER = " ";

void main(List<String> args) {
  final turnCount = args.isEmpty ? DEFAULT_TURN_COUNT : int.parse(args.single);

  printTable(turnCount, listFizzBuzzResults().take(turnCount));
}

String tabularize(Iterable<String> items, int padding) =>
    items.map((val) => val.padLeft(padding)).join(CELL_DELIMITER);

void printTable(int turnCount, Iterable<String> results) {
  final padding = max(turnCount.toString().length - 1, 3);
  final List<String> lineItems = [];

  for (var value in results) {
    lineItems.add(value);

    if (value == "FizzBuzz") {
      stdout.writeln(tabularize(lineItems, padding));

      lineItems.clear();
    }
  }

  if (lineItems.length > 0) {
    stdout.writeln(tabularize(lineItems, padding));
  }
}
