require_relative '../lib/4_defining_methods'

RSpec.describe 'defining methods' do
  describe 'say_hello' do
    it 'returns "hello"' do
      expect(say_hello).to eq "hello"
    end
  end

  describe 'say goodbye' do
    it 'returns "goodbye"' do
      expect(say_goodbye).to eq "goodbye"
    end
  end

  describe 'say_hello_to' do
    it 'returns "Hello, Sam" when given "Sam"' do
      expect(say_hello_to('Sam')).to eq 'Hello, Sam'
    end

    it 'returns "Hello, Scott Pilgrim" when given "Scott Pilgrim"' do
      expect(say_hello_to('Scott Pilgrim')).to eq 'Hello, Scott Pilgrim'
    end
  end

  describe 'say_goodbye_to' do
    it 'returns "Goodbye, Sam" when given "Sam"' do
      expect(say_goodbye_to('Sam')).to eq 'Goodbye, Sam'
    end

    it 'returns "Goodbye, Scott Pilgrim" when given "Scott Pilgrim"' do
      expect(say_goodbye_to('Scott Pilgrim')).to eq 'Goodbye, Scott Pilgrim'
    end
  end

  describe 'square' do
    it 'returns 25, when given 5' do
      expect(square(5)).to eq 25
    end

    it 'returns 16, when given 4' do
      expect(square(4)).to eq 16
    end
  end

  describe 'divisible_by_three?' do
    it 'returns true, when given 3' do
      expect(divisible_by_three?(3)).to eq true
    end

    it 'returns true, when given 30' do
      expect(divisible_by_three?(30)).to eq true
    end

    it 'returns false, when given 4' do
      expect(divisible_by_three?(4)).to eq false
    end

    it 'returns false, when given 5' do
      expect(divisible_by_three?(5)).to eq false
    end
  end

  describe 'add' do
    it 'returns 10 when given 5 and 5' do
      expect(add(5, 5)).to eq 10
    end

    it 'returns 15 when given 10 and 5' do
      expect(add(10, 5)).to eq 15
    end
  end

  describe 'multiply' do
    it 'returns 10 when given 5 and 2' do
      expect(multiply(5, 2)).to eq 10
    end

    it 'returns 100 when given 10 and 10' do
      expect(multiply(10, 10)).to eq 100
    end
  end

  describe 'add_number_strings' do
    it 'returns 4, when given "20" and "20"' do
      expect(add_number_strings('20', '20')).to eq 40
    end

    it 'returns 4, when given "200" and "200"' do
      expect(add_number_strings('200', '200')).to eq 400
    end
  end

  describe 'multiply_number_strings' do
    it 'returns 6 when given "3" and "2"' do
      expect(multiply_number_strings('3', '2')).to eq 6
    end

    it 'returns 25 when given "5" and "5"' do
      expect(multiply_number_strings('5', '5')).to eq 25
    end
  end

  describe 'both_odd?' do
    it 'returns true when given 1 and 3' do
      expect(both_odd?(1, 3)).to eq true
    end

    it 'returns true when given 9 and 17' do
      expect(both_odd?(9, 17)).to eq true
    end

    it 'returns false when given 1 and 2' do
      expect(both_odd?(1, 2)).to eq false
    end

    it 'returns false when given 2 and 2' do
      expect(both_odd?(2, 2)).to eq false
    end
  end

  describe 'both_even?' do
    it 'returns true when given 2 and 2' do
      expect(both_even?(2, 2)).to eq true
    end

    it 'returns true when given 8 and 16' do
      expect(both_even?(8, 16)).to eq true
    end

    it 'returns false when given 1 and 2' do
      expect(both_even?(1, 2)).to eq false
    end

    it 'returns false when given 17 and 23' do
      expect(both_even?(17, 23)).to eq false
    end
  end

  describe 'one_odd?' do
    it 'returns true when given 1 and 2' do
      expect(one_odd?(1, 2)).to eq true
    end

    it 'returns true when given 4 and 3' do
      expect(one_odd?(4, 3)).to eq true
    end

    it 'returns false when given 2 and 4' do
      expect(one_odd?(2, 4)).to eq false
    end

    it 'returns true when given 1 and 3' do
      expect(one_odd?(1, 3)).to eq true
    end
  end

  describe 'one_even?' do
    it 'returns true when given 1 and 2' do
      expect(one_even?(1, 2)).to eq true
    end

    it 'returns true when given 2 and 4' do
      expect(one_even?(2, 4)).to eq true
    end

    it 'returns false when given 1 and 3' do
      expect(one_even?(1, 3)).to eq false
    end
  end

  describe 'rev_sym_caps' do
    it 'returns :OLLEH when given "hello"' do
      expect(rev_sym_caps('hello')).to eq :OLLEH
    end

    it 'returns :OTATOP when given "potato"' do
      expect(rev_sym_caps('potato')).to eq :OTATOP
    end
  end

  describe 'truncate' do
    it 'truncates strings longer than 10 chars' do
      expect(truncate('This is a long string')).to eq 'This is a ...'
      expect(truncate('This too is a long string')).to eq 'This too i...'
    end

    it 'does not truncate strings that have 10 chars' do
      expect(truncate('helloworld')).to eq 'helloworld'
    end

    it 'does not truncate strings that have fewer than 10 chars' do
      expect(truncate('hi world')).to eq 'hi world'
    end
  end
end
