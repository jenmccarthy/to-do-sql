require 'spec_helper'

# require 'lists'
# require 'pg'
# require 'rspec'

# DB = PG.connect({:dbname => 'to_do1_test'})

# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM lists *;")
#   end
# end

describe List do
  it 'will initialize with a hash the lists information' do
    test_list = List.new({'name' => 'home', 'id' => 1})
    expect(test_list).to be_an_instance_of List
  end

  it 'tells you its name and list_id' do
    test_list = List.new({'name' => 'home', 'id' => 1})
    expect(test_list.name).to eq 'home'
    expect(test_list.id).to eq 1
  end

  it 'creates a place to hold all list entries' do
    expect(List.all).to eq []
  end

  it 'allows list entries to be saved' do
    test_list = List.new({'name' => 'home', 'id' => 1})
    test_list.save
    expect(List.all).to eq [test_list]
  end

  it 'will know that the objects are the same if they have the same name and ID' do
    test_list = List.new({'name' => 'home', 'id' => 1})
    another_test_list = List.new({'name' => 'home', 'id' => 1})
    expect(test_list).to eq another_test_list
  end

end
