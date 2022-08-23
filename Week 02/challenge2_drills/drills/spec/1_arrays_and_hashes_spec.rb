require_relative '../lib/1_arrays_and_hashes'

RSpec.describe 'arrays and hashes' do
  describe 'first_element' do
    it 'takes an array and returns the first element' do
      expect(first_element([1,2,3])).to eq 1
    end
  end

  describe 'second_element' do
    it 'takes an array and returns the second element' do
      expect(second_element([1,2,3])).to eq 2
    end
  end

  describe 'last_element' do
    it 'takes an array and returns the last element' do
      expect(last_element([1,2,3])).to eq 3
    end
  end

  describe 'first_two_elements' do
    it 'takes an array and returns the first two elements' do
      expect(first_two_elements([1,2,3])).to eq [1,2]
    end
  end

  describe 'first_three_elements' do
    it 'takes an array and returns the first three elements' do
      expect(first_three_elements([1,2,3,4,5,6])).to eq [1,2,3]
    end
  end

  describe 'total' do
    it 'takes an array of numbers and returns the total' do
      expect(total([1,2,3,4])).to eq 10
    end
  end

  describe 'lowest_number' do
    it 'takes an array of numbers and returns the lowest number' do
      expect(lowest_number([2,5,3,1,4])).to eq 1
    end
  end

  describe 'highest_number' do
    it 'takes an array of numbers and returns the highest number' do
      expect(highest_number([2,3,1,5,4])).to eq 5
    end
  end

  describe 'the_beatles' do
    it 'takes no args and returns the names of the Beatles' do
      expect(the_beatles).to eq ['john', 'paul', 'george', 'ringo']
    end
  end

  describe 'i_joined_the_beatles' do
    it 'takes a name and adds it to the Beatles array' do
      expect(i_joined_the_beatles('jo')).to eq ['john', 'paul', 'george', 'ringo', 'jo']
      expect(i_joined_the_beatles('freda')).to eq ['john', 'paul', 'george', 'ringo', 'freda']
      expect(i_joined_the_beatles('your name')).to eq ['john', 'paul', 'george', 'ringo', 'your name']
    end
  end

  describe 'we_joined_the_beatles' do
    it 'takes takes an array of names and adds them all to the Beatles array' do
      expect(we_joined_the_beatles(['jo', 'jude', 'sam'])).to eq ['john', 'paul', 'george', 'ringo', 'jo', 'jude', 'sam']
      expect(we_joined_the_beatles(['you', 'someone else'])).to eq ['john', 'paul', 'george', 'ringo', 'you', 'someone else']
    end
  end

  describe 'remove_nils_from_array' do
    it 'takes an array and returns an array with no nils' do
      expect(remove_nils_from_array([nil, 1, 2, 3])).to eq [1, 2, 3]
    end
  end

  describe 'double_array' do
    it 'takes an array and returns a new array with everything duplicated' do
      expect(double_array([1,2,3])).to eq [1,2,3,1,2,3]
    end
  end

  describe 'unique_elements' do
    it 'takes an array containing some dulicates and the unique elements' do
      expect(unique_elements([1,1,2,2,3,3])).to eq [1,2,3]
    end
  end

  describe 'add_to_array' do
    it 'adds a new element to an array' do
      expect(add_to_array(['one', 'two', 'three'], 'four')).to eq ['one', 'two', 'three', 'four']
    end
  end

  describe 'new_band_member' do
    it 'takes a hash describing a new bad member and adds it to the band' do
      expect(new_band_member({'drummer' => 'kermit'})).to eq({'vocalist' => 'miss piggy', 'lead_guitar' => 'scooter', 'drummer' => 'kermit'})
    end
  end

  describe 'all_values' do
    it 'takes one hash and returns all the values' do
      expect(all_values({'one' => 1, 'two' => 2, 'three' => 3})).to eq [1,2,3]
    end
  end

  describe 'all_keys' do
    it 'takes one hash and returns all the keys' do
      expect(all_keys({'one' => 1, 'two' => 2, 'three' => 3})).to eq ['one', 'two', 'three']
    end
  end

  describe 'remove_nils_from_hash' do
    it 'takes one hash and a hash with no nils' do
      expect(remove_nils_from_hash({'one' => nil, 'two' => 2, 'three' => 3})).to eq({'two' => 2, 'three' => 3})
    end
  end

  describe 'key_value_swap' do
    it 'takes a hash and returns a hash with the keys and values swapped' do
      expect(key_value_swap({'one' => 1, 'two' => 2, 'three' => 3})).to eq({1 => 'one', 2 => 'two', 3 => 'three'})
    end
  end

  describe 'touch_in' do
    it 'takes a station and time and returns a hash with those as values' do
      expect(touch_in('Aldgate East', '2022/01/30 11:12')).to eq({'entrypoint' => 'Aldgate East', 'time' => '2022/01/30 11:12'})
    end
  end
end
