# require "diary_entry"
# require "long_passage"

# =begin

# X diary_entry.title = Wrong number of arguments
# X diary_entry.tltle(Title only)
# X diary_entry.title("Today, I matured.") => "This entry's title is "Today, I matured.""
# X diary_entry.contents("Who would have known that getting really good at DDR would make me feel like such an adult! Get in!")
# X diary_entry.count_words(^contents) => 20
# X diary_entry.reading_time(20 words, 200wpm) => "This entry of 20 words will take you less than a minute to read."
# X diary_entry.reading_time(200 words) => "This entry of 200 words will take you 0 hours and 1 minute to read."
# X diary_entry.reading_time(6000 words) => "This entry of 6000 words will take you 0 hours and 30 minutes to read."
# X diary_entry.reading_time(80000 words) => "This entry of 80000 words will take you 6 hours and 40 minutes to read."
# diary_entry.reading_chunk(2wpm, 5 minutes) => 10words
# diary_entry.reading_chunk(100wpm, 1000 words) =>
# diary_entry.reading_chunk(1000wpm, 800 words) =>

# =end

# RSpec.describe DiaryEntry do
#   describe "diary_entry object" do
#     context "when instantiated with no arguments" do
#       it "fails with argument error" do
#         expect { diary_entry = DiaryEntry.new }.to raise_error(ArgumentError)
#       end
#     end
#   end

#   describe "#title" do
#     it "returns title of entry as string" do
#       title = "Today, I matured."
#       contents = "Who would have known that getting really good at DDR would make me feel like such an adult! Get in!"
#       diary_entry = DiaryEntry.new(title, contents)
#       expect(diary_entry.title).to eq "Today, I matured."
#     end

#     context "except when only title given" do
#       it "fails with argument error" do
#         title = "Today, I matured."
#         expect { diary_entry = DiaryEntry.new(title) }.to raise_error(ArgumentError)
#       end
#     end
#   end

#   describe "#contents" do
#     it "returns contents of entry as string" do
#       title = "Today, I matured."
#       contents = "Who would have known that getting really good at DDR would make me feel like such an adult! Get in!"
#       diary_entry = DiaryEntry.new(title, contents)
#       expect(diary_entry.contents).to eq "Who would have known that getting really good at DDR would make me feel like such an adult! Get in!"
#     end

#     context "except when only contents given" do
#       it "fails with argument error" do
#         contents = "Who would have known that getting really good at DDR would make me feel like such an adult! Get in!"
#         expect { diary_entry = DiaryEntry.new(contents) }.to raise_error(ArgumentError)
#       end
#     end
#   end

#   describe "#count_words" do
#     it "returns contents word total as an integer" do
#       title = "Today, I matured."
#       contents = "Who would have known that getting really good at DDR would make me feel like such an adult! Get in!"
#       diary_entry = DiaryEntry.new(title, contents)
#       expect(diary_entry.count_words).to eq 20
#     end
#   end

#   describe "#reading_time" do
#     it "returns \"less than minute\" string when reading time is less than one minute" do
#       title = "Today, I matured."
#       contents = "Who would have known that getting really good at DDR would make me feel like such an adult! Get in!"
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_time(200)
#       expect(result).to eq "This entry of 20 words will take you less than a minute to read at 200 wpm."
#     end

#     it "returns \"one minute\" string when reading time is one minute" do
#       title = "Today, I matured."
#       contents = ("one " * 200)
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_time(200)
#       expect(result).to eq "This entry of 200 words will take you 0 hours and 1 minute to read at 200 wpm."
#     end

#     it "returns \"multiple minute\" string when reading time is one minute" do
#       title = "Today, I matured."
#       contents = ("one " * 6000)
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_time(200)
#       expect(result).to eq "This entry of 6000 words will take you 0 hours and 30 minutes to read at 200 wpm."
#     end

#     it "returns \"multiple minute\" string when reading time is one minute" do
#       title = "Today, I matured."
#       contents = ("one " * 80000)
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_time(200)
#       expect(result).to eq "This entry of 80000 words will take you 6 hours and 40 minutes to read at 200 wpm."
#     end
#   end

#   describe "#reading_chunk" do
#     it "cuts text after 10th word given 2wpm and 1 minute" do
#       title = "Today, I matured."
#       contents = ("one two three four")
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_chunk(2, 1)
#       expect(result).to eq "one two"
#     end

#     it "chunk once, return remaining text" do
#       title = "Today, I matured."
#       contents = ("This is a string, hello.")
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_chunk(2, 1)
#       expect(result).to eq "This is"


#     end

#     it "cuts twice, cuts first chunk from remaining text" do
#       title = "Today, I matured."
#       contents = ("This is a string, hello.")
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_chunk(2, 1)
#       result = diary_entry.reading_chunk(2, 1)
#       expect(result).to eq "a string,"
#     end

#     it "cuts thrice" do
#       title = "Today, I matured."
#       contents = ("This is a string, hello.")
#       diary_entry = DiaryEntry.new(title, contents)
#       result = diary_entry.reading_chunk(2, 1)
#       result = diary_entry.reading_chunk(2, 1)
#         result = diary_entry.reading_chunk(2, 1)
#       expect(result).to eq "hello."
#     end

#     context "when no content left to read"
#       it "gives prompt to restart passage" do
#         title = "Today, I matured."
#         contents = ("This is a string, hello.")
#         diary_entry = DiaryEntry.new(title, contents)
#         result = diary_entry.reading_chunk(2, 1)
#         result = diary_entry.reading_chunk(2, 1)
#           result = diary_entry.reading_chunk(2, 1)
#         expect(result).to eq "hello."
#       end
#     end

#     it "cuts something crazy" do
#       title = "Today, I matured."
#       contents = ("This is a string, hello.")
#     end
#   end


#   # context "word_total is 59" do
#   #   it "give the reading_time for a text assuming 200wpm" do
#   #     result = reading_time(20)
#   #     expect(
#   #       result
#   #     ).to eq "59 words will take you less than a minute to read at 200 wpm."
#   #   end
#   # end
#   #
#   # context "word_total is 200" do
#   #   it "give the reading_time for a text assuming 200wpm" do
#   #     result = reading_time(200)
#   #     expect(
#   #       result
#   #     ).to eq "200 words will take you 0 hours and 1 minute to read at 200 wpm."
#   #   end
#   # end
#   #
#   # context "word_total for document" do
#   #   it "give the reading_time for a text assuming 200wpm" do
#   #     result = reading_time(6000)
#   #     expect(
#   #       result
#   #     ).to eq "6000 words will take you 0 hours and 30 minutes to read at 200 wpm."
#   #   end
#   # end
#   #
#   # context "word_total for novel" do
#   #   it "give the reading_time for a text assuming 200wpm" do
#   #     result = reading_time(80_000)
#   #     expect(
#   #       result
#   #     ).to eq "80000 words will take you 6 hours and 40 minutes to read at 200 wpm."
#   #   end
#   # end

# end
