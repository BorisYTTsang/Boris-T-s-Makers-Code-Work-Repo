=begin

User Story
As a user, so that I can improve my grammar, I want to verify that a text starts
with a capital letter and ends with a suitable sentence-ending punctuation mark.

Clarification
Program that verifies if text passage:-
1) begins with a capital letter
2) ends with an appropriate punctuation mark (. or ! or ?)

Brainstorm
Single method, one string argument, returns string, no side effects

def sentence_checker(text = string)
if text is not capitalised NOR punctuated
    return "You forgot to capitalize AND didn't punctuate with . or ? or !"
elsif text is not capitalised
    return "You forgot to capitalise the first word!"
elsif text does not end with sentence-ending punctuation mark
    return "You forgot to/didn't punctuate appropriately at the end with . or ? or !"
else
    return "Great! This sentence looks great!"
end

Extra thoughts
Could implement check and error for one worded entries (I, A, An, The etc.)
^Likeky superfluous and unhelpful, though, I think.
Also could implement another function that checks that only appropriately
words are capitalised (first words and proper nouns), as well as checking
for unusual/unexpected capitals - could be problematic with e.g. acronyms.

=end

def sentence_checker(text)
  fail "You didn't enter anything!" if text == nil || text == ""
  fail "You didn't enter a string!" if text.class != String

  if text[0].chr != text[0].chr.capitalize && text[-1] =~ /[^.?!]/
    return "You forgot to capitalize AND didn't punctuate with . or ? or !"
  elsif text[0].chr != text[0].chr.capitalize
    return "You forgot to capitalise the first word!"
  elsif text[-1] =~ /[^.?!]/
    return "You forgot to/didn't punctuate appropriately at the end with . or ? or !"
  else
    return "Great! This sentence looks great!"
  end
end
