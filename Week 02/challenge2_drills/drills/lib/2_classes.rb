require 'date'

# In this set of exercises you'll build small classes
# Some will have no methods
# Some will have one or two simple methods
# Some will have one or two more complex methods
# Some classes are instantiated with args

# Each exercise will have the same format for the requirements
# The first line tells you what the class name should be
# If the class is instantiated with args, these come next
# The rest tells you what methods should be implemented

# Example requirements

# Greeter
# instantiated with a name. E.g. 'Bobby'
# hello
# returns 'hello, Bobby'
# goodbye
# returns 'goodbye, Bobby'

# Example solution

class Greeter
  def initialize(name)
    @name = name
  end

  def hello
    return 'hello, ' + @name
  end

  def goodbye
    return 'goodbye, ' + @name
  end
end

# Animal
# no methods required
class Animal
end

# Vehicle
# no methods required
class Vehicle
end

# Cat
# speak
# returns 'miaow'
class Cat
  def speak
    p "miaow"
  end
end

# Dog
# speak
# returns 'woof'
class Dog
  def speak
    p "woof"
  end
end

# StringFormatter
# block_caps
# takes a string as an arg
# returns the string in block caps
# lower_case
# takes a string as an arg
# returns the string in lower case
class StringFormatter
  def block_caps(str)
    str.upcase
  end
  def lower_case(str)
    str.downcase
  end
end

# Calculator
# add
# takes two numbers as args
# returns the total
# multiply
# takes two numbers as args
# multiplies one by the other
# returns the result
# subtract
# takes two numbers as args
# subtracts the second from the first
# returns the result
# divide
# takes two numbers as args
# divides the first by the second
# returns the result
class Calculator
  def add(num1, num2)
    num1 + num2
  end
  def multiply(num1, num2)
    num1 * num2
  end
  def subtract(num1, num2)
    num1 - num2
  end
  def divide(num1, num2)
    num1 / num2
  end
end

# Apprentice
# is instantiated with two strings
# a name and a cohort name
# name
# returns the name
# cohort
# returns the cohort
# full_details
# returns name and cohort, separated by one comma and one space
# 'E.g. "Rita Smith, June 2030"'
class Apprentice
  def initialize(name, cohort_name)
    @name = name
    @cohort_name = cohort_name
  end
  def name
    @name
  end
  def cohort
    @cohort_name
  end
  def full_details
    "#{@name}, #{@cohort_name}"
  end
end

# Cohort
# is instantiated with three strings
# a name, a start_date and an end_date
# name
# returns the cohort name
# start_date
# returns the start_date as a Date object
# end_date
# returns the end_date as a Date object
# duration
# returns the number of days between start_date and end_date
class Cohort
  def initialize(name, start_date, end_date)
    @name = name
    @start_date = start_date
    @end_date = end_date
  end
  def name
    @name
  end
  def start_date
    Date.parse(@start_date)
  end
  def end_date
    Date.parse(@end_date)
  end
  def duration
    end_date - start_date
  end
end
