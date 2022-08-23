require "grammar_stats"

RSpec.describe GrammarStats do
    describe "#check" do
        context "checks if no argument" do
            grammar_stats = GrammarStats.new
            it "raises error_message if no argument"  do
            expect { grammar_stats.check(nil) }.to raise_error "You didn't enter anything!"
            end
        end

        context "checks if sentence begins with a capital letter" do
            grammar_stats = GrammarStats.new
            it "returns false if sentence doesn't begin with a capital" do
            expect(grammar_stats.check("hello world.")).to eq false
            end
        end

        context "checks if sentence ends with punctuation" do
            grammar_stats = GrammarStats.new
            it "returns false if sentence doesn't end with punctuation (. or ! or ?)" do
            expect(grammar_stats.check("hello world.")).to eq false
            end 
        end

        context "checks if sentence begins with a capital letter and ends with punctuation" do
            grammar_stats = GrammarStats.new
            it "returns true if sentence begins with a capital and ends with punctuation (. or ! or ?)" do
            expect(grammar_stats.check("Hello world.")).to eq true
            end
        end
    end
    
    describe "#percentage_good" do
        context "Returns as an integer the percentage of texts checked so far that passed" do
            grammar_stats = GrammarStats.new
            it "divides the pass_counter by the full_counter and multiplies by 100" do
            expect(grammar_stats.percentage_good).to eq 20
            end
        end
    end

end