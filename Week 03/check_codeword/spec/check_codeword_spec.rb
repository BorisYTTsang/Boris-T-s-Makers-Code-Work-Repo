require "check_codeword.rb"

RSpec.describe "check_codeword method" do
  context "when valid" do
    it "returns Correct! Come in." do
      result = check_codeword("horse")
      expect(result).to eq("Correct! Come in.")
    end
  end
  context "when only first and last characters match" do
    it "returns Close, but nope." do
      result = check_codeword("hsyve")
      expect(result).to eq("Close, but nope.")
    end
  end
  context "when invalid" do
    it "returns WRONG!" do
      result = check_codeword("mvseo")
      expect(result).to eq("WRONG!")
    end
  end
end
