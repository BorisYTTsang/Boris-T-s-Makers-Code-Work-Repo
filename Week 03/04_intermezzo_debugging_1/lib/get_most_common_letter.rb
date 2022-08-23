def get_most_common_letter(text)
  counter = Hash.new(0)
  text.gsub!(/[^a-zA-Z]/, "")
  text.chars.each { |char| counter[char] += 1 }
  counter = Hash[counter.sort_by { |k, v| v }.reverse]
  # p counter
  counter.select { |k, v| v == counter.first.last }.keys.join(", ")
end

#######################
# Intended output:
#
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
#######################

=begin

Original code:-
  def get_most_common_letter(text)
    counter = Hash.new(0)
    text.chars.each do |char|
      counter[char] += 1
    end
    counter.to_a.sort_by { |k, v| v }[0][0]
  end

Debugged code v1:-
  def get_most_common_letter(text)
    counter = Hash.new(0)
    text.gsub!(/[^a-zA-Z]/, "")
    text.chars.each { |char| counter[char] += 1 }
    counter.sort_by { |k, v| v }.reverse[0][0]
  end

# Implemented printing multiple same number letters for practice

=end
