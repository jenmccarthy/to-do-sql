class Task
  attr_reader :name, :list_id

  def initialize(attributes)
    @name = attributes['name']
    @list_id = attributes['list_id']
  end
end
