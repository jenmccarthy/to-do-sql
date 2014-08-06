require 'pry'
class List

attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      lists << List.new({'name' => name, 'id' => id})
    end
    lists
  end

  def save
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(test)
    self.name == test.name
  end

  def tasks
    results = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id};")
    tasks = []
    results.each do |result|
      name = result['name']
      list_id = result['list_id'].to_i
      tasks << Task.new({'name' => name, 'list_id' => list_id})
    end
    tasks
  end

end
