require_relative '../lib/1_calling_methods'

RSpec.describe 'calling methods' do

  describe 'block_caps_a_string' do
    it 'should return the string in block caps' do
      expect(block_caps_a_string('i am not shouting')).to eq(
        'I AM NOT SHOUTING'
      )
      expect(block_caps_a_string('can you turn that down please')).to eq(
        'CAN YOU TURN THAT DOWN PLEASE'
      )
    end
  end

  describe 'lower_case_a_string' do
    it 'should return the string in lower case' do
      expect(lower_case_a_string('HELLO WORLD')).to eq 'hello world'
      expect(lower_case_a_string('STARLIGHT EXPRESS!')).to eq 'starlight express!'
    end
  end

  describe 'length_of_a_string' do
    it 'should return the length of a string' do
      expect(length_of_a_string('the length of this string is 31')).to eq 31
      expect(length_of_a_string('however, this one clocks in at an impressive')).to eq 44
    end
  end

  describe 'reverse_a_string' do
    it 'should return the string, reversed' do
      expect(reverse_a_string('reverse me')).to eq 'em esrever'
      expect(reverse_a_string('ooh ooh fun do me!')).to eq '!em od nuf hoo hoo'
    end
  end

  describe 'swap_the_case_of_a_string' do
    it 'should downcase capital letters and upcase the others' do
      expect(swap_the_case_of_a_string('Hello World')).to eq 'hELLO wORLD'
      expect(swap_the_case_of_a_string('aNd thIS OnE?')).to eq 'AnD THis oNe?'
    end
  end

  describe 'string_to_symbol' do
    it 'should return the string as a symbol' do
      expect(string_to_symbol('hello')).to eq :hello
      expect(string_to_symbol('yoohoo')).to eq :yoohoo
    end
  end

  describe 'is_integer_odd?' do
    it 'should return true, if the integer is odd' do
      expect(is_integer_odd?(1)).to eq true
      expect(is_integer_odd?(5)).to eq true
      expect(is_integer_odd?(11)).to eq true
      expect(is_integer_odd?(99)).to eq true
    end

    it 'should return false, if the integer is even' do
      expect(is_integer_odd?(2)).to eq false
      expect(is_integer_odd?(8)).to eq false
      expect(is_integer_odd?(88)).to eq false
      expect(is_integer_odd?(20)).to eq false
    end
  end

  describe 'is_integer_even?' do
    it 'should return true, if the integer is even' do
      expect(is_integer_even?(2)).to eq true
      expect(is_integer_even?(8)).to eq true
      expect(is_integer_even?(88)).to eq true
      expect(is_integer_even?(20)).to eq true
    end

    it 'should return false, if the integer is odd' do
      expect(is_integer_even?(1)).to eq false
      expect(is_integer_even?(5)).to eq false
      expect(is_integer_even?(11)).to eq false
      expect(is_integer_even?(99)).to eq false
    end
  end

  describe 'integer_to_float' do
    it 'should return a float of the same value' do
      expect(integer_to_float(1)).to eq 1.0
      expect(integer_to_float(4)).to eq 4.0
      expect(integer_to_float(8)).to eq 8.0
    end
  end

  describe 'integer_to_string' do
    it 'should return the integer as a string' do
      expect(integer_to_string(1)).to eq '1'
      expect(integer_to_string(23)).to eq '23'
      expect(integer_to_string(1984)).to eq '1984'
    end
  end

  describe 'return_previous_integer' do
    it 'should return the previous integer' do
      expect(return_previous_integer(2)).to eq 1
      expect(return_previous_integer(5)).to eq 4
      expect(return_previous_integer(10)).to eq 9
      expect(return_previous_integer(50)).to eq 49
    end
  end

  describe 'return_next_integer' do
    it 'should return the next integer' do
      expect(return_next_integer(2)).to eq 3
      expect(return_next_integer(5)).to eq 6
      expect(return_next_integer(10)).to eq 11
      expect(return_next_integer(50)).to eq 51
    end
  end

  describe 'round_up' do
    it 'should round up to the nearest whole number' do
      expect(round_up(1.1)).to eq 2.0
      expect(round_up(2.5)).to eq 3.0
      expect(round_up(22.9)).to eq 23.0
    end
  end

  describe 'round_down' do
    it 'should round down to the nearest whole number ' do
      expect(round_down(1.1)).to eq 1.0
      expect(round_down(2.5)).to eq 2.0
      expect(round_down(22.9)).to eq 22.0
    end
  end

  describe 'float_to_string' do
    it 'should return the float as a string' do
      expect(float_to_string(1.1)).to eq '1.1'
      expect(float_to_string(2.3)).to eq '2.3'
      expect(float_to_string(4.9)).to eq '4.9'
    end
  end

  describe 'float_to_integer' do
    it 'should round down and return an integer' do
      expect(float_to_integer(1.8)).to eq 1
      expect(float_to_integer(4.3)).to eq 4
      expect(float_to_integer(99.9)).to eq 99
    end
  end

  describe 'float_is_positive?' do
    it 'should return true if the value is above 0' do
      expect(float_is_positive?(1.1)).to eq true
      expect(float_is_positive?(0.1)).to eq true
      expect(float_is_positive?(188.7)).to eq true
    end

    it 'should return false if the value is below 0' do
      expect(float_is_positive?(-1.1)).to eq false
      expect(float_is_positive?(0.0)).to eq false
    end
  end

  describe 'float_is_negative?' do
    it 'should return true if the value is below 0' do
      expect(float_is_negative?(-2.2)).to eq true
      expect(float_is_negative?(-4.4)).to eq true
      expect(float_is_negative?(-9.9)).to eq true
    end

    it 'should return false if the value is above 0' do
      expect(float_is_negative?(2.2)).to eq false
      expect(float_is_negative?(4.4)).to eq false
      expect(float_is_negative?(9.9)).to eq false
    end
  end

  describe 'swap_the_case_of_a_symbol' do
    it 'should return a case-swapped symbol' do
      expect(swap_the_case_of_a_symbol(:Hello)).to eq :hELLO
      expect(swap_the_case_of_a_symbol(:Potato)).to eq :pOTATO
      expect(swap_the_case_of_a_symbol(:BasketBall)).to eq :bASKETbALL
    end
  end

  describe 'symbol_to_string' do
    it 'should return the symbol as a string' do
      expect(symbol_to_string(:hello)).to eq 'hello'
      expect(symbol_to_string(:Potato)).to eq 'Potato'
      expect(symbol_to_string(:BasketBall)).to eq 'BasketBall'
    end
  end

  describe 'block_caps_a_symbol' do
    it 'should return the symbol in block caps' do
      expect(block_caps_a_symbol(:hello)).to eq :HELLO
      expect(block_caps_a_symbol(:Potato)).to eq :POTATO
      expect(block_caps_a_symbol(:BasketBall)).to eq :BASKETBALL
    end
  end

  describe 'lower_case_a_symbol' do
    it 'should return the symbol in lower case' do
      expect(lower_case_a_symbol(:HELLO)).to eq :hello
      expect(lower_case_a_symbol(:POTATO)).to eq :potato
      expect(lower_case_a_symbol(:BASKETBALL)).to eq :basketball
    end
  end

  describe 'convert_to_string' do
    it 'should return the boolean as a string' do
      expect(boolean_to_string(true)).to eq 'true'
      expect(boolean_to_string(false)).to eq 'false'
    end
  end
end
