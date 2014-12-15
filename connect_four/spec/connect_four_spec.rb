require_relative '../connect_four'

describe ConnectFour do

  let(:connect_four) { ConnectFour.new }
  let(:new_board) { [[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]] }
  let(:used_board) { [["ϴ","Ϯ","ϴ","ϴ",4,5,"Ϯ"],["ϴ","ϴ","ϴ","Ϯ",4,5,"ϴ"],["Ϯ","Ϯ","Ϯ",3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]] }
  
  describe '#start' do
    it 'starts with an empty board' do
      expect(connect_four.board).to eql new_board
    end
  end
  
  describe '#place_piece' do
    it 'places piece correctly on empty board' do
      connect_four.place_piece("ϴ",3)
      test_board = new_board
      test_board[0][2] = "ϴ"
      expect(connect_four.board).to eql test_board
    end
    it 'places piece correctly on used board' do
      connect_four.board = used_board
      connect_four.place_piece("ϴ",3)
      test_board = [["ϴ","Ϯ","ϴ","ϴ",4,5,"Ϯ"],["ϴ","ϴ","ϴ","Ϯ",4,5,"ϴ"],["Ϯ","Ϯ","Ϯ",3,4,5,6],[0,1,"ϴ",3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]]
      expect(connect_four.board).to eql test_board
    end
  end
  
  describe "#display_board" do
    it 'displays empty board correctly' do
      empty_display = "1 2 3 4 5 6 7\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _"
      expect(connect_four.display).to eql empty_display
    end
    it 'displays used board correctly' do
      connect_four.board = used_board
      used_display = "1 2 3 4 5 6 7\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\nϮ Ϯ Ϯ _ _ _ _\nϴ ϴ ϴ Ϯ _ _ ϴ\nϴ Ϯ ϴ ϴ _ _ Ϯ"
      expect(connect_four.display).to eql used_display
    end
  end
  
  describe 'victory conditions' do
    
  end
  
  
end
