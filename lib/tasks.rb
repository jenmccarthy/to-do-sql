class Task
  attr_reader :name, :list_id, :done, :due_date

  def initialize(attributes)
    @name = attributes['name']
    @list_id = attributes['list_id']
    @done = attributes['done']
    @due_date = attributes['due_date']
  end

  def self.all
    results = DB.exec("SELECT * FROM tasks;")
    tasks = []
    results.each do |result|
      name = result['name']
      list_id = result['list_id'].to_i
      done = result['done']
      due_date = result['due_date']
      tasks << Task.new({'name' => name, 'list_id' => list_id, 'done' => done, 'due_date' => due_date})
    end
    tasks
  end

  def save
    DB.exec("INSERT INTO tasks (name, list_id, done, due_date) VALUES ('#{@name}', #{@list_id}, '#{'f'}', '#{@due_date}');")
  end

  def ==(test)
    self.name == test.name && self.list_id == test.list_id
  end

  def delete(task_name)
    DB.exec("DELETE FROM tasks WHERE name = '#{task_name}';")
  end

  def completed?
    self.done == 't'
  end

  def finish
    DB.exec("UPDATE tasks SET done = 't' WHERE name = '#{self.name}';")
    @done = 't'
  end

end
