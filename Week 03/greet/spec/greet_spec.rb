require "greet"

RSpec.describe "greet_method" do
  it "greets Boris" do
    result = greet("Boris")
    expect(result).to eq "Hello, Boris!"
  end
end
