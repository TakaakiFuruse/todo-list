require_relative "todolist"

class Console
  attr_accessor :input, :task

  def initialize
    @input = input
    @task = TodoList.new
  end


  def welcome
    puts ""
    puts "----TODO LIST------"
    puts "A   - ADD"
    puts "S   - Show a task  "
    puts "D   - Finish task"
    puts "L   - List all task"
    puts "Del - Delete task  "
    puts "Q   - Quit program "
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
      puts ""
      task.list_all
      welcome

    when "D" then
      puts "Task ID to finish?"
      input = gets.chomp
      puts ""
      task.done_by_id(input)
      welcome


    when "S" then
      puts "Task ID ?"
      input = gets.chomp
      puts ""
      task.list_by_id(input)
      welcome

    when "Del" then
      puts "Task ID to Delete ?"
      input = gets.chomp
      task.delete(input)
      welcome

    when "Q" then
      puts ""
      puts "BYE!!"
      exit
    end
  end

end

