require_relative '../lib/3_conditionals'

RSpec.describe 'conditionals' do
  describe 'fizz_buzz' do
    it 'returns fizz, for 3' do
      expect(fizz_buzz(3)).to eq 'fizz'
    end

    it 'returns buzz, for 5' do
      expect(fizz_buzz(5)).to eq 'buzz'
    end

    it 'returns fizzbuzz, for 3' do
      expect(fizz_buzz(15)).to eq 'fizzbuzz'
    end

    it 'returns 1, for 1' do
      expect(fizz_buzz(1)).to eq '1'
    end
  end

  describe 'reply_to' do
    it 'replies to "hello" with "hi"' do
      expect(reply_to('hello')).to eq 'hi'
    end

    it 'replies to "good morning" with "good morning to you too"' do
      expect(reply_to('good morning')).to eq 'good morning to you too'
    end

    it 'replies to "howdy" with "howdy"' do
      expect(reply_to('howdy')).to eq 'howdy'
    end

    it 'replies to "bonjour" with "bonjour"' do
      expect(reply_to('bonjour')).to eq 'bonjour'
    end
  end

  describe 'deduct_10_if_possible' do
    it 'deducts 10 from 10' do
      expect(deduct_10_if_possible(10)).to eq 0
    end

    it 'deducts 10 from 11' do
      expect(deduct_10_if_possible(11)).to eq 1
    end

    it 'does not deduct 10 from 9' do
      expect(deduct_10_if_possible(9)).to eq 9
    end
  end

  describe 'top_up_to_100' do
    it 'returns 100, when given 5' do
      expect(top_up_to_100(5)).to eq 100
    end

    it 'returns 100, when given 99' do
      expect(top_up_to_100(99)).to eq 100
    end

    it 'returns 100, when given 100' do
      expect(top_up_to_100(100)).to eq 100
    end

    it 'returns 101, when given 101' do
      expect(top_up_to_100(101)).to eq 101
    end
  end
end