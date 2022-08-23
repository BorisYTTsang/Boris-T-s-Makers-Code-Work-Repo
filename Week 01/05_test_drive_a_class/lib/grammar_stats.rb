class GrammarStats
    def initialize
      # ...
      @pass_counter = 1
      @full_counter = 5
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
        fail "You didn't enter anything!" if text == nil || text == ""
        fail "You didn't enter a string!" if text.class != String
        @full_counter += 1
    if text[0].chr != text[0].chr.capitalize && text[-1] =~ /[^.?!]/
        p "You forgot to capitalize AND didn't punctuate with . or ? or !"
        return false
        @full_counter += 1 
    elsif text[0].chr != text[0].chr.capitalize
        p "You forgot to capitalise the first word!"
        return false
        @full_counter += 1
    elsif text[-1] =~ /[^.?!]/
        p "You forgot to/didn't punctuate appropriately at the end with . or ? or !"
        return false
        @full_counter += 1
    else
        p "Great! This sentence looks great!"
        @pass_counter += 1
        @full_counter += 1
        return true
    end
    end
    
    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the `check` method. The number 55 represents 55%.
      (@pass_counter * 100) / @full_counter
    end
end