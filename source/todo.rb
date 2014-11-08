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

class TodoParser

  attr_accessor :file_name
  def initialize(file_name = 'todo.csv')
    @file_name = file_name
  end


  def parse
    CSV.foreach(file_name) do |row|
      # row
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
  
end

class Console
  
end
