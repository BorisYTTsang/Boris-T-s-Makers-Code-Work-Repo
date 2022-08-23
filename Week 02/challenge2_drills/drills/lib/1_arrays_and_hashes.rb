# These exercises require you to define methods
# Most methods will take an array or hash as an argument
# Some methods will take other args
# Some methods won't take any args

# You won't find everything that you need in our materials
# Use the Ruby Docs and Google liberally if you get stuck

# Over to you!

## Arrays

# first_element
# takes one array as an arg
# returns the first element
def first_element(arr)
  arr[0]
end

# second_element
# takes one array as an arg
# returns the second element
def second_element(arr)
  arr[1]
end

# last_element
# takes one array as an arg
# returns the last element
def last_element(arr)
  arr[-1]
end

# first_two_elements
# takes one array as an arg
# returns the first two elements
def first_two_elements(arr)
  # [arr[0], arr[1]
  [*arr[0..1]]
end

# first_three_elements
# takes one array as an arg
# returns the first three elements
def first_three_elements(arr)
  [*arr[0..2]]
end

# total
# takes one array of numbers as an arg
# adds all the numbers together
# returns the total
def total(int_arr)
  int_arr.sum
end

# lowest_number
# takes one array of numbers as an arg
# returns the lowest value
def lowest_number(int_arr)
  int_arr.min
end

# highest_number
# takes one array of numbers as an arg
# returns the highest value
def highest_number(int_arr)
  int_arr.max
end

# the_beatles
# takes no args
# returns ['john', 'paul', 'george', 'ringo']
def the_beatles
  ["john", "paul", "george", "ringo"]
end

# i_joined_the_beatles
# takes one string as an arg
# when that string is 'freda' (for example)
# returns ['john', 'paul', 'george', 'ringo', 'freda']
def i_joined_the_beatles(str)
  ["john", "paul", "george", "ringo", "#{str}"]
end

# we_joined_the_beatles
# takes one array as an arg
# when the array is ['sam', 'alex'] (for example)
# returns ['john', 'paul', 'george', 'ringo', 'sam', 'alex']
def we_joined_the_beatles(str_arr)
  ["john", "paul", "george", "ringo"] + str_arr
end

# remove_nils_from_array
# takes one array as an arg
# returns the array, minus any nils
def remove_nils_from_array(arr)
  arr.compact
end

# double_array
# takes one array as an arg
# when that array is [1,2,3]
# returns [1,2,3,1,2,3]
def double_array(arr)
  arr + arr
end

# unique_elements
# takes one array as an arg
# when that array is [1,1,2,2,3,3]
# returns [1,2,3]
def unique_elements(arr)
  arr.uniq
end

# add_to_array
# takes one array and one string as args
# adds the string to the array
# returns the new array
def add_to_array(arr, str)
  arr << str
end

## Hashes

# new_band_member
# takes a hash of one key-value pair as an arg
# merges it wth the existing hash of band members
# returns the new hash
# the existing band members are: {'vocalist' => 'miss piggy', 'lead_guitar' => 'scooter'
# if the arg is {'drummer' => 'kermit'}
# returns {'vocalist' => 'miss piggy', 'lead_guitar' => 'scooter', 'drummer' => 'kermit'}
def new_band_member(hash)
  {'vocalist' => 'miss piggy', 'lead_guitar' => 'scooter'}.merge(hash)
end

# all_values
# takes one hash as an arg
# returns the values
def all_values(hash)
  hash.values
end

# all_keysß
# takes one hash as an arg
# returns the keys
def all_keys(hash)
  hash.keys
end

# remove_nils_from_hash
# takes one hash an an arg
# removes key-value pairs where the value is nil
# returns the remaining key-value pairs as a hash
def remove_nils_from_hash(hash)
  hash.compact
end

# key_value_swap
# takes one hash as an arg
# swaps the keys with the values
# returns the new hash
def key_value_swap(hash)
  hash.invert
end

# touch_in
# takes two args
# arg one: the name of a tube station e.g. 'Aldgate East'
# arg two: a date and time e.g. '2022/01/30 17:12'
# returns a hash with key-value pairs for 'entrypoint' and 'time'
def touch_in(tube_name, date_time)
  {"entrypoint" => tube_name, "time" => date_time}
end
