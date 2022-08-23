require "diary.rb"

=begin

# diary = Diary.new
#     => (constructs Diary object)
# diary.read
#     => []
# diary.add(123)
#     => RuntimeError ("Please only enter Strings!")
# diary.add(["Hello."])
#     => RuntimeError ("Please only enter Strings!")
# diary.add("Today, I went to the park. It was lovely.")
# diary.read
#     => "Today, I went to the park."
# diary.add("Today, I went to the park. It was lovely.")
# diary.add("Today, I had sushi. It was delicious.")
# diary.add("Today, I slept. Zzz...")
# diary.read
#     => ["Today, I went to the park. It was lovely.", "Today, I had sushi. It was delicious.", "Today, I slept. Zzz..."]

# diary.select_readable(nil)
#     => ArgumentError
# diary.select_readable("Entry 1")
#     => ArgumentError
# diary.select_readable("Entry 1", "Entry 2", "Entry 3")
#     => ArgumentError
# diary.select_readable(2, "String")
#     => RuntimeError
# diary.select_readable(2, 2)
#     => []
# diary.add("Today, I went to the park. It was lovely.")
# diary.add("I am sleepy.")
# diary.select_readable(2, 2)
    # => ["I am sleepy."] 

# diary.add("07478544087 was the number I got ;)")
# diary.list_contacts 
#     => [07478544087]
# diary.add(Mob: 07338 912 223)
# diary.list_contacts 
    # => [07338912223]
# diary.add(Car Insurance mob :/do/07558 811119)
# diary.list_contacts 
#     => [07558811119]
# diary.add(These are the numbers:- 07979512201 & 07242654909)
# diary.list_contacts
#     => [07979512201, 07242654909]
# diary.add(01274 999998 07242654909)
# diary.list_contacts 
#     => [01274999998, 07242654909]
# diary.add(0724265490907979512201)
# diary.list_contacts
#     => [07242654909, 07979512201]
# diary.add(073333122879)
# diary.list_contacts 
#     => [07333312287]
diary.add(9073333122871)
diary.list_contacts 
    => [07333312287]

=end

RSpec.describe Diary do
    it "constructs" do
        diary = Diary.new
    end

    it "adds and lists one entry" do
        diary = Diary.new
        diary.add("Today, I went to the park. It was lovely.")
        expect(diary.read).to eq ["Today, I went to the park. It was lovely."]
    end

    it "adds and lists multiple entries" do
        diary = Diary.new
        diary.add("Today, I went to the park. It was lovely.")
        diary.add("Today, I had sushi. It was delicious.")
        diary.add("Today, I slept. Zzz...")
        expect(diary.read).to eq ["Today, I went to the park. It was lovely.", "Today, I had sushi. It was delicious.", "Today, I slept. Zzz..."]
    end

    describe "#read" do
        context "when integer given" do
            it "raises RuntimeError (not a String)" do
                diary = Diary.new
                expect{ (diary.add(123)) }.to raise_error "Please enter a String!" 
            end
        end

        context "when array given" do
            it "raises RuntimeError (not a String)" do
                diary = Diary.new
                expect{ (diary.add(["Hello."])) }.to raise_error "Please enter a String!" 
            end
        end
    end

    describe "#add" do
        context "when no entries exist" do
            it "returns empty list" do
                diary = Diary.new
                expect(diary.read).to eq []
            end
        end
    end

    describe "#select_readable" do
        it "filters out entries not readable in specified time and reading speed" do
            diary = Diary.new
            diary.add("Today, I went to the park. It was lovely.")
            diary.add("I am sleepy.")
            expect(diary.select_readable(2, 2)).to eq ["I am sleepy."]
        end

        it "filters out entries not readable in specified time and reading speed" do
            diary = Diary.new
            diary.add("I hate my life.")
            diary.add("Today, I went to the park. It was lovely.")
            diary.add("This is the best trip I've ever taken - It was positively breath-taking!")
            diary.add("I am sleepy.")
            expect(diary.select_readable(2, 2)).to eq ["I hate my life.", "I am sleepy."]
        end

        context "when no argument given" do
            it "raises ArgumentError" do
                diary = Diary.new
                expect{ (diary.select_readable) }.to raise_error(ArgumentError)
            end
        end

        context "when only one argument given" do
            it "raises ArgumentError" do
                diary = Diary.new
                expect{ (diary.select_readable(2)) }.to raise_error(ArgumentError)
            end
        end

        context "when more than two arguments given" do
            it "raises ArgumentError" do
                diary = Diary.new
                expect{ (diary.select_readable(2, 2, 2)) }.to raise_error(ArgumentError)
            end
        end

        context "when non-Integer argument given" do
            it "raises RuntimeError (not an Integer)" do
                diary = Diary.new
                expect{ (diary.select_readable(2, "String")) }.to raise_error "Please enter only Integers!"
            end
        end

        context "when non-Integer argument given" do
            it "raises RuntimeError (not an Integer)" do
                diary = Diary.new
                expect{ (diary.select_readable("String", 1)) }.to raise_error "Please enter only Integers!"
            end
        end

        context "when non-Integer argument given" do
            it "raises RuntimeError (not an Integer)" do
                diary = Diary.new
                expect{ (diary.select_readable(["Hello."], "String")) }.to raise_error "Please enter only Integers!"
            end
        end

        context "when no entries exist" do
            it "returns empty list" do
                diary = Diary.new
                expect(diary.select_readable(2, 2)).to eq []
            end
        end
    end

    describe "#list_contacts" do
        it "adds multiple mobile numbers" do
            diary = Diary.new
            diary.add("These are the numbers:- 07979512201 & 07242654909")
            expect(diary.list_contacts).to eq ["07979512201", "07242654909"]
        end

        context "when mobile number has no spaces" do
            it "returns mobile number in array" do
                diary = Diary.new
                diary.add("07478544087 was the number I got ;)")
                expect(diary.list_contacts).to eq ["07478544087"]
            end
        end

        context "when mobile number has 2 spaces" do
            it "returns mobile number in array" do
                diary = Diary.new
                diary.add("Mob: 07338 912 223")
                expect(diary.list_contacts).to eq ["07338912223"]
            end
        end

        context "when mobile number has 1 space and not preceded by whitespace" do
            it "returns mobile number in array" do
                diary = Diary.new
                diary.add("Car Insurance mob :/do/07558 811119")
                expect(diary.list_contacts).to eq ["07558811119"]
            end
        end

        context "when landline number given" do
            it "filters it out" do
                diary = Diary.new
                diary.add("01274 999998 07242654909")
                diary.list_contacts 
                expect(diary.list_contacts).to eq ["07242654909"]
            end
        end

        context "when numbers conjoined" do
            it "separates them out" do
                diary = Diary.new
                diary.add("0724265490907979512201")
                expect(diary.list_contacts).to eq ["07242654909", "07979512201"]
            end
        end

        context "when more than 11 digits" do
            it "ignores extra digits and returns 11 digit number" do
                diary = Diary.new
                diary.add("073333122879")
                expect(diary.list_contacts).to eq ["07333312287"]
            end
        end

        context "when number preceded directly by another digit" do
            it "ignores extra starting digits and returns 11 digit number" do
                diary = Diary.new
                diary.add("9073333122871")
                expect(diary.list_contacts).to eq ["07333312287"]
            end
        end

        context "when number has 07 in it more than once" do
            it "still extracts numbers correctly" do
                diary = Diary.new
                diary.add("07307310787")
                expect(diary.list_contacts).to eq ["07307310787"]
            end
        end

        context "when multiple numbers given" do
            it "extracts all numbers correctly" do
                diary = Diary.new
                diary.add("07307310787 = Sarah. 07950010539 = Jackie.")
                expect(diary.list_contacts).to eq ["07307310787", "07950010539"]
            end
        end
    end
end