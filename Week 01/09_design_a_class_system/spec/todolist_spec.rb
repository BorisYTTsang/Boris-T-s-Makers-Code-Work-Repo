require "todolist.rb"

=begin

# todo_list = TodoList.new
# todo_list.tasks
#     => []
# diary.new_task(nil)
#     => ArgumentError
# diary.new_task("Task 1", "Task 2")
#     => ArgumentError
# diary.new_task(123)
#     => "Please enter a String!"
# diary.new_task(["Task"])
#     => "Please enter a String!"
# todo_list = TodoList.new
#     => (constructs TodoList object)

=end

RSpec.describe TodoList do
    it "constructs" do
        todo_list = TodoList.new
    end

    it "adds and shows single task" do
        todo_list = TodoList.new
        todo_list.new_task("Eat")
        expect(todo_list.tasks).to eq ["Eat"]
    end

    it "adds and shows multiple tasks" do
        todo_list = TodoList.new
        todo_list.new_task("Eat")
        todo_list.new_task("Sleep")
        todo_list.new_task("Pee")
        expect(todo_list.tasks).to eq ["Eat", "Sleep", "Pee"]
    end

    describe "#tasks" do
        context "when no tasks added" do
            it "returns an empty todo list" do
                todo_list = TodoList.new
                expect(todo_list.tasks).to eq []
            end
        end
    end

    describe "#new_task" do
        context "when no argument given" do
            it "raises ArgumentError" do
                todo_list = TodoList.new
                expect { (todo_list.new_task) }.to raise_error(ArgumentError)
            end
        end

        context "when multiple arguments given" do
            it "raises ArgumentError" do
                todo_list = TodoList.new
                expect { (todo_list.new_task("Task 1", "Task 2")) }.to raise_error(ArgumentError)
            end
        end

        context "when integer given" do
            it "raises RuntimeError (not a String)" do
                todo_list = TodoList.new
                expect { (todo_list.new_task(123)) }.to raise_error "Please enter a String!"
            end
        end

        context "when array given" do
            it "raises RuntimeError (not a String)" do
                todo_list = TodoList.new
                expect { (todo_list.new_task(["Task"])) }.to raise_error "Please enter a String!"
            end
        end
    end
end