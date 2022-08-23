require "diary.rb"
require "todolist.rb"

=begin

# diary.add_todo("Buy shampoo.")
# diary.show_todos
#     => ["Buy shampoo."]
# diary.show_todos
#     => []
# diary.add_todo(nil)
#     => ArgumentError
# diary.add_todo("Task 1", "Task 2")
#     => ArgumentError
# diary.add_todo(123)
#      => "Please enter a String!"
# diary.add_todo(["Task"])
#      => "Please enter a String!"

=end

RSpec.describe "Diary and Todos Integration" do
    it "adds and shows single new todo" do
        diary = Diary.new
        diary.add_todo("Buy shampoo.")
        expect(diary.show_todos).to eq ["Buy shampoo."]
    end

    it "adds and shows multiple new todos" do
        diary = Diary.new
        diary.add_todo("Buy shampoo.")
        diary.add_todo("Buy salad.")
        diary.add_todo("Buy squigee.")
        expect(diary.show_todos).to eq ["Buy shampoo.", "Buy salad.", "Buy squigee."]
    end
    
    describe "#show_todos integration" do
        context "when no todos added" do
            it "should return an empty list" do
                diary = Diary.new
                expect(diary.show_todos).to eq []
            end
        end
    end

    describe "#add_todo integration" do
        context "when no arguments added" do
            it "raises ArgumentError" do
                diary = Diary.new
                expect{ (diary.add_todo) }.to raise_error(ArgumentError)
            end
        end

        context "when multiple arguments given" do
            it "raises ArgumentError)" do
                diary = Diary.new
                expect{ (diary.add_todo("Task 1", "Task 2")) }.to raise_error(ArgumentError)
            end
        end

        context "when integer given" do
            it "raises RuntimeError (not a String)" do
                diary = Diary.new
                expect{ (diary.add_todo(123)) }.to raise_error "Please enter a String!"
            end
        end

        context "when array given" do
            it "raises RuntimeError (not a String)" do
                diary = Diary.new
                expect{ (diary.add_todo(["Task"])) }.to raise_error "Please enter a String!"
            end
        end
    end

    describe "#list_contacts integration" do
        it "extracts mobile numbers from both diary and todolist" do
            diary = Diary.new
            diary.add("Sophie - 07333333333")
            diary.add_todo("This is Dad's new no. 07222222222")
            expect(diary.list_contacts).to eq ["07333333333", "07222222222"]
        end
    end
end

