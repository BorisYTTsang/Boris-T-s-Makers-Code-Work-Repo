require "todo_checker"

=begin

  X todo_checker(nil) => "You didn't enter anything!"
  X todo_checker("") => "You didn't enter anything!"
  X todo_checker("#TODO - Take out the trash.", "I really want an ice-cream...") => "Please provide all text in one go!"
  X todo_checker(500) => "You didn't enter a string!"
  X todo_checker(["This", "is", "Sparta!"]) => "You didn't enter a string!"
  X todo_checker("Throw out the trash.") => "No #TODOs detected!"
  X todo_checker("I need to do my homework") => "No #TODOs detected!"
  X todo_checker("TODO:- Buy some mosquito repellent!") => "No #TODOs detected!"
  X todo_checker("02/04/22: # ToDo:- Get ingredients for Mom's cake!") => "No #TODOs detected!"
  X todo_checker("02/04/22: #To do:- Get ingredients for Mom's cake!") => "No #TODOs detected!"
  X todo_checker("02/04/22: #TodO:- Get ingredients for Mom's cake!") => "No #TODOs detected!"
  X todo_checker("#TODO: Celebrate Mom's birthday.") => "There are #TODOs in this text!"
  X todo_checker("This is a todo list for 01/04/22. #TODO:- Get ingredients for Mom's cake!") => "There are #TODOs in this text!"
  X todo_checker("This is a todo list for 01/04/22. #TODO:- Get ingredients for Mom's cake! #TODO - Prepare for trip to Alton Towers.") => "There are #TODOs in this text!"
  X todo_checker("I have to check #TODOs." => "There are #TODOs in this text!"

=end

RSpec.describe "todo_checker method" do

  context "when no argument given" do
    it "fails with <no argument> error message" do
      expect { todo_checker() }.to raise_error "You didn't enter anything!"
    end
  end

  context "when empty string given" do
    it "fails with <no argument> error message" do
      expect { todo_checker("") }.to raise_error "You didn't enter anything!"
    end
  end

  context "when more than one argument given" do
    it "fails with <too many arguments> error message" do
      expect { todo_checker("#TODO - Take out the trash.", "I really want an ice-cream...") }.to raise_error "Please provide all text in one go!"
    end
  end

  context "when integer given" do
    it "fails with <non-string> error message" do
      expect { todo_checker(500) }.to raise_error "You didn't enter a string!"
    end
  end

  context "when array of strings given" do
    it "fails with <non-string> error message" do
      expect { todo_checker(["This", "is", "Sparta!"]) }.to raise_error "You didn't enter a string!"
    end
  end

  context "when no \"#TODO\" substring detected" do
    it "returns message for no #TODO" do
      expect(todo_checker("Throw out the trash.")).to eq "No #TODOs detected!"
    end
  end

  context "when substring is close (\"to do\")" do
    it "returns message for no #TODO" do
      expect(todo_checker("I need to do my homework")).to eq "No #TODOs detected!"
    end
  end

  context "when substring is close (\"TODO\")" do
    it "returns message for no #TODO" do
      expect(todo_checker("TODO:- Buy some mosquito repellent!")).to eq "No #TODOs detected!"
    end
  end

  context "when substring is close (\"# ToDo\")" do
    it "returns message for no #TODO" do
      expect(todo_checker("02/04/22: # ToDo:- Get ingredients for Mom's cake!")).to eq "No #TODOs detected!"
    end
  end

  context "when substring is close (\"#To do\")" do
    it "returns message for no #TODO" do
      expect(todo_checker("02/04/22: #To do:- Get ingredients for Mom's cake!")).to eq "No #TODOs detected!"
    end
  end

  context "when substring is close (\"#TodO\")" do
    it "returns message for no #TODO" do
      expect(todo_checker("02/04/22: #TodO:- Get ingredients for Mom's cake!")).to eq "No #TODOs detected!"
    end
  end

  context "when substring is present" do
    it "returns message for contains #TODO" do
      expect(todo_checker("#TODO: Celebrate Mom's birthday.")).to eq "There are #TODOs in this text!"
    end
  end

  context "when substring is present in longer string and in the middle" do
    it "returns message for contains #TODO" do
      expect(todo_checker("This is a todo list for 01/04/22. #TODO:- Get ingredients for Mom's cake!")).to eq "There are #TODOs in this text!"
    end
  end

  context "when multiple instances of substring are present" do
    it "returns message for contains #TODO" do
      expect(todo_checker("This is a todo list for 01/04/22. #TODO:- Get ingredients for Mom's cake! #TODO - Prepare for trip to Alton Towers.")).to eq "There are #TODOs in this text!"
    end
  end

  context "when substring not used as a header and is at the end of string" do
    it "returns message for contains #TODO" do
      expect(todo_checker("I have to check #TODOs.")).to eq "There are #TODOs in this text!"
    end
  end

end
