require "task_list"
require "task"
require "task_formatter"

=begin
# task_formatter = TaskFormatter.new
#     => ArgumentError
# task_formatter = TaskFormatter.new("task_1", "task_2")
#     => ArgumentError
# task_formatter = TaskFormatter.new(123)
#     => Non-String Error
# task_formatter = TaskFormatter.new("Walk the dog")
# task_list.add(task_formatter.format) #calls format from task_formatter(need to initialise)
# task_list.all
#     => ["[ ] Walk the dog"]
# task_formatter = TaskFormatter.new("Walk the dog")
# task_formatter2 = TaskFormatter.new("Buy groceries")
# task_formatter3 = TaskFormatter.new("Replace vacuum filter")
# task_formatter2(task.mark_complete)
# task_list.add(task_formatter.format)
# task_list.add(task_formatter2.format)
# task_list.add(task_formatter3.format)
# task_list.all
#     => ["[ ] Walk the dog", "[x] Buy groceries", "[ ] Replace vacuum filter"]
=end

RSpec.describe "tasks integration tests" do
  describe "task_list and task integration" do
    it "adds tasks to a list" do
      task_list = TaskList.new
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Walk the cat")
      task_list.add(task_1)
      task_list.add(task_2)
      expect(task_list.all).to eq [task_1, task_2]
    end

    it "marks tasks as complete" do
      task_list = TaskList.new
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Walk the cat")
      task_list.add(task_1)
      task_list.add(task_2)
      task_1.mark_complete
      task_2.mark_complete
      expect(task_list.all_complete?).to eq true
    end

    it "adds (mock) task objects and successfully checks completion" do
      task_list = TaskList.new
      task_1 = double(:fake_task, title: "Walk the dog", complete?: true)
      task_2 = double(:fake_task, title: "Walk the cat", complete?: true)
      task_list.add(task_1)
      task_list.add(task_2)
      expect(task_list.all).to eq [task_1, task_2]
      expect(task_list.all_complete?).to eq true
    end
  end

  describe "task_formatter and task integration" do
    context "when initializing with no arguments" do
      it "raises ArgumentError" do
        expect{ (task_formatter = TaskFormatter.new) }.to raise_error(ArgumentError)
      end
    end

    context "when initializing with more than one argument" do
      it "raises ArgumentError" do
        task_1 = Task.new("Take out trash")
        task_2 = Task.new("Go shopping")
        expect{ (task_formatter = TaskFormatter.new(task_1, task_2)) }.to raise_error(ArgumentError)
      end
    end

    context "when initializing with non-String" do
      it "raises Non-Task instance Error" do
        expect{ (task_formatter = TaskFormatter.new("123")) }.to raise_error "Please enter a Task (instance)!"
      end
    end
  end

  describe "task_list, task and task_formatter integration" do
    it "adds a single formatted task to task_list and returns array containing it" do
      task_list = TaskList.new
      task = Task.new("Walk the dog")
      task_formatter = TaskFormatter.new(task)
      task_list.add(task_formatter.format)
      expect(task_list.all).to eq ["- [ ] Walk the dog"]
    end
    
    it "call complete? on initialised task_formatter task instance and adds multiple formatted tasks to task_list and returns array containing them" do
      task_list = TaskList.new
      task = Task.new("Walk the dog")
      task_2 = Task.new("Buy groceries")
      task_3 = Task.new("Replace vacuum filter")
      task_formatter = TaskFormatter.new(task)
      task_formatter_2 = TaskFormatter.new(task_2)
      task_formatter_3 = TaskFormatter.new(task_3)
      task_formatter_2.task.mark_complete
      task_list.add(task_formatter.format)
      task_list.add(task_formatter_2.format)
      task_list.add(task_formatter_3.format)
      expect(task_list.all).to eq ["- [ ] Walk the dog", "- [x] Buy groceries", "- [ ] Replace vacuum filter"]
    end
  
  end


end
