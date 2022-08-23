require "sentence_checker"

=begin

X sentence_checker(nil) => "You didn't enter anything!"
X sentence_checker("") => "You didn't enter anything!"
X sentence_checker(non_string) => "You didn't enter a string!"
X sentence_checker("hello world.") => "You forgot to capitalise the first word!"
X sentence_checker("Hello world") => "You forgot to/didn't punctuate appropriately at the end with . or ? or !"
X sentence_checker("Hello world,") => "You forgot to/didn't punctuate appropriately at the end with . or ? or !"
X sentence_checker("hello world") => "You forgot to capitalize AND didn't punctuate with . or ? or !"
X sentence_checker("hello world,") => "You forgot to capitalize AND didn't punctuate with . or ? or !"
X sentence_checker("Hello world, nice to meet you!") => "Great! This sentence looks great!"
X sentence_checker("Hello world?") "Great! This sentence looks great!"
X sentence_checker("There once was a man from Rome, who really couldn't find a home, so
X he went out to sea, and search it did he, until it became his new home.") => "Great! This sentence looks great!"

=end

RSpec.describe "sentence_checker method" do
  context "when no argument given" do
    it "fails with message" do
      expect{ sentence_checker(nil) }.to raise_error "You didn't enter anything!"
    end
  end

  context "when empty string given" do
    it "fails with message" do
      expect{ sentence_checker("") }.to raise_error "You didn't enter anything!"
    end
  end

  context "when non-string given" do
    it "fails with message" do
      expect{ sentence_checker(20)
      }.to raise_error "You didn't enter a string!"
    end
  end

  context "when first letter isn't capitalised" do
    it "alerts user" do
      expect( sentence_checker("hello world.") ).to eq "You forgot to capitalise the first word!"
    end
  end

  context "when appropriate ending punctuation missing" do
    it "alerts user" do
      expect( sentence_checker("Hello world") ).to eq "You forgot to/didn't punctuate appropriately at the end with . or ? or !"
    end
  end

  context "when inappropriate ending punctuation given" do
    it "alerts user" do
      expect( sentence_checker("Hello world,") ).to eq "You forgot to/didn't punctuate appropriately at the end with . or ? or !"
    end
  end

  context "when BOTH first letter isn't capitalised AND no appropriate ending punctuation given" do
    it "alerts user" do
      expect( sentence_checker("hello world") ).to eq "You forgot to capitalize AND didn't punctuate with . or ? or !"
    end
  end

  context "when BOTH first letter isn't capitalised and INappropriate ending punctuation given" do
    it "alerts user" do
      expect( sentence_checker("hello world,") ).to eq "You forgot to capitalize AND didn't punctuate with . or ? or !"
    end
  end

  context "when BOTH capitalised and appropriately punctuated (correct sentence)" do
    it "praises user" do
      expect( sentence_checker("Hello world, nice to meet you!") ).to eq "Great! This sentence looks great!"
    end
  end

  context "when ? used as ending punctuation" do
    it "passes and praises user" do
      expect( sentence_checker("Hello world?") ).to eq "Great! This sentence looks great!"
    end
  end

  context "when ! used as ending punctuation and longer passage given" do
    it "passes and praises user" do
      expect( sentence_checker("There once was a man from Rome, who really couldn't find a home, so
      he went out to sea, and search it did he, until it became his new home.") ).to eq "Great! This sentence looks great!"
    end
  end

end
