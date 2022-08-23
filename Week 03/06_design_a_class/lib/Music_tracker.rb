=begin
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

#1. Describe the problem 
#Create program that creates list of music that is listened to and also can add tracks to the program.

#2. Design the method signature - include the name of the method, its parameters, data types, return value and side effects.
def initialize
    @arr = []
end

def add(track - string, artist - string)
    return @arr array
end

def list
    return @arr convert to string
end

#3. Create examples as tests
#4 Implement the behaviour - After each test you write follow the test-driving process

#5 Extra thoughts
What if you need the year it was released, date added, most listened to, spotify chart ranking
keyword arguments
=end

class MusicTracker

    attr_accessor :array

    def initialize
     @array = []
    end

    def add(artist, track)
        fail "Please enter only strings!" if track.class != String || artist.class != String
        
        # Check if artist(key) already exists
        if @array.any? { |x| x.keys.join == artist }
            # Check if track already exists
            if @array.any? { |x| x.values.join.include?(track) }
                # Error message if track already exists (not unique)
                fail "You've already entered that song!"
            else     
                # If track doesn't exist, add to array value for artist key
                @array.each { |x| x[artist] << track if x.keys.join == artist }
                return @array
            end
        else
            # Add new artist and track array pair if artist doesn't already exist
            return @array << {artist => [track]}
        end
       
    end

    def list
        new_array = @array.map do |x|
            x.map do |k, v|
                puts "#{k.upcase}:"
                v.each{ |x| puts "- #{x.capitalize}" }
                "#{k.upcase}: #{v.join(", ")}. "
            end
        end

        return new_array.join

    end

end