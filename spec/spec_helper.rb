require 'rspec'
require 'lists'
require 'tasks'
require 'pg'

DB = PG.connect({:dbname => 'to_do1_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
