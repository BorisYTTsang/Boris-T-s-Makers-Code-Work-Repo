require "todolist.rb"

class Diary # takes no arguments
  def initialize
    # ...
    @entries = []
    @todo_list = TodoList.new
  end

  def add(entry) # either entry (String) as argument
    # add entry to diary entries list
    # returns nothing
    fail "Please enter a String!" if entry.class != String
    return @entries << entry
  end

  def read # takes no arguments
    # returns full diary entries list
    return @entries
  end

  def select_readable(minutes, wpm) # takes no arguments
    fail "Please enter only Integers!" if minutes.class != Integer || wpm.class != Integer
    readable_word_count = minutes * wpm
    return @entries.select { |entry| entry.split(" ").size <= readable_word_count }
    # minutes and wpm both integers
    # returns diary entries list filtered by reading time and reading speed(wpm)
  end

  def list_contacts # takes no arguments
    # returns diary entries list filtered by entries containing mobile numbers
    # format mobile numbers so that they'll be able to be checked consistently
    # mobile numbers begin with 07 and are 11 digits long
    # strip spaces (07478 544 087)
     return (@entries + @todo_list.tasks).join.gsub(" ", "").scan(/07\d{9}/).join.chars.each_slice(11).map(&:join)
     # also checks todo_list

     # end
  end

  def add_todo(task) # String
    # call TodoList "new task" instance method
    # returns nothing
    @todo_list.new_task(task)
  end

  def show_todos # no arguments
    # call TodoList getter method
    return @todo_list.tasks
  end
end