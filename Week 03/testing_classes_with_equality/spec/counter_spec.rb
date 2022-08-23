require "counter.rb"

RSpec.describe Counter do
  describe "counts" do
    it "0 by default" do
      counter = Counter.new
      result = counter.report
      expect(result).to eq "Counted to 0 so far."
    end
    
    it "to 1" do
      counter = Counter.new
      counter.add(1)
      result = counter.report
      expect(result).to eq "Counted to 1 so far."
    end

    it "to 100" do
      counter = Counter.new
      counter.add(100)
      result = counter.report
      expect(result).to eq "Counted to 100 so far."
    end

    it "to 1,000,000" do
      counter = Counter.new
      counter.add(1000000)
      result = counter.report
      expect(result).to eq "Counted to 1000000 so far."
    end

    it "to -50" do
      counter = Counter.new
      counter.add(-50)
      result = counter.report
      expect(result).to eq "Counted to -50 so far."
    end

    # it "but gives error when 5.75" do
    #
    # end
  end
end
