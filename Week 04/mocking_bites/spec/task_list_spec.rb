require "task_list"

#######################################

class FakeTask
  
  attr_reader :title  
  
  def initialize
    @title = "Mow the lawn."
  end
  
end

#######################################

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour

  describe "#all" do
    describe "--mock--" do
      context "when single tasks given" do
        it "#adds and returns them in list with #all" do
          task_list = TaskList.new
          fake_task = double(:fake_task, title: "Mow the lawn.", complete?: false)
          task_list.add(fake_task.title)
          expect(task_list.all).to eq ["Mow the lawn."]
        end
      end

      context "when multiple tasks given" do
        it "#adds and returns them in list with #all" do
          task_list = TaskList.new
          fake_task = double(:fake_task, title: "Mow the lawn.", complete?: false)
          fake_task_2 = double(:fake_task, title: "Buy salad.", complete?: true)
          fake_task_3 = double(:fake_task, title: "Repair watch strap.", complete?: false)
          task_list.add(fake_task.title)
          task_list.add(fake_task_2.title)
          task_list.add(fake_task_3.title)
          expect(task_list.all).to eq ["Mow the lawn.", "Buy salad.", "Repair watch strap."]
        end
      end
    end
  end

  describe "#all_complete?" do
    describe "--mock--" do
      it "#all_complete? returns false when tasks list is empty" do
        task_list = TaskList.new
        expect(task_list.all_complete?).to eq false
      end

      it "#all_complete? returns false when any task incomplete" do
        task_list = TaskList.new
        fake_task = double(:fake_task, title: "Mow the lawn.", complete?: false)
        fake_task_2 = double(:fake_task, title: "Buy salad.", complete?: true)
        fake_task_3 = double(:fake_task, title: "Repair watch strap.", complete?: false)
        task_list.add(fake_task)
        task_list.add(fake_task_2)
        task_list.add(fake_task_3)
        expect(task_list.all_complete?).to eq false
      end

      it "#all_complete? returns true when all tasks complete" do
        task_list = TaskList.new
        fake_task = double(:fake_task, title: "Mow the lawn.", complete?: true)
        fake_task_2 = double(:fake_task, title: "Buy salad.", complete?: true)
        fake_task_3 = double(:fake_task, title: "Repair watch strap.", complete?: true)
        task_list.add(fake_task)
        task_list.add(fake_task_2)
        task_list.add(fake_task_3)
        expect(task_list.all_complete?).to eq true
      end
    end
  end
end
