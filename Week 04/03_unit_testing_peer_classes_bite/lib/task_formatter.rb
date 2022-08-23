class TaskFormatter

  attr_reader :task

  def initialize(task) # task is an instance of Task
    fail "Please enter a Task (instance)!" unless task.respond_to?(:title)
    @task = task
  end

  def format
    # Returns the task formatted as a string.
    # If the task is not complete, the format is:
    # - [ ] Task title
    # If the task is complete, the format is:
    # - [x] Task title
    if @task.complete?
      return "- [x] #{@task.title}"
    else
      return "- [ ] #{@task.title}"      
    end
  end
end