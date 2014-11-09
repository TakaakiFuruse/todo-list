require 'csv'
require 'pry'

# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

module TodoParser
  class << self

  def parse(file_name = 'todo.csv')
    CSV.readlines(file_name).map.with_index(1) do |row, ind|
      Task.new(id:ind ,task: row)
    end
  end

  def save 

  end
end

class Task
  attr_accessor :done
  attr_reader :task, :id

  def initialize(arg)
    @id = arg[:id]
    @task = arg[:task]
    @done = arg.fetch(:done, false)
  end 

  def task_done
    self.done = true
  end

  def done_to_s
    self.done ? "[X]" : "[ ]"
  end

  def to_s
    #{self.id} - #{self.done_to_s} #self.
  end

end

class TodoList
  attr_accessor :todo_list

  def initialize(file_name = 'todo.csv')
    @todo_list = TodoParser.parse(file_name)
  end

  def list_by_id(id_num)
    todo_list.each{|n| puts n if n == id_num}
  end
end

class Console
  
end

# t1 = TodoParser.new
# p t1.parse