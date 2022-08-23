require_relative '../lib/2_classes'

RSpec.describe 'classes' do
  describe 'Animal' do
    describe '.new' do
      it 'returns an instance of Animal' do
        expect(Animal.new).to be_a Animal
      end
    end
  end

  describe 'Vehicle' do
    describe '.new' do
      it 'returns an instance of Vehicle' do
        expect(Vehicle.new).to be_a Vehicle
      end
    end
  end

  describe 'Cat' do
    describe '#speak' do
      it 'returns miaow' do
        expect(Cat.new.speak).to eq 'miaow'
      end
    end
  end

  describe 'Dog' do
    describe '#speak' do
      it 'returns woof' do
        expect(Dog.new.speak).to eq 'woof'
      end
    end
  end

  describe 'StringFormatter' do

    subject { StringFormatter.new }

    describe 'block_caps' do
      it 'takes a string an returns the same chars in block caps' do
        expect(subject.block_caps('hello')).to eq 'HELLO'
      end
    end

    describe 'lower_case' do
      it 'takes a string an returns the same chars in lower case' do
        expect(subject.lower_case('HELLO')).to eq 'hello'
      end
    end
  end

  describe 'Calculator' do

    subject { Calculator.new }

    describe 'add' do
      it 'takes two numbers and returns the total' do
        expect(subject.add(5,5)).to eq 10
      end
    end

    describe 'multiply' do
      it 'takes two numbers and multiplies one by the other' do
        expect(subject.multiply(5,5)).to eq 25
      end
    end

    describe 'subtract' do
      it 'takes two numbers and subctracts the second from the first' do
        expect(subject.subtract(5,4)).to eq 1
      end
    end

    describe 'divide' do
      it 'takes two numbers and divides the first by the second' do
        expect(subject.divide(10,5)).to eq 2
      end
    end

  end

  describe 'Apprentice' do

    subject { Apprentice.new('Jude', 'August 2045')}

    describe 'name' do
      it 'returns name' do
        expect(subject.name).to eq 'Jude'
      end
    end

    describe 'cohort' do
      it 'returns cohort' do
        expect(subject.cohort).to eq 'August 2045'
      end
    end

    describe 'full_details' do
      it 'returns name and cohort' do
        expect(subject.full_details).to eq 'Jude, August 2045'
      end
    end

  end

  describe 'Cohort' do

    subject { Cohort.new('January 2060', '2060/01/01', '2060/01/08')}

    describe 'name' do
      it 'returns the name' do
        expect(subject.name).to eq 'January 2060'
      end
    end

    describe 'start_date' do
      it 'returns the start_date as a Date object' do
        expect(subject.start_date).to eq Date.parse('2060/01/01')
      end
    end

    describe 'end_date' do
      it 'returns the end_date as a Date object' do
        expect(subject.end_date).to eq Date.parse('2060/01/08')
      end
    end

    describe 'duration' do
      it 'returns the diff between start_date and end_date in days' do
        expect(subject.duration).to eq 7
      end
    end
  end
end
