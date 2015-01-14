require 'csv'
require 'pry'

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
    @done = arg.fetch(:done, "false")
  end 

  def task_done
    self.done = "true"
  end

  def done_to_s
    (self.done == "true") ? "[X]" : "[ ]"
  end

  def to_s
    "#{id} - #{done_to_s} #{task}"
  end

end

