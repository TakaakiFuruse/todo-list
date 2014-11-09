require_relative 'todo'

describe Task do
  let(:test_task) {Task.new({id: 1, task: "test task"})}

    describe "initialize" do
      it "initializes a task " do
        expect(test_task.id).to eq(1)
        expect(test_task.done).to be(false)
      end
    end

    describe "#task_done" do
      it "turn done status to true" do
        test_task.task_done
        expect(test_task.done).to eq(true)
      end
    end


    describe "#done_to_s" do
      it "returns X mark when it's done" do
        test_task.task_done
        expect(test_task.done_to_s).to eq("[X]")
      end
    end
end

describe TodoList do
  let(:test_todolist){TodoList.new}

  it "creates todo list from csv" do
    expect(test_todolist.todo_list.length).not_to eq(0)
  end

  describe "#list_all" do
    it "lists every tasks"
  end

  describe "list_by_id" do
    it "return nil if not found" do
      expect(test_todolist.list_by_id(1000)).to eq(nil)
    end
  end

  describe "#delete" do
    it "delete task" do
      test_todolist.delete(1)
      expect(test_todolist.list_by_id(1)).to eq(nil)
    end
  end

  describe "#add" do
    it "adds task from user input, add last task +1 ID number " do
      test_todolist.add_task("add test task")
      expect(test_todolist.todo_list[-1].task).to eq("add test task")
    end
  end

end

# describe TodoParser do
#   let(:test_parser){TodoParser.new('todo.csv')}
#   let(:test_array) {Array.new}

#     describe "#parse" do
#       it "parse csv, initialize task object, make array " do
#         test_array << test_parser.parse
#         expect(test_array.empty?).to eq(false)
#       end
#     end

#     # describe "#save" do
#     #   it "saves added task "
        # t1 = TodoList.new
        # t1.add_task("test task added")
        # t1.save
#     #   it "saves new task status" {}
#     # end
# end

describe Console do
  it "shows console screen" do
  end
end