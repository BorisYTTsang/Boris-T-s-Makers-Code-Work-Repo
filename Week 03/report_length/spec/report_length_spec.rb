require "report_length.rb"

RSpec.describe "report_length method" do
  it "returns 6 for \"length\"" do
    result = report_length("length")
    expect(result).to eq "This string was 6 characters long."
  end

  it "returns 34 for \"supercalifragilisticexpialidocious\"" do
    result = report_length("supercalifragilisticexpialidocious")
    expect(result).to eq "This string was 34 characters long."
  end

  it "returns 1 for \"I\"" do
    result = report_length("I")
    expect(result).to eq "This string was 1 characters long."
  end

  it "returns 0 for \"\"" do
    result = report_length("")
    expect(result).to eq "This string was 0 characters long."
  end

  # it "returns nil for nil" do
  #   result = report_length(nil)
  #   expect(result).to eq nil
  # end
end
