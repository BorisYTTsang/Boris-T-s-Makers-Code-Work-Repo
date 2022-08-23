=begin
=end

require_relative "../spec/long_passage.rb"

class DiaryEntry

  attr_accessor :title, :contents

  def initialize(title, contents) # title, contents are strings
    # ...
    @title = title
    @contents = contents
  end

  def title
    # Returns the title as a string
    return @title
  end

  def contents
    # Returns the contents as a string
    return @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split.size
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    # method reading_time takes (word_total) integer as argument
      word_total = @contents.split.size
      if word_total == nil
        fail "You didn't provide a word count!"
      elsif word_total.to_i.negative?()
        fail "No negative word counts, please!"
      elsif word_total.class == String
        fail "Please provide a number for the word count."
      elsif word_total.class == Float
        fail "Please enter a whole number."
      elsif word_total.class == Integer
        if word_total == 0
          fail "0 words not allowed!"
        elsif word_total > 0 && word_total < 200
          return(
            "This entry of #{word_total} words will take you less than a minute to read at #{wpm} wpm."
          )
        elsif word_total == 200
          return(
            "This entry of #{word_total} words will take you 0 hours and 1 minute to read at #{wpm} wpm."
          )
        elsif word_total > 200
          time_to_read_mins = (word_total / 200)
          time_to_read_hours = time_to_read_mins / 60
          left_over_mins = time_to_read_mins - (time_to_read_hours.floor * 60)
          # rem_time_to_read_mins = (word_total % 200)
          # time_to_read_hours = (word_total / 60 / 60).floor
          # time_to_read_hours = ((word_total / 200) / 60).floor
          return(
            "This entry of #{word_total} words will take you #{time_to_read_hours} hours and #{left_over_mins} minutes to read at #{wpm} wpm."
          )
        else
          return "test"
        end
      end
    end

  def reading_chunk(wpm, minutes)
    #   words_we_can_read = wpm * minutes
    #   start_from = @furthest_word_read
    #   end_at = @furthest_word_read + words_we_can_read
    #   content_list = @contents.split(" ")[start_from, end_at]
    #   @furthest_word_read = end_at
    #   return content_list.join(" ")
    # end
  # def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
  #                                 # of words the user can read per minute
  #                                 # `minutes` is an integer representing the
  #                                 # number of minutes the user has to read
  #   # Returns a string with a chunk of the contents that the user could read
  #   # in the given number of minutes.
  #   # If called again, `reading_chunk` should return the next chunk, skipping
  #   # what has already been read, until the contents is fully read.
  #   # The next call after that it should restart from the beginning.

    contents_arr = @contents.split(" ")
    chunk_arr = [*contents_arr[0..(wpm * minutes - 1)]]
    @contents = (contents_arr - chunk_arr).join(" ")
    if reset_prompt?
      p "Nothing left to read! Would you like to start from the beginning?"
      get
    else
      return chunk_arr.join(" ")
    end
  end

  def give_word_number(word)
    contents_arr = @contents.downcase.split(" ")
    contents_arr = contents_arr.map { |element| contents_arr.find_index(element) if element == word }
  end

  def reset_prompt
    private
    p
  end
end
