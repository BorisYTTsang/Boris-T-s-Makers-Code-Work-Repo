
# return 'fizz' if the number is divisible by 3
# return 'buzz' if the number is divisible by 5
# return 'fizzbuzz' if the number is divisible by 15
# return '1' if the number is not divisible by 3, 5 or 15
# clue - you can check divisibility using modulo (%)
def fizz_buzz(number)
    if number % 15 == 0
        "fizzbuzz"
    elsif number % 3 == 0
        "fizz"
    elsif number % 5 == 0
        "buzz"
    else
        "1"
    end
end

# if the greeting is 'good morning'
# return 'good morning to you too'
# if the greeting is 'hello'
# return 'hi'
# if the greeting is anything else
# return the greeting that was received
def reply_to(greeting)
    case greeting
    when "good morning"
        "good morning to you too"
    when "hello"
        "hi"
    else
        greeting
    end
end

# when the number is greater than or equal to 10
# deduct 10 and return the result
# when the number is below 10
# return the number
def deduct_10_if_possible(number)
    if number >= 10
        number - 10
    else
        number
    end
end

# if the number is below 100
# return 100
# if the number is above 100
# return the number
def top_up_to_100(number)
    if number < 100
        100
    # assuming that 100 is included since not specified above (>= 100)
    else
        number
    end
end
