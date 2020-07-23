import "dart:io";
import "dart:math";

import "fizzbuzz.dart";

const DEFAULT_TURN_COUNT = 25;

/** If true, the player starts (and then plays on odd rounds). */
final bool playerStarts = Random().nextBool();

int main(List<String> args) {
  final turnCount = args.isEmpty ? DEFAULT_TURN_COUNT : int.parse(args.single);

  printInstructions(turnCount);

  for (var turn = 1; turn <= turnCount;) {
    writeTurnNumber(turn, turnCount);

    if (isPlayerTurn(turn)) {
      final response = findPlayerResponse(turn);

      if (response == null) {
        continue;
      }

      final expected = getFizzBuzz(turn);

      if (response != expected) {
        printWrongResponse(expected, response);
        printLossInfo(turn, turnCount);

        return 1;
      }
    } else {
      writeFizzBuzz(turn);
    }

    turn++;
  }

  printWinInfo();

  return 0;
}

bool isPlayerTurn(int turn) => playerStarts == turn.isOdd;

printInstructions(int turnCount) {
  print("We each take turns, playing FizzBuzz.");
  print("");
  print(" - Answer with a number, fizz (or f), buzz (b), or fizzbuzz (fb)");
  print(" - If your answer is garbage, you can try again");
  print(" - If your answer is wrong, you lose, and the program exits with 1");
  print(" - If you get all answers right, the program exits with 0");
  print("");
  print("We're playing $turnCount turns in total.");
  print(isPlayerTurn(1)
      ? "You're starting ..."
      : "Looks like I'm starting this time:");
  print("");
}

printWrongResponse(String expected, String response) {
  print("");
  print("That's not right ...");
  print("You were supposed to say: $expected");
  print("But you said '$response' instead.");
}

printLossInfo(int turn, int turnCount) {
  print("");
  print("So, OK! You lost.");
  print("But you got to turn $turn/$turnCount.");
  print("");
  print("Bye!");
  print("");
}

printWinInfo() {
  print("\nThat's Numberwang!\n");
}

String findPlayerResponse(int turn) => parseResponse(stdin.readLineSync());

void writeTurnNumber(int turn, int max) {
  stdout.write(turn.toString().padLeft(max.toString().length));
  stdout.write(" : ");
}

void writeFizzBuzz(int turn) => print(getFizzBuzz(turn));

String parseResponse(String input) {
  final value = input.toLowerCase().trim();

  switch (value) {
    case "fizzbuzz":
    case "fb":
      return "FizzBuzz";
    case "fizz":
    case "f":
      return "Fizz";
    case "buzz":
    case "b":
      return "Buzz";
    default:
      return int.tryParse(value)?.toString();
  }
}
