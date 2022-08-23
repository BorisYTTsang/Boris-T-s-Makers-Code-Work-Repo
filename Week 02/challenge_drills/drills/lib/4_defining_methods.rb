# In these exercises, you'll be defining methods, so you start only with a set of requirements for each one.

# the requirements will always start with the name of the method
# then they'll describe what the method should do

# here's an example of some requirements

# add_ten
# takes one number as an arg (argument)
# adds ten and returns the new value
# example: the arg is 5
# returns 15

# and here's the solution

def add_ten(number)
  return number + 10
end

# TIP: some solutions will require more than one line of code

# now it's over to you!

# say_hello
# takes no args (arguments)
# returns 'hello'
def say_hello
  "hello"
end

# say_goodbye
# takes no args
# returns 'goodbye'
def say_goodbye
  "goodbye"
end

# say_hello_to
# takes one string as an arg
# example: the arg is `Sam`
# returns `Hello, Sam`
def say_hello_to(str)
  "Hello, #{str}"
end

# say_goodbye_to
# takes one string as an arg
# example: the arg is `Sam`
# returns `Goodbye, Sam`
def say_goodbye_to(str)
  "Goodbye, #{str}"
end

# square
# takes one number as an arg
# multiplies that number by itself
# returns the new value
def square(num)
  num ** 2
end

# divisible_by_three?
# takes one number as an arg
# returns true if the number is divisible by three
# returns false if the number is not divisible by three
def divisible_by_three?(num)
  num % 3 == 0 ? true : false
end

# add
# takes two numbers as args
# adds them together
# returns the total
def add(num1, num2)
  num1 + num2
end

# multiply
# takes two numbers as args
# multiplies one by the other
# returns the result
def multiply(num1, num2)
  num1 * num2
end

# add_number_strings
# takes two numbers as strings
# converts them both to numbers
# returns the total
def add_number_strings(str_num1, str_num2)
  str_num1.to_i + str_num2.to_i
end

# multiply_number_strings
# takes two numbers as strings for args
# converts them both to numbers
# multiplies one by the other
# returns the result
def multiply_number_strings(str_num1, str_num2)
  str_num1.to_i * str_num2.to_i
end

# both_odd?
# takes two numbers as args
# returns true if both are odd
# otherwise, returns false
def both_odd?(num1, num2)
  num1.odd? && num2.odd? ? true : false
end

# both_even?
# takes two numbers as args
# returns true if both are even
# otherwise, returns false
def both_even?(num1, num2)
  num1.even? && num2.even? ? true : false
end

# one_odd?
# takes two numbers as args
# returns true if at least one of them is odd
# otherwise, returns false
def one_odd?(num1, num2)
  num1.odd? || num2.odd? ? true : false
end

# one_even?
# takes two numbers as args
# returns true if at least one of them is even
# otherwise returns false
def one_even?(num1, num2)
  num1.even? || num2.even? ? true : false
end

# rev_sym_caps
# takes one string as an arg
# reverses it
# converts it to a symbol
# returns the symbol in block caps
def rev_sym_caps(str)
  str.reverse.to_sym.upcase
end

# truncate
# takes one string as an arg
# if the string is longer than 10 characters
# returns the first 10 chars followed by '...'
# if the string is 10 chars or less
# returns the whole string
def truncate(str)
  str.length > 10 ? "#{str.slice(0...10)}..." : str
end
