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
      row
    end
  end

  def save 
    
  end
end

class Task
  
end

class Console
  
end

# t1 = TodoParser.new('todo.csv')
# t1.parse