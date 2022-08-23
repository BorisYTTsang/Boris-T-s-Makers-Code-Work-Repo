class TodoList
  
  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def new_task(task)
    fail "Please enter a String!" if task.class != String
    @tasks << task
  end
end