require_relative 'todo'

describe TodoParser do
  it "parse csv data and save as new csv" do
  end

  let(:test_parser){TodoParser.new}

    describe "#parse" do
      it "parse csv data" do
        test_parser.parse
        expect(todo_data.length).not_to eq(0)
      end
    end

    describe "#save" do
      it {}
    end

end

describe Task do
  it "initialize task " do
  end

    describe "#call" do
      
    end

    describe "#list_all" do
      
    end

    describe "#list_by_id" do
      
    end

    describe "#done" do
      
    end

    describe "#delete" do
      
    end

end

describe Console do
  it "shows console screen" do
  end

end