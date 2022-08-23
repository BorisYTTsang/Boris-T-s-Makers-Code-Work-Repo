require_relative '../lib/2_classes'

RSpec.describe 'classes' do
  describe 'Greeter' do

    subject { Greeter.new }

    describe 'hello' do
      it 'takes a name and returns "Hello, <name>"' do
        expect(subject.hello('Jo')).to eq 'Hello, Jo'
      end
    end

    describe 'goodbye' do
      it 'takes a name and returns "Goodbye, <name>"' do
        expect(subject.goodbye('Jo')).to eq 'Goodbye, Jo'
      end
    end

    describe 'goodnight' do
      it 'takes a name and returns "Goodnight, <name>"' do
        expect(subject.goodnight('Jo')).to eq 'Goodnight, Jo'
      end
    end

    describe 'goodmorning' do
      it 'takes a name and returns "Goodmorning, <name>"' do
        expect(subject.goodmorning('Jo')).to eq 'Goodmorning, Jo'
      end
    end
  end

  describe 'Calculator' do

    subject { Calculator.new }

    describe 'add' do
      it 'takes two numbers and returns the total' do
        expect(subject.add(1,1)).to eq 2
      end
    end

    describe 'multiply' do
      it 'takes two numbers and multiplies one by the other' do
        expect(subject.multiply(2,2)).to eq 4
      end
    end

    describe 'subtract' do
      it 'takes two numbers and subtracts the second from the first' do
        expect(subject.subtract(5,1)).to eq 4
      end
    end

    describe 'divide' do
      it 'takes two numbers and divides the first by the second' do
        expect(subject.divide(10,2)).to eq 5
      end
    end
  end

  describe 'Basket' do
    subject { Basket.new }

    describe 'add' do
      it 'adds items to the list of items' do
        subject.add('eggs')
        subject.add('milk')
        subject.add('bread')
        expect(subject.items).to eq ['eggs', 'milk', 'bread']
      end
    end
  end

  describe 'Cohort' do

    subject { Cohort.new }

    describe 'add_student' do
      it 'adds a student to the list of students' do

        subject.add_student({'name' => 'Gene', 'employer' => 'Atlantis Digital'})
        subject.add_student({'name' => 'Petra', 'employer' => 'Atlantis Digital'})
        subject.add_student({'name' => 'Jaspal', 'employer' => 'Mercia Digital'})

        expect(subject.students).to eq [
          {'name' => 'Gene', 'employer' => 'Atlantis Digital'},
          {'name' => 'Petra', 'employer' => 'Atlantis Digital'},
          {'name' => 'Jaspal', 'employer' => 'Mercia Digital'}
        ]
      end
    end

    describe 'employed_by' do

      before {
        subject.add_student({'name' => 'Gene', 'employer' => 'Atlantis Digital'})
        subject.add_student({'name' => 'Petra', 'employer' => 'Atlantis Digital'})
        subject.add_student({'name' => 'Jaspal', 'employer' => 'Mercia Digital'})
      }

      it 'takes the name of an employer and returns their students' do
        expect(subject.employed_by('Atlantis Digital')).to eq [
          {'name' => 'Gene', 'employer' => 'Atlantis Digital'},
          {'name' => 'Petra', 'employer' => 'Atlantis Digital'}
        ]
      end
    end
  end

  describe 'Person' do

    subject {
      Person.new(
        {
          'name' => 'Jo',
          'pets' => [
            {'name' => 'Paulo', 'animal' => 'cat'},
            {'name' => 'Edith', 'animal' => 'dog'},
            {'name' => 'Pawel', 'animal' => 'goldfish'}
          ],
          'addresses' => [
            {'name' => 'work', 'building' => '12', 'street' => 'Whitehall'},
            {'name' => 'home', 'building' => '1', 'street' => 'North Lane'}
          ]
        }
      )
    }

    describe 'work_address' do
      it 'returns work_address, nicely formatted' do
        expect(subject.work_address)
          .to eq '12 Whitehall'
      end
    end

    describe 'home_address' do
      it 'returns home_address, nicely formatted' do
        expect(subject.home_address)
          .to eq '1 North Lane'
      end
    end

    describe 'pets' do
      it 'returns pets, nicely formatted' do
        expect(subject.pets)
          .to eq "Jo has 3 pets\n- a cat called Paulo\n- a dog called Edith\n- a goldfish called Pawel\n"
      end
    end
  end
end
