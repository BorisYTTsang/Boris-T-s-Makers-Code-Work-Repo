require "Music_tracker.rb"

=begin
X music_tracker(empty?) => empty_error
X music_tracker.add(one arg) => ArgumentError
X music_tracker.add(non_string) => non_string_error
X music_tracker.add(non_unique) => non_unique_error
X music_tracker.add(song, artist) => @arr as an array with elements added
X music_tracker.add(song,artist)(song2, artist) => @arr as an array with elements added
X music_tracker.add(non_unique for more populated array) => non_unique_error
X music_tracker.list(@arr empty) => empty_error
music_tracker.list => @arr convert to string (formatting)
=end

RSpec.describe MusicTracker do

    describe "#add" do

        context "when no argument is given" do
            it "returns error message" do
                music_tracker = MusicTracker.new 
                expect{ music_tracker.add() }.to raise_error(ArgumentError)
            end
        end

        context "when one argument is given" do
            it "returns error message" do
                music_tracker = MusicTracker.new 
                expect{ music_tracker.add("Levitating") }.to raise_error(ArgumentError)
            end
        end

        context "when non_strings given as arguments" do
            it "returns an error message" do
                music_tracker = MusicTracker.new 
                expect{ music_tracker.add(123, 456) }.to raise_error "Please enter only strings!"
            end

        end
        
        context "when entered track string is not unique" do
            it "returns an error message" do
                music_tracker = MusicTracker.new
                music_tracker.add("Dua Lipa", "Levitating")
                expect{ music_tracker.add("Dua Lipa", "Levitating") }.to raise_error "You've already entered that song!"
            end
        end

        context "when entered track string is not unique" do
            it "returns an error message" do
                music_tracker = MusicTracker.new
                music_tracker.add("Dua Lipa", "Levitating")
                music_tracker.add("Dua Lipa", "One Kiss")
                music_tracker.add("Dua Lipa", "Break My Heart")
                music_tracker.add("Ed Sheeran", "Class A Team")
                expect{ music_tracker.add("Dua Lipa", "Levitating") }.to raise_error "You've already entered that song!"
            end
        end
    end

    describe "#list" do

        it "returns list of music" do
            music_tracker = MusicTracker.new
            music_tracker.add("Dua Lipa", "Levitating")
            expect(music_tracker.list).to eq [{"Dua Lipa" => ["Levitating"]}]
        end

        it "returns list of music" do
            music_tracker = MusicTracker.new
            music_tracker.add("Dua Lipa", "Levitating")
            music_tracker.add("Dua Lipa", "One Kiss")
            music_tracker.add("Dua Lipa", "Break My Heart")
            music_tracker.add("Ed Sheeran", "Class A Team")
            music_tracker.add("Ed Sheeran", "Shape of You")
            expect(music_tracker.list).to eq [{"Dua Lipa" => ["Levitating", "One Kiss", "Break My Heart"]}, {"Ed Sheeran" => ["Class A Team", "Shape of You"]}]
        end

        it "list returns [] if nothing added" do
            music_tracker = MusicTracker.new
            expect(music_tracker.list).to eq []
        end
    end       
end