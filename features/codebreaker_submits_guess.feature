Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers.
  The game marks the guess with + and - signs.

  For each number in the guess that matches the number and position of a number
  in the secret code, the mark includes one + sign. For each number in the guess
  that matches the number but not the position of a number in the secret code,
  the mark includes one - sign.

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

  # the RSpec book suggests using keyword Scenarios instead of Examples (p.50)
  Examples: no matches
    | code | guess | mark |
    | 1234 | 5555 |
    |
  Examples: 1 number correct
    | code | guess | mark |
    | 1234 | 1555 | +
    | 1234 | |
  2555 | -
  |
  Examples: 2 numbers correct
    | code | guess | mark |
    | 1234 | 5254 | ++
    | 1234 | |
    | 1234 | 5154 | +-
    |
  2545 | --
  |
  Examples: 3 numbers correct
    | code | guess | mark |
    | 1234 | 5234 | +++ |
    | 1234 | 5134 | ++- |
    | 1234 | 5124 | +-- |
    | 1234 | 5123 | --- |


  Examples: all 4 numbers correct
    | code | guess | mark |
    | 1234 | 1234 | ++++ |
    | 1234 | 1243 | ++-- |
    | 1234 | 1342 | +--- |
    | 1234 | 4321 | ---- |

