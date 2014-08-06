require 'spec_helper'

# require 'rspec'
# require 'pg'
# require 'tasks'

# DB = PG.connect({:dbname => 'to_do1_test'})

# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM tasks *;")
#   end
# end

describe Task do
  it 'will initialize with a hash the tasks information' do
    test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1})
    expect(test_task).to be_an_instance_of Task
  end

  it 'tells you its name and list_id' do
    test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1})
    expect(test_task.name).to eq 'wash the windows'
    expect(test_task.list_id). to eq 1
  end

  it 'will create a place to hold all tasks' do
    expect(Task.all).to eq []
  end

  it 'will save all tasks to our class' do
    test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1})
    test_task.save
    expect(Task.all).to eq [test_task]
  end

  it 'will know that the objects are the same if they have the same name and ID' do
    test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1})
    another_test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1})
    expect(test_task).to eq another_test_task
  end

  it 'will delete a task' do
    test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1})
    another_test_task = Task.new({'name' => 'bake a cake', 'list_id' => 1})
    test_task.save
    another_test_task.save
    another_test_task.delete('bake a cake')
    expect(Task.all).to eq [test_task]
  end

  it 'checks for completed status' do
    test_task = Task.new({'name' => 'wash the windows', 'list_id' => 1, "done" => false})
    expect(test_task.completed?).to eq false
  end

end
