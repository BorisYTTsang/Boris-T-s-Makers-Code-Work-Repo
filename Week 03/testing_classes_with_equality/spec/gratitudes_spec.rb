require "gratitudes.rb"

RSpec.describe Gratitudes do
  describe "#add" do
    it "adds an element" do
      gratitudes = Gratitudes.new
      result = gratitudes.add("being alive")
      expect(result).to eq ["being alive"]
    end

    it "adds multiple elements" do
      gratitudes = Gratitudes.new
      gratitudes.add("being alive")
      gratitudes.add("having food")
      gratitudes.add("having shelter")
      result = gratitudes.add("having internet")
      expect(result).to eq ["being alive", "having food", "having shelter", "having internet"]
    end
  end

  describe "#format" do
    it "outputs default string" do
      gratitudes = Gratitudes.new
      result = gratitudes.format
      expect(result).to eq "Be grateful for: "
    end

    it "presents single element as a string" do
      gratitudes = Gratitudes.new
      gratitudes.add("being alive")
      result = gratitudes.format
      expect(result).to eq "Be grateful for: being alive"
    end

    it "presents multiple elements as a string" do
      gratitudes = Gratitudes.new
      gratitudes.add("being alive")
      gratitudes.add("having food")
      gratitudes.add("having shelter")
      gratitudes.add("having internet")
      result = gratitudes.format
      expect(result).to eq "Be grateful for: being alive, having food, having shelter, having internet"
    end
  end
end
