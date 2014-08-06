require 'rspec'
require 'tasks'

describe Task do
  it "will initialize with a hash the tasks information" do
    test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1})
    expect(test_task).to be_an_instance_of Task
  end
end
