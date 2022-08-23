Some debugging exercises that practised RSpec test writing and 
discovery debugging (printing out variables and enumerable
elements).

get_most_common_letter - original code sorted in ascending order
(which is not what is needed for getting most common letter).
Also, the original did not exclude non-alphabetical characters.

say_hello - a simple program to debug. A syntax error where
parentheses were used as opposed to curly braces for string
interpolation.

string_encoder - a nice, challenging debugging exercise.
The encoder takes a key and jumbles up the provided text.
The decoder reverses this encoding and returns the original
text. The encoder had a syntax error where "z" was missed 
out when assigning the entire alphabet (a...z instead of a..z).
The decoder also had a syntax error where a mathematical
operation was reversed.
