# These challenges are a bit trickier and, in some cases, will required a few lines of code.  If you start to get a little stuck, take a step back and make a plan by breaking the overall task down into small steps.

# TASK: define a method that returns a boolean depending on whether or not a given string starts in a lowercase 'a'.
# EXAMPLE INPUT/OUTPUT:
# when the string is apple
# the method should return true
# when the string is Apple
# it should return false
def starts_with_the_letter_a?(string)
  string[0] == "a" ? true : false
end

# TASK: define a method that returns a boolean depending on whether or not a given string ends in a lowercase 'a'.
# EXAMPLE INPUT/OUTPUT:
# when the string is Java
# the method should return true
# when the string is JAVA
# the method should return false
def ends_with_the_letter_a?(string)
  string[-1] == "a" ? true : false
end

# TASK: define a method that returns a boolean depending on whether or not a given string contains the substring 'hello'.
# EXAMPLE INPUT/OUTPUT:
# when the string is 'hello world'
# the method should return true
# when the string is 'world'
# the method should return false
def contains_hello?(string)
  string.include? "hello"
end

# TASK: define a method that returns a string that replaces the substring 'hello' with the substring 'goodbye'.
# EXAMPLE INPUT/OUTPUT:
# when the string is 'hello folks'
# the method should return 'goodbye folks'
def substitute_hello_with_goodbye(string)
  string.gsub("hello", "goodbye")
end

# TASK: define a method that returns a string that has removed all vowels from a given string.
# EXAMPLE INPUT/OUTPUT:
# when the string is 'hullabaloo'
# the method should return 'hllbl'
def remove_all_vowels(string)
  string.gsub(/[aeiou]/, "")
end

# TASK: define a method that returns a string that has removed all consonants from a given string.
# EXAMPLE INPUT/OUTPUT:
# when the string is 'hullabaloo'
# the method should return 'uaaoo'
def remove_all_consonants(string)
  string.gsub(/[^aeiou]/, "")
end

# TASK: define a method that returns a string that has removed the last half of characters from a given string.
# EXAMPLE INPUT/OUTPUT:
# when the string is 'coding'
# the method should return 'cod'
def first_half(string)
  string.slice(0...(string.length / 2))
end

# TASK: define a method that returns a string that has removed the first half of characters from a given string.
# EXAMPLE INPUT/OUTPUT:
# when the string is 'coding'
# the method should return 'ing'
def second_half(string)
  string.slice((string.length / 2)..-1)
end
