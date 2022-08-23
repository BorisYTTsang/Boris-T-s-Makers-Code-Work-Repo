RSpec.describe "doubles challenge" do
  it "creates a sophisticated double" do
    task = double(:fake_task)
    task_list = double(:fake_task_list, add: [task], list: [task], count: 1, clear: :success)
    # ^This line is exactly the same as the below (the formats are interchangeable)
    
    # task_list = double(:fake_task_list)
    # allow(task_list).to receive(:add).and_return([task])
    # allow(task_list).to receive(:list).and_return([task])
    # allow(task_list).to receive(:count).and_return(1)
    # allow(task_list).to receive(:clear).and_return(:success)

    # Don't edit below
    task_list.add(task)
    expect(task_list.list).to eq [task]
    expect(task_list.count).to eq 1
    expect(task_list.clear).to eq :success
  end
end