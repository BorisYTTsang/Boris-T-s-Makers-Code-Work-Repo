=begin
PLAN--

--Structure of Method (with specification)--
input string ("password")
# Password must be longer than 7 characters (8 is fine)
# Password must contain at least one of the following special characters: !, @, $, % or &
output boolean (true || false)

--Method body template
if (requirement 1 && requirement 2)
  return true
else
  return false
end

--Body with completed conditional (blocks)
spec_char_arr = ["!", "@", "$", "%", "&"]
pass_arr = password.split("")

if (password.length > 7 && !(pass_arr & spec_char_arr).any?)
  return true
else
  return false
end

=end

def valid?(password)
  spec_char_arr = ["!", "@", "$", "%", "&"]
  pass_arr = password.split("")

  if (password.length > 7 && (pass_arr & spec_char_arr).any?)
    return true
  else
    return false
  end
end
