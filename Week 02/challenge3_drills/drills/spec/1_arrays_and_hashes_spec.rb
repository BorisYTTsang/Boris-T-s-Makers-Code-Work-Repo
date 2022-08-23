require_relative '../lib/1_arrays_and_hashes'

RSpec.describe 'arrays and hashes' do
  describe 'fourth_element' do
    it 'takes an array and returns the fourth element' do
      expect(fourth_element([1,2,3,4,5])).to eq 4
    end
  end

  describe 'average' do
    it 'takes an array of numbers and returns the mean' do
      expect(average([1,2,3,4,5])).to eq 3
    end
  end

  describe 'lowest_squared' do
    it 'takes an array of numbers and returns the lowest number, squared' do
      expect(lowest_squared([2,3,4,5])).to eq 4
    end
  end

  describe 'highest_squared' do
    it 'takes an array of numbers and returns the highest number, squared' do
      expect(highest_squared([2,3,4,5])).to eq 25
    end
  end

  describe 'values_summed' do
    it 'takes a hash where the values are numbers and returns the total of the values' do
      expect(values_summed({'one' => 1, 'two' => 2, 'three' => 3})).to eq 6
    end
  end

  describe 'first_two_keys' do
    it 'takes a hash and returns the first two keys' do
      expect(first_two_keys({'one' => 1, 'two' => 2, 'three' => 3})).to eq ['one', 'two']
    end
  end

  describe 'first_two_values' do
    it 'takes a hash and returns the first two values' do
      expect(first_two_values({'one' => 1, 'two' => 2, 'three' => 3})).to eq [1,2]
    end
  end

  describe 'starts_with_a' do
    it 'takes an array of strings and returns the elements starting with a' do
      expect(starts_with_a(
          ['aardvark', 'apple', 'zebra', 'zinc']
        )).to eq(
          ['aardvark', 'apple']
        )
    end
  end

  describe 'starts_with_a_vowel' do
    it 'takes an array of strings and returns the elements starting with a vowel' do
      expect(starts_with_a_vowel(
          ['apple', 'pear', 'orange', 'egg', 'indigo', 'uncle']
        )).to eq(
          ['apple', 'orange', 'egg', 'indigo', 'uncle']
        )
    end
  end

  describe 'reverse_each_element' do
    it 'takes an array of strings and returns an array where each element is reversed' do
      expect(reverse_each_element(
        ['one', 'two']
      )).to eq(
        ['eno', 'owt']
      )
    end
  end

  describe 'sort_by_last_letter' do
    it 'takes an array of strings and sorts the elements by their last letter' do
      expect(sort_by_last_letter(
        ['apple', 'pear', 'satsuma']
      )).to eq(
        ['satsuma', 'apple', 'pear']
      )
    end
  end

  describe 'greater_than_5' do
    it 'takes an array of numbers and returns only those which are greater than 5' do
      expect(greater_than_5(
        [1,2,3,4,5,6,7,8,9,10]
      )).to eq(
        [6,7,8,9,10]
      )
    end
  end

  describe 'greater_than' do
    it 'takes an array of numbers and a number - returns only those greater than the number provided' do
      expect(greater_than(
        [1,2,3,4,5], 3
      )).to eq(
        [4,5]
      )
    end
  end

  describe 'less_than' do
    it 'takes an array of numbers and a number - returns only those less than the number provided' do
      expect(less_than(
        [1,2,3,4,5], 3
      )).to eq(
        [1,2]
      )
    end
  end

  describe 'words_shorter_than' do
    it 'takes an array of strings and a number - returns only the strings that are shorter than the number provided' do
      expect(words_shorter_than(
        ['tree', 'rainbow', 'desk', 'computer'], 5
      )).to eq(
        ['tree', 'desk']
      )
    end
  end

  describe 'all_above?' do
    it 'takes an array of numbers and a number - returns true if all numbers are greater than the number provided' do
      expect(all_above?(
        [2,3,4,5], 1
      )).to eq(
        true
      )
    end

    it 'takes an array of numbers and a number - returns false if any numbers are less than the number provided' do
      expect(all_above?(
        [2,3,4,5], 5
      )).to eq(
        false
      )
    end
  end

  describe 'all_below?' do
    it 'takes an array of numbers and a number - returns true if all numbers are less than the number provided' do
      expect(all_below?(
        [1,2,3,4,5], 6
      )).to eq(
        true
      )
    end

    it 'takes an array of numbers and a number - returns false if any numbers are greater than the number provided' do
      expect(all_above?(
        [1,2,3,4,5], 5
      )).to eq(
        false
      )
    end
  end

  describe 'multiply_each_by' do
    it 'takes an array of numbers and a number - multiplies each number in the array by the number provided' do
      expect(multiply_each_by(
        [1,2,3,4,5], 2
      )).to eq(
        [2,4,6,8,10]
      )
    end
  end

  describe 'where_value_below' do
    it 'takes a hash where the values are numbers and a number - returns only the key-value pairs where the value is less than the number provided' do
      expect(where_value_below(
        {'chips' => 2.5, 'burger' => 10, 'slaw' => 2.0, 'salad' => 3.0}, 5
      )).to eq(
        {'chips' => 2.5, 'slaw' => 2.0, 'salad' => 3.0}
      )
    end
  end

  describe 'where_key_starts_with' do
    it 'takes a hash where the keys are strings and a letter - returns only the key-value pairs whgere the key starts with the letter provided' do
      expect(where_key_starts_with(
        {'chips' => 2.5, 'burger' => 10, 'slaw' => 2.0, 'salad' => 3.0}, 's'
      )).to eq(
        {'slaw' => 2.0, 'salad' => 3.0}
      )
    end
  end

  describe 'add_key_value_pair' do
    it 'takes a hash, a key and a value - returns a hash with a new key-value pair' do
      expect(add_key_value_pair(
        {'chips' => 2.5, 'burger' => 10, 'slaw' => 2.0, 'salad' => 3.0}, 'beans', 2.0
      )).to eq(
        {'chips' => 2.5, 'burger' => 10, 'slaw' => 2.0, 'salad' => 3.0, 'beans' => 2.0}
      )
    end
  end

  describe 'sort_by_key' do
    it 'takes a hash and sorts the key-value pairs by the keys' do
      expect(sort_by_key(
        {'chips' => 2.5, 'burger' => 10, 'slaw' => 2.0, 'salad' => 3.0, 'beans' => 2.0}
      )).to eq(
        {"beans"=>2.0, "burger"=>10, "chips"=>2.5, "salad"=>3.0, "slaw"=>2.0}
      )
    end
  end

  describe 'sort_by_value' do
    it 'takes a hash and sorts the key-value pairs by the values' do
      expect(sort_by_value(
        {'drummer' => 'ringo', 'guitar' => 'jimmy', 'vocals' => 'nina'}
      )).to eq(
        {"guitar"=>"jimmy", "vocals"=>"nina", "drummer"=>"ringo"}
      )
    end
  end
end
