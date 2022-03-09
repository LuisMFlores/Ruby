require "Board"

describe "Board" do
   
    describe "#initialize" do
    
        let(:board) { Board.new(5) }

        it "should accept a size as a number" do
            expect(board.grid.flatten.count).to eq(25)
        end
    end

end