require_relative "task"

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

  def done_by_id(id_num)
    task_found = todo_list.select{|task| task.task_done if task.id.to_i == id_num.to_i}
    task_found == [] ? (puts "Task can't found.") : (puts "Task done!")
    self.save
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

