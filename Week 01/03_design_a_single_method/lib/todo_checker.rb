=begin

User Story
As a user, so that I can keep track of my tasks,
I want to check if a text includes the string `#TODO`.

Clarification
Method that checks string for substring "#TODO".

Brainstorm
def todo_checker(text)
  check if text contains "#TODO"
end

Extra Thoughts
Do we check for non-upper case "todo"?
Do we check for TODOs without "#"?
Do we test for more than one argument? (Splat operator)

=end

def todo_checker(*text)
  fail "You didn't enter anything!" if text == [] || text == [""]
  fail "Please provide all text in one go!" if text.size > 1
  fail "You didn't enter a string!" if text[0].class != String
  text = text.join
  if text.include?("#TODO")
    return "There are #TODOs in this text!"
  else
    return "No #TODOs detected!"
  end
end

=begin

=end
