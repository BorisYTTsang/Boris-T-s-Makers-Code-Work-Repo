class TrackList
  def initialize
    @tracks = []
  end

  def add(track)
    if track.class != String
        fail "Please enter as text!"
    else
        if @tracks.include?(track)
            return "The track already exists!"
        else
            @tracks << track
        end
    end
end

  def list
    # return @tracks.join("\n")
    @tracks.each { |x| puts x }
  end
end