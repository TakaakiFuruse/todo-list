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
  let(:test_task) {Task.new({id: 1, task: "test task"})}

  it "creates todo list from csv" do
    expect(test_todolist.todo_list).to eq(13)
  end

    describe "#list_by_id" do
      it "return task with matched id" do
        # expect(test_todolist.list_by_id(1)).to eq(test_task[0].to_s)
        
      end
      
    end

    describe "#list_all" do
      
    end

    describe "#delete" do
      
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
#     #   it "saves added task " {}
#     #   it "saves new task status" {}
#     # end
# end

describe Console do
  it "shows console screen" do
  end
end