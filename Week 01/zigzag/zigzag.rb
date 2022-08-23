# method changes string to StRiNg
def zigzag(str)
	index = 0
	return str.split("").each_with_index { |x, i| x.upcase!; index if i % 2 == 0 }.join

end


loop do
	puts "Please enter some text:-"
	string = gets.chomp
	puts "Did you enter \"#{zigzag(string)}\"?\nPretty sure you did!\n"
end