require "task"

RSpec.describe Task do
  it "constructs" do
    task = Task.new("Walk the dog")
    expect(task.title).to eq "Walk the dog"
  end

  context "when initialized with no argument" do
    it "raises ArgumentError" do
      expect{ (task = Task.new) }.to raise_error(ArgumentError)
    end
  end

  context "when initialized with more than one argument" do
    it "raises ArgumentError" do
      expect{ (task = Task.new("arg_1", "arg_2")) }.to raise_error(ArgumentError)
    end
  end

  context "when initialized with non-String argument" do
    it "raises Non-String Error" do
      expect{ (task = Task.new(123)) }.to raise_error "Please enter a String!"
    end
  end

  it "can be marked as complete" do
    task = Task.new("Walk the dog")
    task.mark_complete
    expect(task.complete?).to eq true
  end
end
