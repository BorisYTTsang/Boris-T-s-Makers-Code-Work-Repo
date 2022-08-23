require "tracks"

=begin
X tracks.add(nil) => ArgumentError
X tracks.list => []
X tracks.add("Levitating")
X racks.add("Levitating"), tracks.add("Shape of You"), tracks.list => ["Levitating", "Shape of You"]
X tracks.add("Levitating"), tracks.list =>["Levitating"] 
X tracks.add("Levitating", "Shape of You") => ArgumentError
X tracks.add(non-string) => Error
X tracks.add("Levitating"), tracks.add("Levitating") => "That track already exists!"
=end

RSpec.configure do |config|
	config.color = true
	config.formatter = :documentation
	config.order = 'default'
  end

  
RSpec.describe TrackList do 
  context " adds and lists tracks" do
    it "should return nil as no argument is provided" do
     tracks = TrackList.new
     expect{ (tracks.add) }.to raise_error(ArgumentError)
    end
  end

  context " adds a track to the tracklist" do
    it " takes a string argument and adds it to the tracks array" do
      tracks = TrackList.new
      result = tracks.add("Levitating")
      expect(result).to eq ["Levitating"]
    end
  end

  context " adds a track to the tracklist and list to return tracklist" do
    it " adds track to the tracks array, then list to return tracklist" do
      tracks = TrackList.new
      tracks.add("Levitating")
	    result = tracks.list
      expect(result).to eq "Levitating"
    end
  end

  context "adds a track to the tracklist and list to return tracklist" do
    it "adds multiple tracks to the tracks array, then lists all tracks in tracklist" do
      tracks = TrackList.new
      tracks.add("Mistletoe and Wine")
      tracks.add("The Only Way is Up")
	    tracks.add("I Should Be So Lucky")
	    result = tracks.list
      expect(result).to eq "Mistletoe and Wine\nThe Only Way is Up\nI Should Be So Lucky"
    end
  end
  
  context " if more than one track give to add method" do
    it " give an ArgumentError" do
      tracks = TrackList.new
      expect{ (tracks.add("Levitating", "Shape of You")) }.to raise_error(ArgumentError)
    end
  end

  context " if non-string given to add method" do
    it " give an Non-String Error" do
      tracks = TrackList.new
      expect{ (tracks.add(123)) }.to raise_error "Please enter as text!"
    end
  end

  context "adds a track to the tracklist and list to return tracklist" do
    it "adds multiple tracks to the tracks array, then lists all tracks in tracklist" do
      tracks = TrackList.new
      tracks.add("Mistletoe and Wine")
      expect(tracks.add("Mistletoe and Wine")).to eq "The track already exists!"
    end
  end

  context "outputs tracklist from list method in vertical string format" do
    it "formats tracklist" do
      tracks = TrackList.new
      tracks.add("Mistletoe and Wine")
      tracks.add("The Only Way is Up")
	  tracks.add("I Should Be So Lucky")
	  result = tracks.list
      expect(result).to eq "Mistletoe and Wine\nThe Only Way is Up\nI Should Be So Lucky"
    end
  end

end

