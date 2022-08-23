require "string_builder.rb"

RSpec.describe StringBuilder do

  describe "#output" do
    it "defaults an empty string for instance variable" do
      string_builder = StringBuilder.new
      result = string_builder.output
      expect(result).to eq ""
    end
  end

  describe "#add" do
    it "adds a string and #outputs it" do
      string_builder = StringBuilder.new
      string_builder.add("planned")
      result = string_builder.output
      expect(result).to eq "planned"
    end

    it "can add multiple strings and output concatenated string" do
      string_builder = StringBuilder.new
      string_builder.add("planned")
      string_builder.add(" ")
      string_builder.add("obsolescence")
      result = string_builder.output
      expect(result).to eq "planned obsolescence"
    end
  end

  describe "#size" do
    it "returns default length of 0" do
      string_builder = StringBuilder.new
      result = string_builder.size
      expect(result).to eq 0
    end

    it "returns length of single string" do
      string_builder = StringBuilder.new
      string_builder.add("builder")
      result = string_builder.size
      expect(result).to eq 7
    end

    it "returns length of concatenated string" do
      string_builder = StringBuilder.new
      string_builder.add("sup")
      string_builder.add("erla")
      string_builder.add("tive")
      result = string_builder.size
      expect(result).to eq 11
    end
  end
end
