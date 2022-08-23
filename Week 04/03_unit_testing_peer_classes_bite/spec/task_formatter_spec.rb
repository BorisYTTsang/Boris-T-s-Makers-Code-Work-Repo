require "task_formatter"

=begin
  task_formatter = TaskFormatter.new
  #     =>ArgumentError
  # task_formatter = TaskFormatter.new("Task 1", "Task 2")
  #     =>ArgumentError
  # task_formatter = TaskFormatter.new(123)
  #     =>Non-String Error
  (mock)


  fake_task = double(:fake_task, title: "Do homework", complete: false)
  task_formatter = TaskFormatter.new(fake_task)
      => ["[ ] Do homework"]
  fake_task = double(:fake_task, title: "Do homework", complete: true)
  task_formatter = TaskFormatter.new(fake_task)
      => "- [x] Go shopping"

  fake_task = double(:fake_task, title: "Do homework", complete: true)
  fake_task2 = double(:fake_task, title: "Clean toilet", complete: false)
  fake_task3 = double(:fake_task, title: "Buy clothes hangers", complete: true)
  task_formatter = TaskFormatter.new(fake_task)
  task_list.add(task_formatter.format)
  task_list.all
      => ["[x] Do homework", "[ ] Clean toilet", "[x] Buy clothes hangers"]
=end

RSpec.describe TaskFormatter do
  describe "--mock--" do
    it "constructs" do
      fake_task = double(:fake_task, title: "Take Korean lessons", complete: false)
      task_formatter = TaskFormatter.new(fake_task)
    end
  end
    
  context "when instantiating with no argument" do
    it "raises ArgumentError" do
      expect{ (task_formatter = TaskFormatter.new) }.to raise_error(ArgumentError)
    end
  end

  context "when instantiating with more than one argument" do
    it "raises ArgumentError" do
      expect{ (task_formatter = TaskFormatter.new("Task 1", "Task 2")) }.to raise_error(ArgumentError)
    end
  end

  context "when non-Task instance given as argument" do
    it "raises Non-Task instance RuntimeError" do
      expect{ (task_formatter = TaskFormatter.new(123)) }.to raise_error "Please enter a Task (instance)!"
    end
  end

  describe "#format" do
    describe "--mock--" do
      it "formats incomplete task correctly with empty tick box" do
        fake_task = double(:fake_task, title: "Walk the dog")
        task_formatter = TaskFormatter.new(fake_task)
        allow(fake_task).to receive(:complete?).and_return(false)
        expect(task_formatter.format).to eq "- [ ] Walk the dog"
      end

      it "formats complete task correctly with ticked box" do
        fake_task = double(:fake_task, title: "Do homework")
        task_formatter = TaskFormatter.new(fake_task)
        allow(fake_task).to receive(:complete?).and_return(true)
        expect(task_formatter.format).to eq "- [x] Do homework"
      end
    end
  end
end