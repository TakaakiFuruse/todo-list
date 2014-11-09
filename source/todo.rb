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
      CSV.readlines(file_name, {:converters => :all}).map do |row|
        Task.new(id: row[0], task: row[1],  done: row[2])
      end
    end
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
    "#{id} - #{done_to_s} #{task}"
  end

end

class TodoList
  attr_accessor :todo_list

  def initialize(file_name = 'todo.csv')
    @todo_list = TodoParser.parse(file_name)
  end

  def list_by_id(id_num)
    #memo : "puts" inside a block -> return value would be nil. 
    # return value and then print out -> you can test also.
    task_found = todo_list.select{|task| task.id.to_i == id_num.to_i}
    task_found == [] ? (puts "Task can't found.") : (puts task_found)
  end

  def list_all
   todo_list.map{|task| puts task.to_s}
  end

  def delete(id_num)
    todo_list.delete_if{|task| task.id == id_num.to_i}
    self.save
  end

  def add_task(task_detail)
    new_id = todo_list[-1].id + 1
    @todo_list << Task.new(id:new_id ,task: task_detail)
    self.save
  end

  def save(file_name = 'todo.csv')
       CSV.open(file_name, 'w') do |csv|
         @todo_list.each do |object|
         csv << [object.id, object.task, object.done]
         end
       end
  end

end

class Console
  attr_accessor :input, :task

  def initialize
    @input = input
    @task = TodoList.new
  end

  def welcome
    puts
    puts
    puts "----TODO LIST------"
    puts "A   - ADD"
    puts "S   - Show a task  "
    puts "L   - List all task"
    puts "Del - Delete task  "
    puts "Q   - Quit program "
    puts
    puts

    input = gets.chomp
    control(input)
  end

  def control(arg)
    case arg 
    when "A" then
      puts "Input your task."
      input = gets.chomp
      task.add_task(input)
      puts "#{input} was added."
      welcome

    when "L" then
      task.list_all
      welcome

    when "S" then
      puts "Task ID ?"
      input = gets.chomp
      task.list_by_id(input)
      welcome

    when "Del" then
      puts "Task ID to Delete ?"
      input = gets.chomp
      task.delete(input)
      welcome

    when "Q" then
      puts "BYE!!"
      exit
    end
  end

end



todo = Console.new
    todo.welcome
    todo.control